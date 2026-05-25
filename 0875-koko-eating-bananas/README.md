# 875. Koko Eating Bananas

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/koko-eating-bananas/

## Description

Koko loves to eat bananas. There are `n` piles of bananas, the `i`th pile has `piles[i]` bananas. The guards have gone and will come back in `h` hours.

Koko can decide her bananas-per-hour eating speed of `k`. Each hour, she chooses some pile of bananas and eats `k` bananas from that pile. If the pile has less than `k` bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return *the minimum integer* `k` *such that she can eat all the bananas within* `h` *hours*.

## Test Cases

**Example 1:**
```
Input:  piles = [3,6,7,11], h = 8
Output: 4
```

**Example 2:**
```
Input:  piles = [30,11,23,4,20], h = 5
Output: 30
```

**Example 3:**
```
Input:  piles = [30,11,23,4,20], h = 6
Output: 23
```

**Constraints:**
- `1 <= piles.length <= 10^4`
- `piles.length <= h <= 10^9`
- `1 <= piles[i] <= 10^9`

## Solution

See [`solution.swift`](./solution.swift).

### Approach

Binary search on the answer — the eating speed `k`. The valid range is `[1, max(piles)]`: eating faster than the biggest pile never helps because Koko can only target one pile per hour.

1. `minEatingSpeed` runs binary search over `[left, right] = [1, piles.max()!]`, shrinking toward the smallest speed that still finishes in time.
2. For each candidate `mid`, `canFinish` sums the hours needed at that speed. Hours for a single pile is `ceil(pile / speed)`, computed as `(pile + speed - 1) / speed` to avoid floating-point.
3. If `canFinish` is true, `mid` is feasible — pull `right` down to `mid` to look for a slower speed that still works. Otherwise push `left = mid + 1`.
4. The loop ends when `left == right`, which is the minimum feasible speed.

- **Time:** O(n log m) — `n = piles.count`, `m = max(piles)`. Binary search does O(log m) iterations, each scanning all piles.
- **Space:** O(1) — only a handful of integer variables.

### Submission Results

- **Runtime:** 8 ms (beats 43.24%)
- **Memory:** 19.55 MB (beats 74.05%)
