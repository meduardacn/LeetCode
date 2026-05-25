class Solution {
    // findMin → compare mid vs right → if nums[mid] > nums[right]: left = mid+1
    // findMax → compare mid vs right → if nums[mid] > nums[right]: left = mid

    // MINIMUM → right = mid  /  left = mid + 1  →  finds leftmost  ✅
    // MAXIMUM → left = mid+1 /  right = mid - 1 →  finds rightmost ✅
    
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count-1
        var mid = 0

        // Find the index of the pivot element (the smallest element)
        while left < right {
            mid = (left+right)/2
            if nums[mid] > nums[right] {
                left = mid+1
            } else {
                right = mid
            }
        }
        return nums[left]
    }
}