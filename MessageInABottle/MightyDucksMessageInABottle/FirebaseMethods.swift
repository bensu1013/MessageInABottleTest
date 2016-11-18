//
//  FirebaseMethods.swift
//  MightyDucksMessageInABottle
//
//  Created by Felicity Johnson on 11/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import Firebase


class FirebaseMethods {

    let ref = FIRDatabase.database().reference().root
    
    
    //MARK: - Sign Up & Log In Funcs
    
    func signInButton(email: String, password: String) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                
            }
            guard let user = FIRAuth.auth()?.currentUser else { print("error"); return }
        }
    }
    
    
    func signUpButton(email: String, password: String, name: String) {
        
        if email != "" && password != "" {
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    let userDictionary = [(user?.uid)! : ["email": email, "name": name, "uniqueKey": (user?.uid)!]]
                    
                    UserDataStore.init(name: name, uniqueKey: (user?.uid)!)
                    self.ref.child("users").child((user?.uid)!).setValue(userDictionary)
                    
                    
                    
                }
  
                
                } else {
                    if error != nil {
                        print(error!)
                    }
                }
            })
        }
    }
    
    
    // MARK: - Create new bottle
    
    
    func createNewBottle(name: String) {
        
        
        
        
        
    }
    
    
    
/*
 Sending data TO Firebase:
 
 1. func to add 2 users to specific chat
 
 2. func to remove user from specific chat
 
 3. create new user
 
 4. create new chat
 
 5. add message to chat
 
 6. create bottle message for specific ocean
 
 */


/*
 Retreiving data FROM Firebase:
 
 1. append messages for each user to [Message]() that will be dislpayed on table view
 
 2. append messages to [Message]() in ocean in tableView
 
 3. retreive user info of given user / self
 
 
 */
 
 
 
 }



