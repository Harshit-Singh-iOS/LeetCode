
class LRUCache {

    var dict: [Int: Int] = [:]
    var stack: [Int]
    let capacity: Int
    
    init(_ capacity: Int) {
        stack = []
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let val = dict[key] {
            put(key, val)
            return val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if stack.endIndex + 1 > capacity {
            if let val = dict[key] {
                stack.removeFirst()
            } else {
                let key = stack.removeFirst()
                dict.removeValue(forKey: key)
            }
        }
        
        stack.append(key)
        dict[key] = value
    }
}

//var lRUCache1 = LRUCache(2);
//lRUCache1.put(1, 1); // cache is {1=1}
//lRUCache1.put(2, 2); // cache is {1=1, 2=2}
//print(lRUCache1.get(1));    // return 1
//lRUCache1.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
//print(lRUCache1.get(2));    // returns -1 (not found)
//lRUCache1.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
//print(lRUCache1.get(1));    // return -1 (not found)
//print(lRUCache1.get(3));    // return 3
//print(lRUCache1.get(4));    // return 4

var lRUCache = LRUCache(2);
//["LRUCache","get","put","get","put","put","get","get"]
//[[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]

print(lRUCache.get(2))
lRUCache.put(2, 6)
print(lRUCache.get(1))
lRUCache.put(1, 5)
lRUCache.put(1, 2)
print(lRUCache.get(1))
print(lRUCache.get(2))
print("end")
