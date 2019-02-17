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
sum-up-numbers-simple(L, N) :- sum-up-helper(L, N).

sum-up-helper([],0). % Base case
sum-up-helper([H|T], N) :- % Sum up the values in the list
	sum-up-helper(T, Res), N is H + Res.




