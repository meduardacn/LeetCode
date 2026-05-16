# 27. Remove Element

**Difficulty:** Easy
**Link:** https://leetcode.com/problems/remove-element/

## Description

Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` **in-place**. The order of the elements may be changed. Then return the number of elements in `nums` which are not equal to `val`.

Consider the number of elements in `nums` which are not equal to `val` be `k`. To get accepted, you need to do the following things:

- Change the array `nums` such that the first `k` elements of `nums` contain the elements which are not equal to `val`. The remaining elements of `nums` are not important as well as the size of `nums`.
- Return `k`.

## Test Cases

**Example 1:**
```
Input:  nums = [3,2,2,3], val = 3
Output: 2, nums = [2,2,_,_]
```

**Example 2:**
```
Input:  nums = [0,1,2,2,3,0,4,2], val = 2
Output: 5, nums = [0,1,4,0,3,_,_,_]
```

**Constraints:**
- `0 <= nums.length <= 100`
- `0 <= nums[i] <= 50`
- `0 <= val <= 100`

## Solution 1

See [`solution.swift`](./solution.swift).

### Approach

Iterate through `nums`, collecting elements that are not equal to `val` into a temporary array along with a counter. Assign the temp array back to `nums` and return the count.

- **Time:** O(n)
- **Space:** O(n)

### Submission Results

- **Runtime:** 0 ms (beats 100.00%)
- **Memory:** 20.14 MB (beats 5.18%)

## Solution 2

See [`solution02.swift`](./solution02.swift).

### Approach

Two-pointer in-place: keep a write pointer `k` starting at 0 while a read pointer `i` scans the array. Whenever `nums[i]` is not equal to `val`, copy it to `nums[k]` and advance `k`. Elements equal to `val` are skipped (effectively overwritten by later valid elements). After the loop, the first `k` slots of `nums` hold all the kept elements and `k` is the new length.

- **Time:** O(n) — single pass over `nums`.
- **Space:** O(1) — modifies `nums` in place, no extra array.

### Submission Results

- **Runtime:** 0 ms (beats 100.00%)
- **Memory:** 19.48 MB (beats 73.42%)