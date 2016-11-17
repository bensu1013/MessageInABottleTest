//
//  User.swift
//  MightyDucksMessageInABottle
//
//  Created by Christopher Boynton on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var uniqueKey: String
    
    
    init(name: String, uniqueKey: String) {
        self.name = name
        self.uniqueKey = uniqueKey
        
    }
}
