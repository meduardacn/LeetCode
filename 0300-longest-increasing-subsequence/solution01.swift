class Solution {
    struct SubsequenceCount {
        let value: Int
        let length: Int

        init(_ value: Int, _ length: Int) {
            self.value = value
            self.length = length
        }
    }

    var subsequences: [SubsequenceCount] = [] 

    func lengthOfLIS(_ nums: [Int]) -> Int {
        var longest: Int = 0 

        for num in nums {
            var numLen: Int = 1

            for sub in subsequences {
                if num > sub.value, numLen < sub.length+1 {
                    numLen = sub.length+1
                }
            }

            if numLen > longest { 
                longest = numLen
            }

            subsequences.append(.init(num,numLen))
        }

        return longest
    }
}