# 704. Binary Search

**Difficulty:** Easy

**Link:** https://leetcode.com/problems/binary-search/

## Description

Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, then return its index. Otherwise, return `-1`.

You must write an algorithm with `O(log n)` runtime complexity.

## Test Cases

**Example 1:**
```
Input:  nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4.
```

**Example 2:**
```
Input:  nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1.
```

**Constraints:**
- `1 <= nums.length <= 10^4`
- `-10^4 < nums[i], target < 10^4`
- All the integers in `nums` are **unique**.
- `nums` is sorted in ascending order.

## Solution

See [`solution.swift`](./solution.swift).

### Approach

Classic binary search, implemented recursively over a `[low, high]` window.

1. `search` kicks off the recursion with the full range `0...nums.count - 1`.
2. `recurBS` computes `mid = (low + high) / 2` and compares `nums[mid]` against `target`:
   - If equal, return `mid`.
   - If `target` is greater, recurse on the right half (`mid + 1 ... high`).
   - If `target` is smaller, recurse on the left half (`low ... mid - 1`).
3. When `low > high`, the window is empty and the target is not present — return `-1`.

Halving the search range at each step gives the required logarithmic runtime.

- **Time:** O(log n) — the search range halves at each recursive call.
- **Space:** O(log n) — recursion stack depth proportional to the number of halvings.

### Submission Results

- **Runtime:** 0 ms (beats 100%)
- **Memory:** 19.66 MB (beats 43.54%)