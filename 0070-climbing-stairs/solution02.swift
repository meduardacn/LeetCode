class Solution {
    var stairs: [Int: Int] = [:]

    func climbStairs(_ n: Int) -> Int {
        if n < 2 { return 1 }
        if let value = stairs[n] { return value }
        stairs[n] = climbStairs(n-1) + climbStairs(n-2)
        return stairs[n]!
    }
}