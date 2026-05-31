class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs = zip(zip(startTime, endTime), profit)
            .map { (start: $0.0, end: $0.1, profit: $1) }
            .sorted { $0.end < $1.end }
        
        let n = jobs.count 
        var dp = Array(repeating: 0, count: n + 1)

        for i in 1...n {
            let job = jobs[i - 1]

            var lo = 0, hi = i - 1
            while lo < hi {
                let mid = (lo + hi + 1) / 2

                if jobs[mid - 1].end <= job.start {
                    lo = mid
                } else {
                    hi = mid - 1
                }
            }

            dp[i] = max(dp[i - 1], dp[lo] + job.profit)
        }
        print(dp)
        return dp[n]
    }
}