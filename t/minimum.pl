:- use_module(library(list_util)).
:- use_module(library(record)).

:- record person(name:string, age:positive_integer).

people([ person("John", 27)
       , person("Tom", 30)
       , person("Sue", 18)
       , person("Will", 63)
       ]).

% compare people by age
age(Order, A, B) :-
    person_age(A, AgeA),
    person_age(B, AgeB),
    compare(Order, AgeA, AgeB).

:- use_module(library(tap)).

atoms :-
    minimum([c,b,a,d], a).

empty(fail) :-
    minimum([], _).

'list unbound' :-
    minimum(List, 3),
    List = [9, 3, 7, 6, 5].

'both unbound' :-
    minimum(List, Minimum),
    Minimum = j,
    List = [z, k, r, t, v, u, j].

'minimum by age' :-
    people(People),
    minimum_by(age, People, Person),
    Person == person("Sue", 18).

'minimum with name' :-
    people(People),
    minimum_with(person_name, People, Person),
    Person == person("John", 27).

'minimum with name stable order' :-
    minimum_with(length, [[a], [b], [c, d]], Min1),
    Min1 = [a],
    minimum_with(length, [[b], [a], [c, d]], Min2),
    Min2 = [b].
