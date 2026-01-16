class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var totalLines = 0
        var currentLine = 0
        let aAsccii: Int = Int(Character("a").asciiValue!)
        
        for c in s {
            let location = Int(c.asciiValue!) - aAsccii
            
            if currentLine + widths[location] <= 100 {
                currentLine += widths[location]
            } else {
                totalLines += 1
                currentLine = widths[location]
            }
        }
        
        return [totalLines + 1, currentLine]
    }
}

let s = Solution()
print(s.numberOfLines(
    [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10],
    "abcdefghijklmnopqrstuvwxyz"))

let x = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]
let y = "bbbcccdddaaa"

print(s.numberOfLines(x, y))

