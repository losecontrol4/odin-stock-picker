# odin-stock-picker

This is the third odin project project using ruby. As the name suggests, the goal is to take an array of numbers representing a stock over time, and select what was the best time to buy and sell it in this timeframe (you can only buy and sell once and you have to return the "days" of when to buy and sell).

As this is a well known problem I solved with brute force before, I attempted to up the efficiency a bit, reducing the amount of passes needed. Without employing any tricks, a programmer would approach this problem by comparing each value to all values after it, and keep track of the max distance, and indicies of the values that create the max distance. Well since this creates a triangle shapped nested loop, the efficiency would be estimated at n(n - 1)/2 (Gauss's sum of a range equation) which evaluates to O(n^2).

Well, well, well. I solved this problem needing two passes through 2n, which evaluates to O(n). (You really only need one pass through, I just seperated finding the peaks and pits into another function, adding readibility at the cost of an extra pass through (n minus values that aren't peaks or pits)). After drawing a few too many visualiations, I realized that if a pit is greater then or equal to a pit that came before it, then it would not affect the answer. Therefore, you only have to go through once, checking the current smallest pit with each value, if it is greater than the previous max distance, then set that as the max distance and take note of those locations.

**note when I say runtime and big O notation I am just accounting for comparisons, I am not paying attention to ram usage (while that would also be O(n), O(1) is totally possible for storage, but it takes away a lot of readiblity in my opinion**
