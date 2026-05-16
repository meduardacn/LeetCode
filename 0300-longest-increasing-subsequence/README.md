# 300. Longest Increasing Subsequence

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/longest-increasing-subsequence/

## Description

Given an integer array `nums`, return the length of the longest strictly increasing subsequence.

## Test Cases

**Example 1:**
```
Input:  nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

**Example 2:**
```
Input:  nums = [0,1,0,3,2,3]
Output: 4
```

**Example 3:**
```
Input:  nums = [7,7,7,7,7,7,7]
Output: 1
```

**Constraints:**
- `1 <= nums.length <= 2500`
- `-10^4 <= nums[i] <= 10^4`

## Solution 1

See [`solution01.swift`](./solutio01.swift).

### Approach

Dynamic programming with an auxiliary array of `(value, length)` pairs, where `length` is the LIS length ending at `value`. Iterate through `nums` and, for each `num`:

1. Start with `numLen = 1` (the subsequence containing only `num`).
2. Scan every previously recorded pair: if `num > sub.value`, then `num` can extend that subsequence, so update `numLen = max(numLen, sub.length + 1)`.
3. Track the running maximum in `longest`.
4. Append `(num, numLen)` to the list so future numbers can extend through it.

The nested scan over already-seen elements makes this O(n²).

- **Time:** O(n²)
- **Space:** O(n)

### Submission Results

- **Runtime:** 23 ms (beats 63.64%)
- **Memory:** 19.27 MB (beats 91.98%)
