%******************************************************************************
% *
% * Name:	        Kirubel Tesfaye
% *
% * Date:	        May 7, 2018
% *
% * Assignment:	        Homework 9
% *
% * Purpose:	        List implementation
% *
% *****************************************************************************

% Take two lists as arguments and is true if the second list is the first list with every element duplicated
dubList([], []).
% Take the first thing from first list and check it against the first two of the second
dubList([A|X], [A|[A|Y]]):- dubList(X,Y).

% Take three arguments, two lists and an integer N, and is true if the second list is the first list with every element duplicated N times.
dubListTimes([], [], _).
dubListTimes([H|T], L, N) :-
    % Check the first element from the list is properly duplicated
    times(H, A, N),
    % Check if the list is the one that is duplicated properly
    append(A, B, L),
    % Check for the rest of the list
    dubListTimes(T, B, N). 

% Take an item and check if it is duplicated N times
times(_, [], 0).
times(H, [H|T], N) :- D is N - 1, D >= 0, times(H, T, D).

% Take three arguments, two lists and an integer N, and is true if the second list is the first list with every element duplicated N times.
thirdToLast(Third, List):- append(_, [Third|End], List), length(End, 2).
 
