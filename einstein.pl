%******************************************************************************
% *
% * Name:	        Kirubel Tesfaye
% *
% * Date:	        May 7, 2018
% *
% * Assignment:	        Homework 9
% *
% * Purpose:	        Einstein puzzle
% *
% *****************************************************************************

% Solve the einstein puzzle
einstein(Solution) :-
    Solution = [house(h1, _, _, _, _, _),
		house(h2, _, _, _, _, _),
		house(h3, _, _, _, _, _),
		house(h4, _, _, _, _, _),
		house(h5, _, _, _, _, _)],
    % Here are some relations based on the following input
    % member(house(house, nationality, color, drink, smoke, pet) Solution).
    member(house(_, englishman, red, _, _, _), Solution),
    member(house(_, spaniard, _, _, _, dog), Solution),
    member(house(_, _, green, coffee, _, _), Solution),
    member(house(_, ukrainain, _, tea, _, _), Solution),
    member(house(A, _, green, _, _, _), Solution),
    member(house(B, _, ivory, _, _, _), Solution),
    right_of(A, B),
    member(house(_, _, _, _, oldGold, snails), Solution),
    member(house(_, _, yellow, _, kools, _), Solution),
    member(house(h3, _, _, milk, _, _), Solution),
    member(house(h1, norwegian, _, _, _, _), Solution),
    member(house(C, _, _, _, chesterfields, _), Solution),
    member(house(D, _, _, _, _, fox), Solution),
    next_to(C, D),
    member(house(E, _, _, _, kools, _), Solution),
    member(house(F, _, _, _, _, horse), Solution),
    next_to(E, F),
    member(house(_, _, _, orangeJuice, luckyStrike, _), Solution),
    member(house(_, japanese, _, _, parliaments, _), Solution),
    member(house(G, norwegian, _, _, _, _), Solution),
    member(house(H, _, blue, _, _, _), Solution),
    next_to(G, H),
    member(house(_, _, _, water, _, _), Solution),
    member(house(_, _, _, _, _, zebra), Solution).

% Check which house is to the left 
left_of(h1, h2).
left_of(h2, h3).
left_of(h3, h4).
left_of(h4, h5).
% and to the right
right_of(X, Y) :- left_of(Y, X).

% And then generaly check if two houses are next to each other.
next_to(X, Y) :- left_of(X, Y).
next_to(X, Y) :- right_of(X, Y).



		    
