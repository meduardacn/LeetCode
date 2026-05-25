# 153. Find Minimum in Rotated Sorted Array

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/

## Description

Suppose an array of length `n` sorted in ascending order is **rotated** between `1` and `n` times. For example, the array `nums = [0,1,2,4,5,6,7]` might become:

- `[4,5,6,7,0,1,2]` if it was rotated `4` times.
- `[0,1,2,4,5,6,7]` if it was rotated `7` times.

Notice that **rotating** an array `[a[0], a[1], a[2], ..., a[n-1]]` 1 time results in the array `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]`.

Given the sorted rotated array `nums` of **unique** elements, return *the minimum element of this array*.

You must write an algorithm that runs in `O(log n)` time.

## Test Cases

**Example 1:**
```
Input:  nums = [3,4,5,1,2]
Output: 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.
```

**Example 2:**
```
Input:  nums = [4,5,6,7,0,1,2]
Output: 0
Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
```

**Example 3:**
```
Input:  nums = [11,13,15,17]
Output: 11
Explanation: The original array was [11,13,15,17] and it was rotated 4 times.
```

**Constraints:**
- `n == nums.length`
- `1 <= n <= 5000`
- `-5000 <= nums[i] <= 5000`
- All the integers of `nums` are **unique**.
- `nums` is sorted and rotated between `1` and `n` times.

## Solution

See [`solution.swift`](./solution.swift).

### Approach

Binary search for the pivot (the minimum) by comparing the midpoint against the **right** endpoint.

1. Maintain a search window `[left, right]` and loop while `left < right`.
2. Compute `mid = (left + right) / 2` and compare `nums[mid]` to `nums[right]`:
   - If `nums[mid] > nums[right]`, the minimum must lie strictly to the right of `mid` (the window is "wrapped" past the pivot), so `left = mid + 1`.
   - Otherwise, `mid` is still a candidate for the minimum, so shrink from the right with `right = mid` (note: not `mid - 1`).
3. When the loop exits, `left == right` points at the smallest element — return `nums[left]`.

Comparing against `nums[right]` (instead of `nums[0]` or `nums[n - 1]`) keeps the invariant correct as the window shrinks, including the already-sorted (non-rotated) case.

- **Time:** O(log n) — the window halves at each iteration.
- **Space:** O(1) — only a handful of index variables.

### Submission Results

- **Runtime:** 0 ms (beats 100%)
- **Memory:** 19.68 MB (beats 52.40%)