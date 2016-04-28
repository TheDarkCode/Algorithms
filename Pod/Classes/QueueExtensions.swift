//
//  QueueExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/27/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public struct Queue<T> {
    
    private var array = [T?]()
    private var head = 0
    
    public var isEmpty: Bool {
    
        return count == 0
    
    }
    
    public var count: Int {
    
        return array.count - head
    
    }
    
    public var first: T? {
        
        return array[head]
        
    }
    
    public var last: T? {
        
        return array[count - 1]
        
    }
    
    public mutating func enqueue(element: T) {
    
        array.append(element)
    
    }
    
    public mutating func dequeue() -> T? {
        
        guard head < array.count, let element = array[head] else {
        
            return nil
        
        }
        
        array[head] = nil
        
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        
        if array.count > 50 && percentage > 0.25 {
            
            array.removeFirst(head)
        
            head = 0
    
        }
        
        return element
    
    }
    
    public mutating func simpleDequeue() -> T? {
        
        if isEmpty {
            
            return nil
            
        } else {
            
            return array.removeFirst()
            
        }
        
    }
    
    public func peek() -> T? {
        
        if isEmpty {
        
            return nil
        
        } else {
        
            return first
    
        }

    }

}