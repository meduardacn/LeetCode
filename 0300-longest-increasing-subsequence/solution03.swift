class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = [Int]()

        for num in nums {
            let pos = binarySearch(tails, target: num)
            if pos == tails.count {
                tails.append(num)      // extend
            } else {
                tails[pos] = num       // replace
            }
        }

        return tails.count
    }

    // finds leftmost index where tails[pos] >= target
    private func binarySearch(_ tails: [Int], target: Int) -> Int {
        var lo = 0
        var hi = tails.count

        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if tails[mid] < target {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }
}