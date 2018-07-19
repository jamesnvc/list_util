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
    maximum([c,b,a,d], d).

empty(fail) :-
    maximum([], _).

'list unbound' :-
    maximum(List, 90),
    List = [90, 3, 7, 6, 5].

'both unbound' :-
    maximum(List, Max),
    Max = z,
    List = [z, k, r, t, v, u, j].

'maximum by age' :-
    people(People),
    maximum_by(age, People, Person),
    Person == person("Will", 63).

'maximum with name' :-
    people(People),
    maximum_with(person_name, People, Person),
    Person == person("Will", 63).

'maxmimum with name stable order' :-
    maximum_with(length, [[a, b], [c, d], [e]], Max1),
    Max1 = [a, b],
    maximum_with(length, [[c, d], [a, b], [e]], Max2),
    Max2 = [c, d].
