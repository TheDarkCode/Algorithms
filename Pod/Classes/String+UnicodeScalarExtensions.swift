//
//  String+UnicodeScalarExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 4/22/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public extension String {
    
    func toUnicodeArray() -> Array<UnicodeScalar> {
        
        let scalars = self.unicodeScalars
        
        return Array(scalars)
        
    }
    
    var unicodeArray: Array<UnicodeScalar> {
        
        get {
            
            return self.toUnicodeArray()
            
        }
    }
        
}