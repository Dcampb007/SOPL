/**
Andre Campbell
Logic Programming 1
**/

/**
Note this assignment should be run with the test cases wrapped in once() functions
**/

% Problem 1
% Write a predicate sum-up-numbers-simple(L, N). 
% L is a list, which may contain as elements numbers and non-numbers. 
% The predicate is true if N is the sum of the numbers not in nested lists in L.
% If there are no such numbers, the result is zero.

% Function will sum the numbers, then check if N equals the sumed values
sum-up-numbers-simple([],0). % Base case
sum-up-numbers-simple([Head|Tail], N) :- % If Head is a number, add it to Res
	number(Head),
	sum-up-numbers-simple(Tail, Res),
	N is Head + Res.
sum-up-numbers-simple([Head|Tail], N) :- % Else 
	\+number(Head),
	sum-up-numbers-simple(Tail, N).

% Problem 2
% Write a predicate sum-up-numbers-general(L, N). L is a list, which may
% contain as elements numbers and non-numbers. The predicate is true if N 
% is the sum of all the numbers (including those in nested lists) in L. 
% If there are no such numbers, the result is zero.
sum-up-numbers-general([],0). % Base case
sum-up-numbers-general([Head|Tail], N) :- % If Head is a number, add it to Res
	number(Head),
	sum-up-numbers-general(Tail, Res),
	N is Head + Res.
sum-up-numbers-general([Head|Tail], N) :- % Else if Head is a list, add the two results
	is_list(Head),
	sum-up-numbers-general(Head, A),
	sum-up-numbers-general(Tail, B),
	N is A + B.
sum-up-numbers-general([_|Tail], N) :- % Else
	sum-up-numbers-general(Tail, N).

% Problem 3
% Write a predicate min-above-min(L1, L2, N). L1 and L2 are both simple lists,
% which do not contain nested lists. Both lists may have non-numeric elements. The predicate is
% true if N is the minimum of the numbers in L1 that are larger than the smallest number in L2.
% If there is no number in L2, all the numbers in L1 should be used to calculate the minimum. If
% there is no number in L1 larger than the smallest number in L2, the predicate is false.
min-above-min([], _, _) :- false. % if L1 is empty, the whole thing is false
min-above-min(L1, L2, N) :- % If L2 is empty and N is in L1
    L2 == [],
	member(N, L1).
min-above-min(L1, L2, N) :- % If N is greater than the smallest value in L2 and N is in L1
    L2 \== [],
    find-min(L2, L2Min), 
	member(N, L1),
	N > L2Min.

% Assuming we are only dealing with positive numbers,
find-min([], 2147483647). % If list is empty, smallest number is a very large number
find-min([Head|Tail], MinVal) :- % if Head is smaller, update new minimum
	number(Head),
	find-min(Tail, TempMax),
	Head < TempMax,
	MinVal is Head.
find-min([Head|Tail], MinVal) :-  % If head is larger or equal, stay the same
	number(Head),
	find-min(Tail, TempMax),
	Head >= TempMax,
	MinVal is TempMax.
find-min([_|Tail], MinVal) :- % Else
	find-min(Tail, MinVal).


% Problem 4
% Write a predicate common-unique-elements(L1,L2,N). L1 and L2 are both
% general lists, which may contain nested lists. The predicate is true 
% if N is a simple list (i.e. a list without sub-lists) of the items that 
% appear in both L1 and L2 (including the sub-lists within).
% The elements in the result list must be unique.
common-unique-elements(_, _, []) :- true.
common-unique-elements(L1, L2, [Head|Tail]) :- % If Head is in both L1 and L2, then it's common
	nested-member(Head, L1),
	nested-member(Head, L2),
	common-unique-elements(L1, L2, Tail).

nested-member(X, [X|_]).                 % If X is the first element
nested-member(X, [Head|_]) :- nested-member(X, Head). % If X is inside of the first element
nested-member(X, [_|Tail]) :- nested-member(X, Tail). % If X is a member of tail