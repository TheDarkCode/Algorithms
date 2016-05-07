//
//  List.swift
//  Ahtau
//
//  Created by Mark Hamilton on 5/7/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

/// A List contains additional methods for sorting and searching.

public enum ListError: ErrorType {
    
    case NullArgument(argument: String)
    
    case InvalidArgument(argument: String)
    
    case InvalidArgumentType(type: String)
    
}

public struct List<T> {
    
    private let _defaultCapacity: Int = 4
    
    private var _elements: [T]
    
    private let _emptyArray = [T]()
    
    private var _size: Int
    
    private var _version: Int
    
    public init() {
        
        self._elements = _emptyArray
        self._size = 0
        self._version = 0
        
    }
    
    public init(elements: [T]) {
        
        self._elements = elements
        self._size = elements.count
        self._version = 1
        
    }
    
    public var elements: [T] {
        
        get {
            
            return _elements
            
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
    
    public var isFixedSize: Bool {
        
        return false
        
    }
    
    public var isSynchronized: Bool {
        
        return false
        
    }
    
    public var isReadOnly: Bool {
        
        return false
        
    }
    
    public var capacity: Int {
        
        get {
            
            if count > 0 {
                
                return count
                
            } else {
                
                return _defaultCapacity
                
            }
            
        } set {
            
            if (newValue > 0) {
                
                var copiedElements = [T]()
                
                for i in 0...(newValue-1) {
                    
                    copiedElements.append(elements[i])
                    
                }
                
                _elements.removeAll(keepCapacity: false)
                
                _elements = copiedElements
                
                
            } else {
                
                _elements = _emptyArray
                
            }
            
        }
        
    }
    
    public var count: Int {
        
        get {
            
            return _size
        
        }
        
    }
    
    public var first: T? {
        
        return self.elements.first
        
    }
    
    public var last: T? {
        
        return self.elements.last
        
    }
    
    public func this(index: Int) throws -> T {
        
        if index < count {
            
            return elements[index]
            
        } else {
            
            throw ListError.InvalidArgument(argument: "index")
            
        }
            
    }
    
    private mutating func incrementVersion() {
        
        _version += 1
        
    }
    
    
    public mutating func insert(element: T, _ position: Int? = nil) {
        
        _elements.insert(element, atIndex: position ?? count)
        incrementVersion()
        
    }
    
    
    public mutating func add(element: T) throws -> Bool {
        
        _elements.append(element)
        incrementVersion()
        
        return true
    }
    
    public func remove(element: T) throws -> Bool {
        
        return false
        
    }
    
    
    //public func removeAt(element: T, position: IndexPath) throws -> Bool {
    //    
    //    return false
    //    
    //}
    
    public mutating func clear() {
        
        if (count > 0) {
            
            _elements.removeAll(keepCapacity: false)
            _size = 0
            
        }
        
        incrementVersion()
        
    }
    
    public mutating func reverse() {
        
        _elements = _elements.reverse()
        
        incrementVersion()
        
    }

}

public extension List where T: Comparable {
    
    public func indexOf(element: T) -> Int? {
        
        if let indexOfElement: Int = elements.indexOf({ $0 == element }) {
            
            return indexOfElement
            
        } else {
            
            return nil
            
        }
        
    }
    
    public func exists(element: T) -> Bool {
        
        if let _: Int = indexOf(element) {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
    
    public func contains(element: T) -> Bool {
        
        return exists(element)
        
    }
    
    public func binarySearch(query: T) throws -> Bool {
        
        var leftCount: Int = 0
        var rightCount: Int = count - 1
        
        while( leftCount <= rightCount ) {
            
            guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {
                
                throw CalcError.InvalidAverage
                
            }
            
            guard let estimatedValue: T = elements[middleValue] else {
                
                throw CalcError.InvalidMiddleValue
                
            }
            
            if (estimatedValue == query) {
                
                return true
                
            }
            
            if (estimatedValue < query) {
                
                leftCount = middleValue + 1
                
            }
            
            if (estimatedValue > query) {
                
                rightCount = middleValue - 1
                
            }
            
        }
        
        return false
        
    }
    
}
