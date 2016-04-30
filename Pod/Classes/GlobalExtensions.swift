//
//  GlobalExtensions.swift
//  Ahtau
//
//  Created by Mark Hamilton on 3/23/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

// Minimize 3
public func min3(a: Int, b: Int, c: Int) -> Int {
    
    return min( min(a, c), min(b, c))
    
}