# 1554. Strings Differ by One Character

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/strings-differ-by-one-character/

## Description

Given a list of strings `dict` where all the strings are of the same length.

Return `true` if there are 2 strings that only differ by 1 character in the same index, otherwise return `false`.

## Test Cases

**Example 1:**
```
Input:  dict = ["abcd","acbd","aacd"]
Output: true
Explanation: Strings "abcd" and "aacd" differ only by one character in the index 1.
```

**Example 2:**
```
Input:  dict = ["ab","cd","yz"]
Output: false
```

**Example 3:**
```
Input:  dict = ["abcd","cccc","abyd","abab"]
Output: true
```

**Constraints:**
- The number of characters in `dict` <= 10^5
- `dict[i].length == dict[j].length`
- `dict[i]` should be unique.
- `dict[i]` contains only lowercase English letters.

**Follow up:** Could you solve this problem in `O(n*m)` where `n` is the length of `dict` and `m` is the length of each string.

## Solutions

| # | Approach | Category | Time |
|---|---|---|---|
| 01 | Compare every pair | Brute Force / Strings | O(n²·m) |
| 02 | Column-by-column comparison | Strings + Matrix | O(n·m) |
| 03 | Rolling hash per column | Hashing | O(n·m) |

### Solution 01 — Compare every pair (Brute Force / Strings)

See [`solution01.swift`](./solution01.swift).

Overload the `-` operator on `String` so that `lhs - rhs` returns the number of indices at which the two strings differ. Iterate over every pair `(i, j)` in `dict` and return `true` as soon as a pair has exactly one differing character; otherwise return `false`.

- **Time:** O(n²·m)
- **Space:** O(m)

#### Submission Results

- **Status:** Time Limit Exceeded (64 / 91 testcases passed)

### Solution 02 — Column-by-column comparison (Strings + Matrix)

See [`solution02.swift`](./solution02.swift).

Convert each string to its character array once. For each column `col` from `0..<m`, build a `Set<[Character]>` of every word with the character at `col` removed. If two words produce the same masked sequence at the same column, they differ by exactly one character at that index — return `true`. Reset the set between columns so matches from different columns can't collide.

- **Time:** O(n·m)
- **Space:** O(n·m)

#### Submission Results

- **Status:** Time Limit Exceeded (74 / 91 testcases passed)

### Solution 03 — Rolling hash per column (Hashing)

See [`solution03.swift`](./solution03.swift).

Precompute a single polynomial hash for every word: `h(s) = Σ s[k] · pᵏ (mod M)` with `p = 31`, `M = 1_000_000_007`. For each column `col`, the masked hash (the word's contribution with index `col` removed) is `h(s) − s[col] · p^col`, computed in O(1) per word. Insert each column's masked hashes into a `Set<Int>`; a duplicate within the same column means two words differ at exactly that index.

- **Time:** O(n·m) — O(n·m) to build all hashes, O(n·m) total across the per-column scans.
- **Space:** O(n + m) — `n` stored hashes, `m` precomputed powers, and a per-column set of size up to `n`.

#### Submission Results

- **Runtime:** 238 ms (beats 100.00%)
- **Memory:** 22.64 MB (beats 100.00%)
