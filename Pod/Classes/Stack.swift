//
//  Stack.swift
//  Last-in First-out Stack.
//  Ahtau
//
//  Created by Mark Hamilton on 4/27/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public struct Stack<T> {
    
    private var array = [T]()
    
    public var isEmpty: Bool {
    
        return array.isEmpty
    
    }
    
    public var count: Int {
    
        return array.count
    
    }
    
    public mutating func push(element: T) {
    
        array.append(element)
    
    }
    
    public mutating func pop() -> T? {
        
        if isEmpty {
            
            return nil
        
        } else {
        
            return array.removeLast()
    
        }
    
    }
    
    public func peek() -> T? {
    
        return array.last
    
    }

}

extension Stack: SequenceType {
    
    public func generate() -> AnyGenerator<T> {
        
        var current = self
        
        return AnyGenerator {
            
            _ -> T? in
    
            return current.pop()
        
        }
    
    }

}