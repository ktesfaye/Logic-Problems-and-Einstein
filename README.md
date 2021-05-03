
## #1 dupList
Write a relation dupList​ that takes two lists as arguments and is true if the second list is
the first list with every element duplicated. So, the query dupList([a,b,c], D).​ should
return D = [a,a,b,b,c,c].

This question was easy. All you have to do was check the first term for the first list to the first two of the second list.

```
dupList([A|X], [A|[A|Y]]):- dupList(X,Y).
```
## #2 dupListTimes
Write a relation dupListTimes​ that takes three arguments, two lists and an integer N, and
is true if the second list is the first list with every element duplicated N times. For
example, the query dupListTimes([a,b], L, 4). ​should return L = [a,a,a,a,b,b,b,b]


Trying to solve this question was a bit tricky. But after fiddling around with it, it was fairly easier. I first created a helper function *times*. *times* takes an item, a list and a number and checks whether that item is duplicated in the list n times.
```
times(H, [H|T], N) :- D is N - 1, D >= 0, times(H, T, D).
```
A problem I was running into with this predicate was that it kept going into infinite recursion. That was caused when D becomes less than 0. So after handling that case, this helper relation worked just fine.

After that the rest is easy. All I had to do was check the first element is properly duped with the number given. And then take grab that list and check it with the second given list. And then recursively do the same for the rest of the list.

## #3 thirdToLast
Write a relation thirdToLast​ that takes an item and a list, and is true if the item is the
third-to-last element of the list.


This one was easy too. All I had to do was break the list into 3 parts.
```
append(_, [Third|End], List).
```
We don't really care about the first term. After breaking it apart like that, just grab the *End* and then make sure its size it 2. So third will be the term 3 spaces from the last.
```
length(End, 2).
```

### Problem 2
In this problem you will write a relation largestCompleteSubgraph ​with two list arguments
that is true if the second list represents the largest complete subgraph of the graph
represented by the first list. A subgraph of a graph is a subset of the vertices in the graph. A
complete graph is a graph where every vertex has edges connecting it to every other vertex.
So, the largest complete subgraph of a graph is the largest subset of the vertices of the graph
that are all adjacent to each other.

Even though this question looks complicated, it is straight forward. First find the subset. After that, check whether those subsets are complete.
```
completeSubgraph(V, S) :- subset(V, S), complete(S).
```
Then filter all of the subgraphs and find the longest ones from those.
```
largestCompleteSubgraph(List, Longest) :- completeSubgraphs(List, Long), longest(Long, Longest).
```

### Problem 3
For this problem, you will write a Prolog program to solve the Einstein puzzle (alternatively
called the zebra puzzle). Below is a text of the problem adapted and altered from the
Wikipedia page zebra puzzle​ (https://en.wikipedia.org/wiki/Zebra_Puzzle). Note that it is
much more important that your program correctly implements that problem than that you
find the right answer — in fact, you can find the answer on Wikipedia, which you can use to
verify that your program works. Your main predicate einstein​ should take only one
argument, which will be a variable that is set to the solution to the problem when called.

The main part for solving this problem is just put in a lot of rules. Every single line is a rule. Using that, prolog is able to figure out which detail goes to which house.

```
% member(house(house, nationality, color, drink, smoke, pet) Solution).
member(house(_, englishman, red, _, _, _), Solution),
member(house(_, spaniard, _, _, _, dog), Solution),
...
```
The tricky part of this puzzle and what I was running into was for the rules that say things like next to and right of. At first the way I was trying to figure out a house's orientation was using math. Keeping track of which is next to the other one by adding 1 and then figuring out based on that.

But that game me too much problems to deal with so I hard coded the left to right relations.
```
left_of(h1, h2).
left_of(h2, h3).
left_of(h3, h4).
left_of(h4, h5).
% and to the right
right_of(X, Y) :- left_of(Y, X).

% And then generaly check if two houses are next to each other.
next_to(X, Y) :- left_of(X, Y).
next_to(X, Y) :- right_of(X, Y).
```

This was able to solve my problem and the output is as follows.

```
OUTPUT: House = [house(h1, norwegian, yellow, water, kools, fox),
                 house(h2, ukrainain, blue, tea, chesterfields, horse),
                 house(h3, englishman, red, milk, oldGold, snails),
                 house(h4, spaniard, ivory, orangeJuice, luckyStrike, dog),
                 house(h5, japanese, green, coffee, parliaments, zebra)] ;
```
