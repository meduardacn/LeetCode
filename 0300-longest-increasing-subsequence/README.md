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

## Solution 2

See [`solution02.swift`](./solution02.swift).

### Approach

Patience sorting with a `tails` array, where `tails[i]` holds the smallest possible tail value of any increasing subsequence of length `i + 1` seen so far. Iterate through `nums` and, for each `num`:

1. Find the leftmost position in `tails` whose value is `>= num` via a linear `firstIndex(where:)` scan.
2. If such a position exists, replace `tails[pos]` with `num` — this keeps tails minimal so future numbers have more room to extend.
3. Otherwise `num` is greater than every tail, so append it and grow the longest subsequence by one.

`tails` is not the LIS itself, but its length equals the LIS length. The linear search per element keeps this at O(n²) in the worst case, though it tends to be faster in practice than solution 1 because the inner work is a single array scan instead of a per-pair comparison.

- **Time:** O(n²)
- **Space:** O(n)

### Submission Results

- **Runtime:** 05 ms (beats 72.04%)
- **Memory:** 19.06 MB (beats 99.46%)

## Solution 3

See [`solution03.swift`](./solution03.swift).

### Approach

Same patience-sorting idea as solution 2, but replace the linear `firstIndex(where:)` scan with a binary search. Because `tails` is maintained in strictly increasing order, we can locate the leftmost index where `tails[pos] >= num` in O(log n):

1. Binary-search `tails` for the insertion point of `num` (lower bound).
2. If the returned position equals `tails.count`, `num` extends the longest subsequence — append it.
3. Otherwise, overwrite `tails[pos]` with `num` to keep tails minimal.

This is the optimal LIS-length algorithm.

- **Time:** O(n log n)
- **Space:** O(n)

### Submission Results

- **Runtime:** 0 ms (beats 100.0%)
- **Memory:** 19.24 MB (beats 91.40%)