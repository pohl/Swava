//  Copyright (c) 2014 Pohl Longsine. All rights reserved.


struct BiMap<K: Hashable, V: Hashable> {
    var dictionary: Dictionary<K,V> = [:]
    var inverse: Dictionary<V,K> = [:]

    mutating func put(key: K, value: V) -> V? {
        let result = dictionary[key]
        dictionary[key] = value
        inverse[value] = key
        // TODO: suppose the key and/or value already existed in the maps
        return result
    }
    
    // TODO: make DictionaryLiteralConvertible
    
}