#!/bin/gprolog --consult-file
% Mateo Ortegon
% LA3 - Prolog meetone.pl


:- include('data.pl').

% START

meetone(Person, slot(TIME1, TIME2)) :- free(Person, slot(TIMEA, TIMEB)), compare(slot(TIMEA, TIME1)), compare(slot(TIME2, TIMEB)).

compare(slot(time(HOUR1, MIN1, MORNING), time(HOUR2, MIN2, AFTERNOON))) :- MORNING == 'am', AFTERNOON == 'pm'; 
(MORNING = AFTERNOON, ((HOUR1 < HOUR2); (HOUR1 = HOUR2, MIN1 =< MIN2))).

% END

main :- findall(Person,
		meetone(Person,slot(time(8,30,am),time(8,45,am))),
		People),
	write(People), nl, halt.

:- initialization(main).
