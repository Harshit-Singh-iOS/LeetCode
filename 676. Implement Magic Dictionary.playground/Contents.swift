
class MagicDictionary {
    
    var words: [Int: [String]] = [:]
    
    init() {
        
    }
    
    func buildDict(_ dictionary: [String]) {
        for word in dictionary {
            let len = word.count
            if var val = words[len] {
                val.append(word)
                words[len] = val
            } else {
                words[len] = [word]
            }
        }
        
        print(words)
    }
    
    func search(_ searchWord: String) -> Bool {
        let len = searchWord.count
        
        guard var wordList = words[len] else {
            return false
        }
        
        for word in wordList {
            let searchWordArray = Array(searchWord)
            var diff = 0
            
            for (i, c) in word.enumerated() {
                if c != searchWordArray[i] {
                    diff += 1
                }
            }
            
            if diff == 1 {
                return true
            }
        }
        
        return false
    }
}


var magicDictionary = MagicDictionary();
magicDictionary.buildDict(["hello", "leetcode"]);
print(magicDictionary.search("hello")) // return False
print(magicDictionary.search("hhllo")) // We can change the second 'h' to 'e' to match "hello" so we return True
print(magicDictionary.search("hell")) // return False
print(magicDictionary.search("leetcoded")) // return False
print(magicDictionary.search("lettcode")) // return true





