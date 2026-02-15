public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var prev = head
        var h = head
        
        if n == 1 && h?.next == nil {
            return nil
        }
        
        var i = 0
        while i < n {
            i += 1
            h = h?.next
        }
        
        if h == nil {
            return head?.next
        }
        
        var prevPrev = head
        while h != nil {
            h = h?.next
            prevPrev = prev
            prev = prev?.next
        }
        
        prevPrev?.next = prev?.next
        
        return head
    }
}
