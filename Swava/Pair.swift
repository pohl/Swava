//
//  Pair.swift
//  Swava
//
//  Created by Pohl Longsine on 7/17/14.
//  Copyright (c) 2014 pohl. All rights reserved.
//

import Foundation

struct Pair<A, B> {
    let a: A
    let b: B
    
    init(first: A, second:B) {
        a = first;
        b = second;
    }
    
    func flip() -> Pair<B,A> {
        return Pair<B,A>(first: self.b,second: self.a)
    }
    
    
    
}