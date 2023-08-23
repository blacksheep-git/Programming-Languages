#!/bin/gprolog --consult-file

% This program shows how to "unit test" a predicate, named foo.
% The first foo fact prevents an "existence_error".
% The second foo fact models the predicate under test,
% which might evaluate to true or false, 

:- include('meet.pl').
test1 :- false.

main :- (test1,
	 write('PASS');
	 write('FAIL')),
	nl, halt.

:- initialization(main).
