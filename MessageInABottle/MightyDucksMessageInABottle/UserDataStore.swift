//
//  UserDataStore.swift
//  MightyDucksMessageInABottle
//
//  Created by Felicity Johnson on 11/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class UserDataStore {
    
    var name: String
    var uniqueKey: String
    var email: String?
    static let sharedInstance = UserDataStore()
    
    private init() {}
    
    
    init(name: String, uniqueKey: String) {
        self.name = name
        self.uniqueKey = uniqueKey
        
    }
    
    
    // func create user dictionary (first & last name, email, password)
}
