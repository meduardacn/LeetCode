class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var result: Int = 0
        var temp: [Int] = []
        for elem in nums {
            if elem != val{
                result+=1
                temp += [elem]
            }
        }
        nums = temp
        return result 
    }
}