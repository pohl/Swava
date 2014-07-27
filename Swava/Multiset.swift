//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


public struct Multiset<T: Hashable>: Sequence, Equatable {
    
    private var dictionary: Dictionary<T,Int> = [:]
    
    public mutating func add(item: T) -> () {
        if let currentCount = dictionary[item] {
            dictionary.updateValue(currentCount + 1, forKey: item)
        } else {
            dictionary.updateValue(1, forKey: item)
        }
    }
    
    public func count(item: T) -> Int {
        if let currentCount = dictionary[item] {
            return currentCount
        } else {
            return 0
        }
    }
    
    public func generate() -> DictionaryGenerator<T,Int> {
        return dictionary.generate()
    }
    
    public subscript (i: T) -> Int? {
        get {
            return dictionary[i]
        }
    }
    
}

public func == <T: Hashable> (lhs: Multiset<T>, rhs: Multiset<T>) -> Bool {
    return lhs.dictionary == rhs.dictionary
}
