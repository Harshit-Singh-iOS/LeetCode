class Solution {
    func trap(_ heights: [Int]) -> Int {
        let maxH = heights.max()!

        if heights.endIndex == 1 || maxH == 0 {
            return 0
        }
        
        var total = 0
        
        for i in 1...maxH {
            var prevIdx = -1
            
            for j in 0..<heights.endIndex {
                if prevIdx == -1 && heights[j] >= i {
                    prevIdx = j
                    continue
                }
                
                if heights[j] >= i && j != prevIdx {
                    total += j - prevIdx - 1
                    prevIdx = j
                }
                
            }
        }
        return total
    }
}
