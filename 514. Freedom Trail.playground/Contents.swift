class Solution {
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        return findRotateSteps(ring, key, count: 0)
    }
    
    func findRotateSteps(_ ring: String, _ key: String, count: Int) -> Int {
        if key.isEmpty {
            return 0
        } else {
            if key.first == ring.first {
                let newKey = String(key.dropFirst())
                return findRotateSteps(ring, newKey, count: count) + 1
            } else if key.first == ring.last {
                let newKey = String(key.dropFirst())
                let newRing = rotateRingClockwise(ring: ring)
                return findRotateSteps(newRing, newKey, count: count) + 2
                
            } else {
                let ringMid = ring.count / 2
                if let firstIndex = Array(ring).firstIndex(of: key.first!),
                   firstIndex < ringMid {
                    let newRing = rotateRingAntiClockwise(ring: ring)
                    return findRotateSteps(newRing, key, count: count) + 1
                } else {
                    let newRing = rotateRingClockwise(ring: ring)
                    return findRotateSteps(newRing, key, count: count) + 1
                }
            }
        }
    }
    
    private func rotateRingClockwise(ring: String) -> String {
        var currentRing = ring
        var last = String(ring.last!)
        currentRing = String(currentRing.dropLast())
        return last + currentRing
    }
    
    private func rotateRingAntiClockwise(ring: String) -> String {
        var currentRing = ring
        var first = String(ring.first!)
        currentRing = String(currentRing.dropFirst())
        return currentRing + first
    }
    
}

let s = Solution()
let ring = "godding"
//print(s.findRotateSteps(ring, "g")) // 1
//print(s.findRotateSteps(ring, "gd")) // 4
//print(s.findRotateSteps(ring, ring)) //13
//print(s.findRotateSteps(ring, "gg")) //2
//print(s.findRotateSteps(ring, "dd")) //4



