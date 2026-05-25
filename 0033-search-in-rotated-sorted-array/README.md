# 33. Search in Rotated Sorted Array

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/search-in-rotated-sorted-array/

## Description

There is an integer array `nums` sorted in ascending order (with **distinct** values).

Prior to being passed to your function, `nums` is **possibly rotated** at an unknown pivot index `k` (`1 <= k < nums.length`) such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (**0-indexed**). For example, `[0,1,2,4,5,6,7]` might be rotated at pivot index `3` and become `[4,5,6,7,0,1,2]`.

Given the array `nums` **after** the possible rotation and an integer `target`, return *the index of* `target` *if it is in* `nums`*, or* `-1` *if it is not in* `nums`.

You must write an algorithm with `O(log n)` runtime complexity.

## Test Cases

**Example 1:**
```
Input:  nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

**Example 2:**
```
Input:  nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

**Example 3:**
```
Input:  nums = [1], target = 0
Output: -1
```

**Constraints:**
- `1 <= nums.length <= 5000`
- `-10^4 <= nums[i] <= 10^4`
- All values of `nums` are **unique**.
- `nums` is an ascending array that is possibly rotated.
- `-10^4 <= target <= 10^4`

## Solution

See [`solution.swift`](./solution.swift).

### Approach

The rotated array is made up of two sorted halves separated by a pivot (the smallest element). Find the pivot first, then binary search each half.

1. **Locate the pivot** with binary search: compare `nums[mid]` against the last element `nums[n - 1]`. If `nums[mid]` is greater, the pivot lies to the right (`left = mid + 1`); otherwise it lies at or to the left of `mid` (`right = mid - 1`). When the loop exits, `left` points to the pivot index — the start of the smaller, right-hand sorted segment.
2. **Binary search the left segment** (`0 ... left - 1`) using the recursive helper `recurBS`. If the target is found there, return the index.
3. Otherwise **binary search the right segment** (`left ... n - 1`) and return whatever that yields (the index, or `-1`).

Both phases halve the search range at each step, keeping the total work logarithmic.

- **Time:** O(log n) — one log-n pivot search plus two log-n binary searches.
- **Space:** O(log n) — recursion stack for `recurBS`.

### Submission Results

- **Runtime:** 0 ms (beats 100%)
- **Memory:** 19.64 MB (beats 56.05%)