class Solution {
    func differByOne(_ dict: [String]) -> Bool {
        let charMatrix: [[Character]] = dict.map { Array($0) }
        let wordLen = charMatrix[0].count
        let matrixLen = charMatrix.count

        for col in 0..<wordLen {
            var seen = Set<[Character]>()
            for row in 0..<matrixLen {
                var word = charMatrix[row]
                word.remove(at: col)
                if seen.contains(word) {
                    return true
                }
                seen.insert(word)
            }
        }
        return false
    }
}