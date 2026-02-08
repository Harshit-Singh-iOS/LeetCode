class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLen = 0
        var arr = Array(s)
        let lenS = s.count

        if lenS <= 1 {
            return lenS
        }

        for i in 0..<lenS {
            var set: Set<Character> = .init()
            var count = 0
            for j in i..<lenS where (j-i+1) >= maxLen {
                if set.contains(arr[j]) {
                    maxLen = max(maxLen, count)
                    break
                } else {
                    count += 1
                    set.insert(arr[j])
                }
            }

            maxLen = max(maxLen, count)
        }

        return maxLen
    }
}

let s = Solution()
print(s.lengthOfLongestSubstring("abcabcbb"))
