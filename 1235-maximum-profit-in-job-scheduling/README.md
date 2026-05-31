# 1235. Maximum Profit in Job Scheduling

**Difficulty:** Hard

**Link:** https://leetcode.com/problems/maximum-profit-in-job-scheduling/

## Description

We have `n` jobs, where every job is scheduled to be done from `startTime[i]` to `endTime[i]`, obtaining a profit of `profit[i]`.

Given the `startTime`, `endTime` and `profit` arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.

If you choose a job that ends at time `X` you will be able to start another job that starts at time `X`.

## Test Cases

**Example 1:**
```
Input:  startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
Output: 120
Explanation: The subset chosen is the first and fourth job. Profit obtained 120 = 50 + 70.
```

**Example 2:**
```
Input:  startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
Output: 150
Explanation: The subset chosen is the first, fourth and fifth job. Profit obtained 150 = 20 + 70 + 60.
```

**Constraints:**
- `1 <= startTime.length == endTime.length == profit.length <= 5 * 10^4`
- `1 <= startTime[i] < endTime[i] <= 10^9`
- `1 <= profit[i] <= 10^4`

## Solution

See [`solution.swift`](./solution.swift).

### Approach

Sort jobs by end time, then use DP with binary search. `dp[i]` stores the maximum profit using the first `i` jobs (after sorting).

For each job `i`, decide between:
- **Skip it:** profit stays `dp[i - 1]`.
- **Take it:** add `job.profit` to `dp[lo]`, where `lo` is the largest index whose job ends at or before the current job's start (found with binary search on the sorted end times).

The recurrence is `dp[i] = max(dp[i - 1], dp[lo] + job.profit)`. The answer is `dp[n]`.

- **Time:** O(n log n) — sorting plus a binary search per job.
- **Space:** O(n) — dp array and the sorted jobs array.

### Submission Results

- **Runtime:** 82 ms (beats 31.58%)
- **Memory:** 22.10 MB (beats 68.42%)
