//
//  BinarySearchUtils.swift
//  Ahtau
//
//  Created by Mark Hamilton on 3/26/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public enum CalcError: ErrorType {
    
    case InvalidAverage
    
    case InvalidMiddleValue
}

public func binarySearch< T : Comparable >(collection: [T], query: T) throws -> Bool {
    
    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1
    
    while( leftCount <= rightCount ) {
        
        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {
            
            throw CalcError.InvalidAverage
            
        }
        
        guard let estimatedValue: T = collection[middleValue] else {
            
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

public func binarySearchPrefix(collection: [String], query: String) throws -> Bool {
    
    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1
    
    while( leftCount <= rightCount ) {
        
        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {
            
            throw CalcError.InvalidAverage
            
        }
        
        guard let estimatedValue: String = collection[middleValue] else {
            
            throw CalcError.InvalidMiddleValue
            
        }
        
        if (estimatedValue.hasPrefix(query)) {
            
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

public func binarySearchFirst(collection: [String], query: String) throws -> Int {
    
    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1
    
    while( leftCount <= rightCount ) {
        
        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {
            
            throw CalcError.InvalidAverage
            
        }
        
        guard let estimatedValue: String = collection[middleValue] else {
            
            throw CalcError.InvalidMiddleValue
            
        }
        
        if (estimatedValue.hasPrefix(query) && leftCount == rightCount) {
            
            return leftCount
            
        }
        
        if estimatedValue.hasPrefix(query) {
            
            if middleValue > 0 && !collection[middleValue - 1].hasPrefix(query) {
                
                return middleValue
                
            }
            
            rightCount = middleValue - 1
            
        } else if (estimatedValue < query) {
            
            leftCount = middleValue + 1
            
        } else if (estimatedValue > query) {
            
            rightCount = middleValue - 1
            
        }
        
    }
    
    return -1
    
}

public func binarySearchLast(collection: [String], query: String) throws -> Int {
    
    var leftCount: Int = 0
    var rightCount: Int = collection.count - 1
    
    while( leftCount <= rightCount ) {
        
        guard let middleValue: Int = (( leftCount + rightCount ) / 2) else {
            
            throw CalcError.InvalidAverage
            
        }
        
        guard let estimatedValue: String = collection[middleValue] else {
            
            throw CalcError.InvalidMiddleValue
            
        }
        
        if (estimatedValue.hasPrefix(query) && leftCount == rightCount) {
            
            return leftCount
            
        }
        
        if estimatedValue.hasPrefix(query) {
            
            if middleValue < collection.count - 1 && !collection[middleValue + 1].hasPrefix(query) {
                
                return middleValue
                
            }
            
            leftCount = middleValue + 1
            
        } else if (estimatedValue < query) {
            
            leftCount = middleValue + 1
            
        } else if (estimatedValue > query) {
            
            rightCount = middleValue - 1
            
        }
        
    }
    
    return -1
    
}