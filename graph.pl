%******************************************************************************
% *
% * Name:	        Kirubel Tesfaye
% *
% * Date:	        May 7, 2018
% *
% * Assignment:	        Homework 9
% *
% * Purpose:	        Graph implementation
% *
% *****************************************************************************

% Start with directed edges, then edges
dirEdge(a,b). dirEdge(a,c).
dirEdge(b,c). dirEdge(b,d). dirEdge(b,e).
dirEdge(c,d).

dirEdge(f,g). dirEdge(f,h).
dirEdge(g,h).

% Create a directed edge between the given edges
edge(X,Y) :- dirEdge(X,Y).
edge(X,Y) :- dirEdge(Y,X).

% Check for a complete graph
complete([]).
complete([N|V]) :- edgeEvery(N,V), complete(V).

edgeEvery(_, []).
edgeEvery(N, [Q|T]) :- edge(N,Q), edgeEvery(N,T).

% Subset of a list
% If empty, the only subset is the empty list
subset([], []).
% We can either not include the first element...
subset([_|T], S) :- subset(T, S).
% Or include the first element
subset([H|T], [H|S]) :- subset(T, S).

% Find the subgraphs that are complete as well
completeSubgraph([],_).
completeSubgraph(V, S) :- subset(V, S), complete(S).

% Find all complete subraphs
completeSubgraphs([],[]).
completeSubgraphs(List, Result) :- findall(Sub, completeSubgraph(List, Sub), Result).

% Take a list find the largest ones
longestList([L], L).
longestList([H|T], H) :-
    % Find all the lists that have the greatest number. If there are more than one,
    % just find those too
   length(H, N),
   longestList(T, X),
   length(X, M),
   N >= M.
% Recursively check the rest of the lists
longestList([_|T], X) :- longestList(T, X).

% First find all the complete subgraphs, and check those against the filtered long subgraphs, and find those that are in both
largestCompleteSubgraph([],[]).
largestCompleteSubgraph(List, Longest) :- completeSubgraphs(List, Long), longestList(Long, Longest).


