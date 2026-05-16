# 70. Climbing Stairs

**Difficulty:** Easy

**Link:** https://leetcode.com/problems/climbing-stairs/

## Description

You are climbing a staircase. It takes `n` steps to reach the top.

Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?

## Test Cases

**Example 1:**
```
Input:  n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
```

**Example 2:**
```
Input:  n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

**Constraints:**
- `1 <= n <= 45`

## Solution 1

See [`solution01.swift`](./solution01.swift).

### Approach

Naive recursion based on the Fibonacci recurrence: the number of ways to reach step `n` is the sum of the ways to reach step `n-1` (taking one final step) and step `n-2` (taking a final two-step). Base cases return directly for `n == 0`, `1`, and `2`, and every other call branches into two recursive calls.

This recomputes the same subproblems exponentially many times, which causes a **Time Limit Exceeded** (31 / 45 testcases passed).

- **Time:** O(2^n)
- **Space:** O(n) (recursion stack)

### Submission Results

- **Status:** Time Limit Exceeded (31 / 45 testcases passed)

## Solution 2

See [`solution02.swift`](./solution02.swift).

### Approach

Same Fibonacci recurrence as Solution 1, but with **memoization** via a dictionary `stairs: [Int: Int]` that caches the result for each `n`. Before recursing, the function checks the cache and returns the stored value if present; otherwise it computes `climbStairs(n-1) + climbStairs(n-2)`, stores it, and returns it. Base case `n < 2` returns `1`.

Caching collapses the exponential call tree so each value of `n` is computed only once.

- **Time:** O(n)
- **Space:** O(n) (cache + recursion stack)

### Submission Results

- **Runtime:** 0 ms (beats 100.00%)
- **Memory:** 19.20 MB (beats 75.84%)