class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count-1
        var mid = 0

        // Find the index of the pivot element (the smallest element)
        while left <= right {
            mid = (left+right)/2
            if nums[mid] > nums[nums.count-1] {
                left = mid+1
            } else {
                right = mid-1
            }
        }

        // Binary search over elements on the pivot element's left
        var answer = recurBS(nums, target, 0 , left-1)
        if answer != -1 {
            return answer
        }
        return recurBS(nums, target, left , nums.count-1)
    }

    func recurBS(_ nums: [Int], _ target: Int,_ left: Int, _ right: Int) -> Int{
        if left > right { return -1 }

        let mid = (left + right) / 2

        if nums[mid] == target { return mid }
        else if target > nums[mid] { // greater than
            return recurBS(nums, target, mid+1, right)
        } else { // less than
            return recurBS(nums, target, left, mid-1)
        }
    }
}
