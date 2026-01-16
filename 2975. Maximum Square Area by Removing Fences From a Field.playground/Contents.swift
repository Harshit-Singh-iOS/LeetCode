class Solution {
    func maximizeSquareArea(_ m: Int, _ n: Int, _ hFences: [Int], _ vFences: [Int]) -> Int {
        var vRanges: Set<Int> = prepareRange(vFences, length: n)
        var hRanges: Set<Int> = prepareRange(hFences, length: m)
    
        vRanges.remove(0)
        hRanges.remove(0)

        let maxLength = vRanges.intersection(hRanges).max() ?? -1
        return maxLength == -1 ? -1 : (maxLength * maxLength) % 1000000007

    }

    private func prepareRange(_ fences: [Int], length: Int) -> Set<Int> {
        var ranges: Set<Int> = []
        var fences = fences
        fences.append(contentsOf: [1, length])

        for i in 0..<fences.count {
            for j in i..<fences.count {
                ranges.insert(abs(fences[i] - fences[j]))
            }
        }
        
        return ranges
    }
}

let s = Solution()
print(s.maximizeSquareArea(6, 7, [2], [4]))
print(s.maximizeSquareArea(4, 3, [2,3], [2]))
print(s.maximizeSquareArea(47, 69,
                           [4,7,10,34,30,31,11,14,18,23,19,8,6,5,3,17,40,24,37,38,45,41,42,43,44],
                           [8,10,9,19,24,29,55,23,13,14,22,26,20,31,35,39,49,66,63,62,61,60,59,58,44,43,42,41,45,46,47,48]
))

print(s.maximizeSquareArea(1000000000, 1000000000,
                           [243,49,74,5,6,50,77,89,76,109,11,14,18,444,7,4,23,19,8,10,60,3,45,55,56,37,2265,7713,9998,4878,8878,4742,5771,3520]
,
                           [2,4,5771,3520,6767,6446,8774,5861,5794,979,67,8,55,56,45,2256,7800,900]
))

print("end")
