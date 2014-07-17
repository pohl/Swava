//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


struct BiMap<K: Hashable, V: Hashable>: Sequence, Equatable  {
    var dictionary: [K:V]
    var inverse: [V:K]

    init() {
        dictionary = [:]
        inverse = [:]
    }
    
    // waiting for visibility modifiers to keep this private
    init(otherDictionary: [V:K], otherInverse: [K:V]) {
        dictionary = otherInverse
        inverse = otherDictionary
    }
    
    mutating func put(key: K, value: V) -> V? {
        let oldValueForKey = removeValueForKey(key)
        let oldKeyForvalue = removeKeyForValue(value)
        dictionary[key] = value
        inverse[value] = key
        return oldValueForKey
    }
    
    mutating func removeValueForKey(key: K) -> V? {
        let result = dictionary.removeValueForKey(key)
        if let value = result {
            inverse.removeValueForKey(value)
        }
        return result
    }
   
    mutating func removeKeyForValue(value: V) -> K? {
        let result = inverse.removeValueForKey(value)
        if let key = result {
            dictionary.removeValueForKey(key)
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
    
    func generate() -> DictionaryGenerator<K,V> {
        return dictionary.generate()
    }
    
    /*
    func flip() -> BiMap<V,K> {
        return BiMap(self.dictionary,self.inverse)
    }
    */

    
}

func == <K: Hashable,V: Hashable> (lhs: BiMap<K,V>, rhs: BiMap<K,V>) -> Bool {
    return lhs.dictionary == rhs.dictionary
}
