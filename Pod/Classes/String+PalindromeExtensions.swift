//
//  String+PalindromeExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/22/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public func isPalindrome(string: String) -> Bool {
    
    let input = string.lowercaseString.toUnicodeArray()
    
    let reverse = string.reverse.lowercaseString.toUnicodeArray()
    
    return input == reverse
    
}

public extension String {
    
    var palindrome: Bool {
        
        get {
            
            return isPalindrome(self)
            
        }
        
    }
    
}