//
//  Messages.swift
//  MightyDucksMessageInABottle
//
//  Created by Christopher Boynton on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Message {
    
    var title: String
    var body: String
    var postedAt: Date
    var from: User
    var ocean: Ocean
    var userUniqueKey: String
    
    init(title: String, body: String, postedAt: Date, from: User, ocean: Ocean, userUniqueKey: String) {
        self.title = title
        self.body = body
        self.postedAt = postedAt
        self.from = from
        self.ocean = ocean
        self.userUniqueKey = userUniqueKey
        
    } 
    
}
