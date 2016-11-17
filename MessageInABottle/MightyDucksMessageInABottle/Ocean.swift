//
//  Ocean.swift
//  MightyDucksMessageInABottle
//
//  Created by Christopher Boynton on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Ocean {
    
    var name: String
    var body: String
    var postedAt: Date
    var from: String

    init(name: String, body: String, postedAt: Date, from: String) {
        self.name = name
        self.body = body
        self.postedAt = postedAt
        self.from = from
    }
    
    
    
}
