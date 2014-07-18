//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


struct BiMap<K: Hashable, V: Hashable>: Sequence, Equatable  {
    var forwardMap: [K:V]
    var reverseMap: [V:K]

    init() {
        forwardMap = [:]
        reverseMap = [:]
    }
    
    // waiting for visibility modifiers to keep this private
    init(forward: [V:K], reverse: [K:V]) {
        forwardMap = reverse
        reverseMap = forward
    }
    
    mutating func put(key: K, value: V) -> V? {
        let oldValueForKey = removeValueForKey(key)
        let oldKeyForvalue = removeKeyForValue(value)
        forwardMap[key] = value
        reverseMap[value] = key
        return oldValueForKey
    }
    
    mutating func removeValueForKey(key: K) -> V? {
        let result = forwardMap.removeValueForKey(key)
        if let value = result {
            reverseMap.removeValueForKey(value)
        }
        return result
    }
   
    mutating func removeKeyForValue(value: V) -> K? {
        let result = reverseMap.removeValueForKey(value)
        if let key = result {
            forwardMap.removeValueForKey(key)
        }
        return result
    }
    
    
    subscript (i: K) -> V? {
        get {
            return forwardMap[i]
        }
    }
    
    func keyFor(value: V) -> K? {
        return reverseMap[value]
    }
    
    func generate() -> DictionaryGenerator<K,V> {
        return forwardMap.generate()
    }
    

    func inverse() -> BiMap<V,K> {
        return BiMap<V,K>(forward: self.forwardMap, reverse: self.reverseMap)
    }


    
}

func == <K: Hashable,V: Hashable> (lhs: BiMap<K,V>, rhs: BiMap<K,V>) -> Bool {
    return lhs.forwardMap == rhs.forwardMap
}
