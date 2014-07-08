//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


struct Multiset<T: Hashable>: Sequence, Equatable {
    
    var dictionary: Dictionary<T,Int> = [:]
    
    mutating func add(item: T) -> () {
        if let currentCount = dictionary[item] {
            dictionary.updateValue(currentCount + 1, forKey: item)
        } else {
            dictionary.updateValue(1, forKey: item)
        }
    }
    
    func count(item: T) -> Int {
        if let currentCount = dictionary[item] {
            return currentCount
        } else {
            return 0
        }
    }
    
    func generate() -> DictionaryGenerator<T,Int> {
        return dictionary.generate()
    }
    
    subscript (i: T) -> Int? {
        get {
            return dictionary[i]
        }
    }
    
}

func == <T: Hashable> (lhs: Multiset<T>, rhs: Multiset<T>) -> Bool {
    return lhs.dictionary == rhs.dictionary
}
