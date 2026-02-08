class Solution {
    func sumOfDigits(_ nums: [Int]) -> Int {
        var min = nums.min()!
        var sum = 0

        while min > 0 {
            sum += min % 10
            min = min / 10
        }

        return sum%2 == 1 ? 0 : 1
    }
}
