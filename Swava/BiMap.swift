//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


struct BiMap<K: Hashable, V: Hashable> {
    var dictionary: Dictionary<K,V> = [:]
    var inverse: Dictionary<V,K> = [:]

    mutating func put(key: K, value: V) -> V? {
        let result = removeValueForKey(key)
        dictionary[key] = value
        inverse[value] = key
        return result
    }
    
    mutating func removeValueForKey(key: K) -> V? {
        let result = dictionary.removeValueForKey(key)
        if let value = result {
            inverse.removeValueForKey(value)
        }
        return result
    }
   
    subscript (i: K) -> V? {
        get {
            return dictionary[i]
        }
    }
    
    func keyFor(value: V) -> K? {
        return inverse[value]
    }
    
}