//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


public struct BiMap<K: Hashable, V: Hashable>: SequenceType, Equatable  {
    private var forwardMap: [K:V]
    private var reverseMap: [V:K]

    public init() {
        forwardMap = [:]
        reverseMap = [:]
    }
    
    // waiting for visibility modifiers to keep this private
    private init(forward: [V:K], reverse: [K:V]) {
        forwardMap = reverse
        reverseMap = forward
    }
    
    public mutating func put(key: K, value: V) -> V? {
        let oldValueForKey = removeValueForKey(key)
        let oldKeyForvalue = removeKeyForValue(value)
        forwardMap[key] = value
        reverseMap[value] = key
        return oldValueForKey
    }
    
    public mutating func removeValueForKey(key: K) -> V? {
        let result = forwardMap.removeValueForKey(key)
        if let value = result {
            reverseMap.removeValueForKey(value)
        }
        return result
    }
   
    public mutating func removeKeyForValue(value: V) -> K? {
        let result = reverseMap.removeValueForKey(value)
        if let key = result {
            forwardMap.removeValueForKey(key)
        }
        return result
    }
    
    
    public subscript (i: K) -> V? {
        get {
            return forwardMap[i]
        }
    }
    
    public func keyFor(value: V) -> K? {
        return reverseMap[value]
    }
    
    public func generate() -> DictionaryGenerator<K,V> {
        return forwardMap.generate()
    }
    

    public func inverse() -> BiMap<V,K> {
        return BiMap<V,K>(forward: self.forwardMap, reverse: self.reverseMap)
    }


    
}

public func == <K: Hashable,V: Hashable> (lhs: BiMap<K,V>, rhs: BiMap<K,V>) -> Bool {
    return lhs.forwardMap == rhs.forwardMap
}
