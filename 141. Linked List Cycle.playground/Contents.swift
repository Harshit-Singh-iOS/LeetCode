public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var single = head
        var double = head?.next
        
        while double != nil {
            if single === double {
                return true
            }
            single = single?.next
            double = head?.next?.next
        }
        
        return false
    }
}
