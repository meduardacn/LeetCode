# 98. Validate Binary Search Tree

**Difficulty:** Medium

**Link:** https://leetcode.com/problems/validate-binary-search-tree/

## Description

Given the `root` of a binary tree, determine if it is a valid binary search tree (BST).

A **valid BST** is defined as follows:

- The left subtree of a node contains only nodes with keys **less than** the node's key.
- The right subtree of a node contains only nodes with keys **greater than** the node's key.
- Both the left and right subtrees must also be binary search trees.

## Test Cases

**Example 1:**
```
Input:  root = [2,1,3]
Output: true
```

**Example 2:**
```
Input:  root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

**Constraints:**
- The number of nodes in the tree is in the range `[1, 10^4]`.
- `-2^31 <= Node.val <= 2^31 - 1`

## Solution

See [`solution.swift`](./solution.swift).

### Approach

A valid BST produces a **strictly increasing sequence** when traversed in-order, so the check reduces to verifying that property on the fly.

1. Add an `inOrder` helper on `TreeNode` that recursively visits `left`, the current node, then `right`, invoking a closure on each visited value.
2. In `isValidBST`, track the previously visited value in `last` and a running `isValid` flag.
3. For each visited `val`, if `last` exists and `val <= last`, the BST invariant is violated — set `isValid = false`. Then update `last = val`.
4. Return `isValid` once traversal completes.

Using `<=` (not `<`) rejects duplicate values, which is required since BST keys must be strictly less / strictly greater.

- **Time:** O(n) — each node is visited exactly once.
- **Space:** O(h) — recursion stack proportional to tree height.

### Submission Results

- **Runtime:** 0 ms (beats 100.00%)
- **Memory:** 19.84 MB (beats 91.76%)
