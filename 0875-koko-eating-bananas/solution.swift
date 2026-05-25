class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right =  piles.max()!  // worst case
        
        while left < right {
            let mid = left + (right - left) / 2

            if canFinish(piles, mid, h) {
                right = mid        // mid works, but maybe slower also works
            } else {
                left = mid + 1     // too slow, need faster
            }
        }
        return left
    }

    func canFinish(_ piles: [Int], _ speed: Int, _ h: Int) -> Bool {
       return piles.reduce(0) { totalHours, currentPile in
            totalHours + ((currentPile + speed - 1) / speed)
        } <= h
    }
}