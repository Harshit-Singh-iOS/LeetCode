
class FindSumPairs {
    var nums1, nums2: [Int]
    var dict2: [Int: Int] = .init()
    
    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        
        for n in nums2 {
            dict2[n, default: 0] += 1
        }
    }
    
    func add(_ index: Int, _ val: Int) {
        if let dictVal = dict2[nums2[index]] {
            if dictVal == 1 {
                dict2.removeValue(forKey: nums2[index])
            } else {
                dict2[nums2[index]] = dictVal - 1
            }
        }
        
        nums2[index] += val
        
        dict2[nums2[index], default: 0] += 1
    }
    
    func count(_ tot: Int) -> Int {
        var count = 0
        
        for n in nums1 {
            if let v = dict2[tot-n] {
                count += v
            }
        }
        
        return count
    }
}


let findSumPairs = FindSumPairs([1, 1, 2, 2, 2, 3], [1, 4, 5, 2, 5, 4])
findSumPairs.count(7);  // return 8; pairs (2,2), (3,2), (4,2), (2,4), (3,4), (4,4) make 2 + 5 and pairs (5,1), (5,5) make 3 + 4

findSumPairs.add(3, 2) // now nums2 = [1,4,5,4,5,4]

findSumPairs.count(8);  // return 2; pairs (5,2), (5,4) make 3 + 5
findSumPairs.count(4);  // return 1; pair (5,0) makes 3 + 1

findSumPairs.add(0, 1); // now nums2 = [2,4,5,4,5,4]

findSumPairs.add(1, 1); // now nums2 = [2,5,5,4,5,4]

findSumPairs.count(7);  // return 11; pairs (2,1), (2,2), (2,4), (3,1), (3,2), (3,4), (4,1), (4,2), (4,4) make 2 + 5 and pairs (5,3), (5,5) make 3 + 4

