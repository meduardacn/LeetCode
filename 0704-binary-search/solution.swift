class Solution {
    func recurBS(_ nums: [Int], _ target: Int,_ low: Int, _ high: Int) -> Int {
        if low > high { return -1 }

        let mid = (low + high) / 2

        if nums[mid] == target { return mid }
        else if target > nums[mid] { // greater than
            return recurBS(nums, target, mid+1, high)
        } else { // less than
            return recurBS(nums, target, low, mid-1)
        }
    }

    func search(_ nums: [Int], _ target: Int) -> Int {
        return recurBS(nums, target, 0, nums.count-1)

    }
}
