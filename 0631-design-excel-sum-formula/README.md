# 631. Design Excel Sum Formula

**Difficulty:** Hard

**Link:** https://leetcode.com/problems/design-excel-sum-formula/

## Description

Design the basic function of Excel and implement the function of the sum formula.

Implement the `Excel` class:

- `Excel(int height, char width)` Initializes the object with the `height` and the `width` of the sheet. The sheet is an integer matrix `mat` of size `height x width` with the row index in the range `[1, height]` and the column index in the range `['A', width]`. All the values should be **zero** initially.
- `void set(int row, char column, int val)` Changes the value at `mat[row][column]` to `val`.
- `int get(int row, char column)` Returns the value at `mat[row][column]`.
- `int sum(int row, char column, List<String> numbers)` Sets the value at `mat[row][column]` to be the sum of cells represented by `numbers` and returns the value at `mat[row][column]`. This sum formula **should exist** until this cell is overlapped by another value or another sum formula. `numbers` is a list of strings that each element is either a cell such as `"ColRow"` or a range of cells such as `"ColRow1:ColRow2"`.

## Test Cases

**Example 1:**
```
Input:
["Excel","set","sum","set","get"]
[[3,"C"],[1,"A",2],[3,"C",["A1","A1:B2"]],[2,"B",2],[3,"C"]]
Output: [null, null, 4, null, 6]

Explanation:
Excel excel = new Excel(3, "C");
// construct a 3*3 2D array with all zero.
//   A B C
// 1 0 0 0
// 2 0 0 0
// 3 0 0 0
excel.set(1, "A", 2);
// set mat[1]["A"] to be 2.
//   A B C
// 1 2 0 0
// 2 0 0 0
// 3 0 0 0
excel.sum(3, "C", ["A1","A1:B2"]); // return 4
// set mat[3]["C"] to be the sum of value at mat[1]["A"] and the values sum of the rectangle range whose top-left cell is mat[1]["A"] and bottom-right cell is mat[2]["B"].
//   A B C
// 1 2 0 0
// 2 0 0 0
// 3 0 0 4
excel.set(2, "B", 2);
// set mat[2]["B"] to be 2. Note mat[3]["C"] should also be changed.
//   A B C
// 1 2 0 0
// 2 0 2 0
// 3 0 0 6
excel.get(3, "C"); // return 6
```

**Constraints:**
- `1 <= height <= 26`
- `'A' <= width <= 'Z'`
- `1 <= row <= height`
- `'A' <= column <= width`
- `-100 <= val <= 100`
- `1 <= numbers.length <= 5`
- `numbers[i]` has the format `"ColRow"` or `"ColRow1:ColRow2"`.
- At most `100` calls will be made to `set`, `get`, and `sum`.

## Solution

See [`solution.swift`](./solution.swift).

### Approach

Each cell stores three things: its current `value`, the formula it was defined by (`numbers`, empty for plain values), and an `isDirty` flag indicating whether its cached `value` may be out of date. The sheet itself is a dictionary keyed by `"ColRow"` strings.

1. **`set`** clears the cell's formula, writes the literal value, and marks every cell dirty so any downstream formula recomputes on its next `get`.
2. **`sum`** stores the formula on the target cell, marks the sheet dirty, then immediately computes and caches the result by calling `computeSum`.
3. **`get`** returns the cached `value` directly when the cell has no formula. Otherwise, if the cell is dirty, it re-evaluates the formula via `computeSum` (which recurses through `get`, so transitive dependencies are refreshed lazily on demand) and clears the dirty flag.
4. **`computeSum`** walks the formula tokens, expanding `A1:B2`-style ranges into the rectangle of cells between the two corners and summing each via `get`.

Marking the whole sheet dirty on every write is coarse but simple — recomputation only happens when a dependent cell is actually read, which keeps `get` cheap for unchanged cells and avoids tracking an explicit dependency graph.

- **Time:** `set` is O(H·W) for the dirty sweep; `sum` and `get` are O(K · R · C) per call in the worst case, where `K` is the number of tokens and `R · C` is the size of the largest range, with recursion through dependent formulas.
- **Space:** O(H·W) for the sheet plus O(K) per cell to store its formula.

### Submission Results

- **Runtime:** 11 ms (beats 66.67%)
- **Memory:** 20.01 MB (beats 100.00%)
