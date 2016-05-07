//
//  Queue.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/27/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

/// A Queue is a struct with first-in, first-out properties and methods to add elements to one ende, and remove them from either end of the queue, while maintaining accessibility to the contents without modification or removal.
public struct Queue<T> {
    
    private var _array: [T?]
    private var _head = 0
    private var _tail = 0
    private var _size: Int
    private var _version: Int
    
    public var array: [T?] {
        
        get {
            
            return _array
            
        }
        
    }
    
    public var head: Int {
        
        get {
            
            return _head
            
        }
        
    }
    
    public var tail: Int {
        
        get {
            
            return _tail
            
        }
        
    }
    
    public var version: Int {
        
        get {
            
            return _version
            
        }
        
    }
    
    public var isEmpty: Bool {
        
        return count == 0
        
    }
    
    public var count: Int {
        
        return _size
        
    }
    
    public var first: T? {
        
        return array[head]
        
    }
    
    public var last: T? {
        
        return _array[tail]
        
    }
    
    public var isFixedSize: Bool {
        
        return false
        
    }
    
    public var isSynchronized: Bool {
        
        return false
        
    }
    
    public var isReadOnly: Bool {
        
        return false
        
    }
    
    public init() {
        
        self._array = [T?]()
        self._size = 0
        self._version = 0
        
    }
    
    public init(items: [T?]) {
        
        self._array = items
        self._size = items.count
        self._version = 1
        self._tail = (count - 1)
        
    }
    
    private mutating func resetSize() {
        
        _size = 0
        resetHeadandTail()
        
    }
    
    private mutating func incrementSize() {
        
        _size += 1
        incrementTail()
        
    }
    
    private mutating func decrementSize() {
        
        _size -= 1
        decrementTail()
        
    }
    
    private mutating func incrementVersion() {
        
        _version += 1
        
    }
    
    private mutating func resetHead() {
        
        _head = 0
        
    }
    
    private mutating func incrementHead() {
        
        _head += 1
        
    }
    
    private mutating func decrementHead() {
        
        _head -= 1
        
    }
    
    private mutating func resetTail() {
        
        _tail = 0
        
    }
    
    private mutating func incrementTail() {
        
        _tail += 1
        
    }
    
    private mutating func decrementTail() {
        
        _tail -= 1
        
    }
    
    private mutating func resetHeadandTail() {
        
        resetHead()
        resetTail()
        
    }
    
    public mutating func Clear() {
        
        if _size != 0 {
            
            _array.removeAll(keepCapacity: false)
            
            
        }
        
        resetHeadandTail()
        incrementVersion()
        
    }
    
    public mutating func enqueue(element: T) {
        
        _array.append(element)
        incrementSize()
        incrementVersion()
        
        
    }
    
    public mutating func dequeue() -> T? {
        
        guard head < count, let element = array[head] else {
            
            return nil
            
        }
        
        _array[head] = nil
        
        incrementHead()
        decrementSize()
        incrementVersion()
        
        let percentage = Double(head) / Double(count)
        
        if count > 50 && percentage > 0.25 {
            
            _array.removeFirst(head)
            
            resetHead()
            
        }
        
        return element
        
    }
    
    public mutating func simpleDequeue() -> T? {
        
        if isEmpty {
            
            return nil
            
        } else {
            
            defer {
                
                decrementSize()
                incrementVersion()
                
            }
            
            return _array.removeFirst()
            
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