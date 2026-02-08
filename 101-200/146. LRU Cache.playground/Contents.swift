class LRUCache {
    var data: [Int: Int] = [:]
    var lru: [Int] = []
    let cap: Int
    
    init(_ capacity: Int) {
        self.cap = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let data = data[key] {
            put(key, data)
            return data
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        let currentSize = lru.endIndex
        
        if data[key] != nil {
            lru.removeAll(where: { $0 == key })
            lru.append(key)
            
            data[key] = value
        } else {
            if currentSize + 1 > cap {
                let first = lru.removeFirst()
                data.removeValue(forKey: first)
            }
            
            lru.append(key)
            data[key] = value
        }
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
