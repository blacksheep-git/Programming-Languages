#!/bin/gprolog --consult-file
% Mateo Ortegon
% LA3 - Prolog meet.pl

:- include('data.pl').
:- include('uniq.pl').

% START

timelte(time(HOUR1, MIN1, MORNING), time(HOUR2, MIN2, AFTERNOON)) :- MORNING == 'am', AFTERNOON == 'pm'; 
(MORNING = AFTERNOON, ((HOUR1 < HOUR2); 
(HOUR1 = HOUR2, MIN1 =< MIN2))).

timein((slot(TIMEA1, TIMEA2)), slot(TIMEB1, TIMEB2), ReturnSlot) :- (timelte(TIMEB1, TIMEA1), timelte(TIMEA1, TIMEB2), timelte(TIMEB2, TIMEA2), TIMEA1 \== TIMEA2, TIMEB1 \== TIMEB2, TIMEA1 \== TIMEB2) -> ReturnSlot = slot(TIMEA1, TIMEB2);
     (timelte(TIMEB1, TIMEA1), timelte(TIMEA2, TIMEB2), TIMEA1 \== TIMEA2, TIMEB1 \== TIMEB2) -> ReturnSlot = slot(TIMEA1, TIMEA2).

overlap(SLOT1, SLOT2, SLOT3) :- timein(SLOT1, SLOT2, SLOT3).

overlap(SLOT1, SLOT2, SLOT3) :- timein(SLOT2, SLOT1, SLOT3).

compareslot(Slot, [], Slot).

compareslot(HSLOT, [H|T], Slot) :- free(H, HHSLOT), overlap(HSLOT, HHSLOT, ReturnSlot), compareslot(ReturnSlot, T, Slot).

membermeet(Slot, [H|T]) :- free(H, HSLOT), compareslot(HSLOT, T, Slot).

meet(Slot) :- people(People), membermeet(Slot, People).

% END

people([ann,bob,carla]).

main :- findall(Slot, meet(Slot), Slots),
        uniq(Slots, Uniq),
        write(Uniq), nl, halt.

:- initialization(main).
