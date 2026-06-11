func - (lhs: String, rhs: String) -> Int {
    var differBy = 0    
    for i in 0..<lhs.count {
        if Array(lhs)[i] != Array(rhs)[i] {
            differBy += 1
        }
    }
    return differBy
}

class Solution {
    func differByOne(_ dict: [String]) -> Bool {
        for i in 0...dict.count-1 {
            for j in 1...dict.count-1 {
                if (dict[i] - dict[j]) == 1 {
                    return true
                }
            }
        }
        return false
    }
}