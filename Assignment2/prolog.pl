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
