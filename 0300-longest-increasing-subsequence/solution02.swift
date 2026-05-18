class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = [Int]()

        for num in nums {
            if let pos = tails.firstIndex(where: { $0 >= num }) {
                tails[pos] = num          // replace
            } else {
                tails.append(num)         // extend
            }
        }

        return tails.count
    }
}