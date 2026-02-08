
import Foundation
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap = MaxHeap(nums)
        if k > nums.endIndex {
            return -1
        }

        var res = -1

        for _ in 0..<k {
            res = heap.remove() ?? 0
        }

        return res
    }
}

class MaxHeap<T: Comparable> {
    var heap: [T] = []
    
    init(_ array: [T]) {
        array.forEach({ self.insert($0) })
    }
    
    // Insert a new element into the heap
    func insert(_ element: T) {
        heap.append(element)
        var currentIndex = heap.count - 1
        
        // Bubble up the element until the
        // heap property is restored
        while currentIndex > 0 && heap[currentIndex] > heap[(currentIndex-1)/2] {
            heap.swapAt(currentIndex, (currentIndex-1)/2)
            currentIndex = (currentIndex-1)/2
        }
    }
    
    // Remove and return the top
    // element of the heap
    func remove() -> T? {
        guard !heap.isEmpty else {
            return nil
        }
        
        let topElement = heap[0]
        
        if heap.count == 1 {
            heap.removeFirst()
        } else {
          
            // Replace the top element
            // with the last element in
            // the heap
            heap[0] = heap.removeLast()
            var currentIndex = 0
            
            // Bubble down the element until
            // the heap property is restored
            while true {
                let leftChildIndex = 2*currentIndex+1
                let rightChildIndex = 2*currentIndex+2
                
                // Determine the index of
                // the larger child
                var maxIndex = currentIndex
                if leftChildIndex < heap.count && heap[leftChildIndex] > heap[maxIndex] {
                    maxIndex = leftChildIndex
                }
                if rightChildIndex < heap.count && heap[rightChildIndex] > heap[maxIndex] {
                    maxIndex = rightChildIndex
                }
                
                // If the heap property is
                // restored, break out of the loop
                if maxIndex == currentIndex {
                    break
                }
                
                // Otherwise, swap the current
                // element with its larger child
                heap.swapAt(currentIndex, maxIndex)
                currentIndex = maxIndex
            }
        }
        
        return topElement
    }
    
    // Get the top element of the
    // heap without removing it
    func peek() -> T? {
        return heap.first
    }
    
    // Check if the heap is empty
    var isEmpty: Bool {
        return heap.isEmpty
    }
}

let s = Solution()
print("---->", s.findKthLargest([3,2,1,5,6,4], 2))
print("---->", s.findKthLargest([3,2,3,1,2,4,5,5,6], 4))
