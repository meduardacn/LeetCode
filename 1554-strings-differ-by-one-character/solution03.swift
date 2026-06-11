class Solution {
    func differByOne(_ dict: [String]) -> Bool {
        let charMatrix: [[Character]] = dict.map { Array($0) }
        let wordLen = charMatrix[0].count
        let wordCount = charMatrix.count
        let p = 31
        let mod = 1_000_000_007

        // Precompute full hash for each word
        var hashes = Array(repeating: 0, count: wordCount)
        var powers = Array(repeating: 1, count: wordLen)

        for k in 1..<wordLen {
            powers[k] = (powers[k-1] * p) % mod
        }

        for row in 0..<wordCount {
            for k in 0..<wordLen {
                let c = Int(charMatrix[row][k].asciiValue!)
                hashes[row] = (hashes[row] + c * powers[k]) % mod
            }
        }

        // Per column: subtract that column's contribution and compare
        for col in 0..<wordLen {
            var seen = Set<Int>()
            for row in 0..<wordCount {
                let c = Int(charMatrix[row][col].asciiValue!)
                let h = (hashes[row] - c * powers[col] % mod + mod) % mod
                if seen.contains(h) { return true }
                seen.insert(h)
            }
        }
        return false
    }
}
