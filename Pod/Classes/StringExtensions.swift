//
//  StringExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 3/31/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// In case they ever let subscripts throw
//public extension String {
//
//    public enum SubscriptError: ErrorType {
//
//        case InvalidFirstChar
//
//        case InvalidLastChar
//
//    }
//
//
//    subscript(range: Range<Int>) throws -> String {
//
//        guard let firstChar = startIndex.advancedBy(range.startIndex) else {
//
//            throw SubscriptError.InvalidFirstChar
//        }
//
//        guard  let lastChar = startIndex.advancedBy(range.endIndex) else {
//
//            throw SubscriptError.InvalidLastChar
//
//        }
//
//        return self[firstChar...<lastChar]
//
//
//    }
//
//}

public extension String {
    
    public var loremIpsum: String {
        
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a felis nec nisl tempus laoreet. Sed sollicitudin mauris sit amet neque faucibus, at faucibus tortor tincidunt. Maecenas facilisis, lectus eget volutpat ultricies, arcu libero sodales tellus, vel iaculis enim massa ac diam. Mauris volutpat tellus at est facilisis, non interdum metus interdum. Maecenas sit amet felis ac dolor consequat fringilla. Suspendisse tincidunt at dui a sodales. Morbi ullamcorper lacinia lorem non rhoncus. Phasellus pulvinar id sem sit amet tincidunt. In at feugiat nulla. Vivamus sit amet fringilla massa. Aenean imperdiet velit neque, ac iaculis nisl tempus vitae. Proin ornare volutpat semper. Vivamus vel scelerisque arcu, nec luctus risus. Maecenas iaculis justo lorem, et malesuada eros interdum et. In euismod finibus magna, nec viverra eros ornare non. Donec congue ligula et libero ultricies ornare. Nullam gravida justo commodo sollicitudin pellentesque. Curabitur eget sagittis justo, tempor volutpat orci. In non enim dui. Nunc maximus eros eu ligula tincidunt, vitae lobortis ipsum convallis. Pellentesque congue justo diam, egestas condimentum urna pellentesque ut. Proin et scelerisque diam. Integer condimentum auctor dolor quis ullamcorper. Suspendisse venenatis tellus ut ipsum euismod, interdum ullamcorper metus tristique. Nullam at tellus vel sapien lacinia gravida. Mauris eu magna malesuada, porttitor mauris mattis, venenatis dolor. Aenean bibendum eleifend ipsum, ac mollis felis rutrum sit amet. Fusce at enim ac felis molestie cursus nec ultrices odio. Duis varius purus vitae felis malesuada elementum. Quisque imperdiet, nulla eu dignissim pellentesque, diam diam maximus mi, at molestie quam libero quis elit. Cras volutpat lacinia dignissim. Suspendisse id arcu libero. Duis viverra, augue non fermentum lacinia, neque diam bibendum justo, ac egestas risus urna sagittis nulla. Curabitur dapibus vestibulum arcu sed scelerisque. Morbi nec lobortis orci. Sed ac augue neque."
        
    }
    
    
    public mutating func LoremIpsum() {
        
        self = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus a felis nec nisl tempus laoreet. Sed sollicitudin mauris sit amet neque faucibus, at faucibus tortor tincidunt. Maecenas facilisis, lectus eget volutpat ultricies, arcu libero sodales tellus, vel iaculis enim massa ac diam. Mauris volutpat tellus at est facilisis, non interdum metus interdum. Maecenas sit amet felis ac dolor consequat fringilla. Suspendisse tincidunt at dui a sodales. Morbi ullamcorper lacinia lorem non rhoncus. Phasellus pulvinar id sem sit amet tincidunt. In at feugiat nulla. Vivamus sit amet fringilla massa. Aenean imperdiet velit neque, ac iaculis nisl tempus vitae. Proin ornare volutpat semper. Vivamus vel scelerisque arcu, nec luctus risus. Maecenas iaculis justo lorem, et malesuada eros interdum et. In euismod finibus magna, nec viverra eros ornare non. Donec congue ligula et libero ultricies ornare. Nullam gravida justo commodo sollicitudin pellentesque. Curabitur eget sagittis justo, tempor volutpat orci. In non enim dui. Nunc maximus eros eu ligula tincidunt, vitae lobortis ipsum convallis. Pellentesque congue justo diam, egestas condimentum urna pellentesque ut. Proin et scelerisque diam. Integer condimentum auctor dolor quis ullamcorper. Suspendisse venenatis tellus ut ipsum euismod, interdum ullamcorper metus tristique. Nullam at tellus vel sapien lacinia gravida. Mauris eu magna malesuada, porttitor mauris mattis, venenatis dolor. Aenean bibendum eleifend ipsum, ac mollis felis rutrum sit amet. Fusce at enim ac felis molestie cursus nec ultrices odio. Duis varius purus vitae felis malesuada elementum. Quisque imperdiet, nulla eu dignissim pellentesque, diam diam maximus mi, at molestie quam libero quis elit. Cras volutpat lacinia dignissim. Suspendisse id arcu libero. Duis viverra, augue non fermentum lacinia, neque diam bibendum justo, ac egestas risus urna sagittis nulla. Curabitur dapibus vestibulum arcu sed scelerisque. Morbi nec lobortis orci. Sed ac augue neque."
        
    }
    
    subscript(index: Int) -> Character {
        
        return self[startIndex.advancedBy(index)]
        
    }
    
    subscript(range: Range<Int>) -> String {
        
        let char0 = startIndex.advancedBy(range.startIndex)
        
        let charN = startIndex.advancedBy(range.endIndex)
        
        return self[char0..<charN]
        
    }
    
    func toCamelCase() -> String {
    
        let regex = try! NSRegularExpression(pattern: "[^a-zA-Z]+", options: .CaseInsensitive)
        let range = NSMakeRange(0, self.characters.count)
        return regex.stringByReplacingMatchesInString(self.capitalizedString, options: [], range: range, withTemplate: "")
    
    }
    
    func location(substring: String) -> Int {
        
        return (self as NSString).rangeOfString(substring).location
        
    }
    
    var camelcase: String {
        
        get {
            
            return self.toCamelCase()
            
        }
        
    }
    
    var length: Int {
        
        get {
            
            return self.characters.count
            
        }
        
    }
    
    var reverse: String {
        
        get {
            
            return String(self.characters.reverse())
            
        }
        
    }
    
    var lowercase: String {
        
        get {
            
            return self.lowercaseString
        
        }
        
    }
    
    var uppercase: String {
        
        get {
            
            return self.uppercaseString
            
        }
        
    }
    
    var capitalized: String {
        
        get {
            
            return self.capitalizedString
            
        }
        
    }
    
//    func length() -> Int {
//        
//        return self.characters.count
//        
//    }
    
}

