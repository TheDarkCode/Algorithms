//
//  String+LevenshteinExtensions.swift
//  Levenshtein distance algorithm written in Swift 2.2. Both a slow and highly optimized version are included.
//
//  Created by Mark Hamilton on 3/31/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

/* Levenshtein Distance Algorithm
 * Calculates the minimum number of changes (distance) between two strings.
 */

public func slowlevenshtein(sourceString: String, target targetString: String) -> Int {
    
    let source = Array(sourceString.unicodeScalars)
    let target = Array(targetString.unicodeScalars)
    
    let (sourceLength, targetLength) = (source.count, target.count)
    
    var matrix = Array(count: targetLength + 1, repeatedValue: Array(count: sourceLength + 1, repeatedValue: 0))
    
    for x in  1..<targetLength {
        
        matrix[x][0] = matrix[x - 1][0] + 1
        
    }
    
    for y in 1..<sourceLength {
        
        matrix[0][y] = matrix[0][y - 1] + 1
        
    }
    
    for x in 1..<(targetLength + 1) {
        
        for y in 1..<(sourceLength + 1) {
            
            let penalty = source[y - 1] == target[x - 1] ? 0 : 1
            
            let (deletions, insertions, substitutions) = (matrix[x - 1][y] + 1, matrix[x][y - 1] + 1, matrix[x - 1][y - 1])
            
            matrix[x][y] = min3(deletions, b: insertions, c: substitutions + penalty)
            
        }
        
    }
    
    return matrix[targetLength][sourceLength]
    
}

public func levenshtein(sourceString: String, target targetString: String) -> Int {
    
    let source = Array(sourceString.unicodeScalars)
    let target = Array(targetString.unicodeScalars)
    
    let (sourceLength, targetLength) = (source.count, target.count)
    
    var distance = Array2D(columns: sourceLength + 1, rows: targetLength + 1)
    
    for x in 1...sourceLength {
        
        distance[x, 0] = x
        
    }
    
    for y in 1...targetLength {
        
        distance[0, y] = y
        
    }
    
    for x in 1...sourceLength {
        
        for y in 1...targetLength {
            
            if source[x - 1] == target[y - 1] {
                
                // no difference
                distance[x, y] = distance[x - 1, y - 1]
                
            } else {
                
                distance[x, y] = min3(
                    
                    // deletions
                    distance[x - 1, y] + 1,
                    // insertions
                    b: distance[x, y - 1] + 1,
                    // substitutions
                    c: distance[x - 1, y - 1] + 1
                    
                )
                
            }
            
        }
        
    }
    
    return distance[source.count, target.count]
    
}

public extension String {
    
    func getSlowLevenshteinTo(target: String) -> Int {
        
        return slowlevenshtein(self, target: target)
        
    }
    
    func getLevenshteinTo(target: String) -> Int {
        
        return levenshtein(self, target: target)
        
    }
    
}