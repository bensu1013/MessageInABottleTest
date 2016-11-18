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
    let store = DataStore.sharedInstance
    
    
    //MARK: - Sign Up & Log In Funcs
    
    func signInButton(email: String, password: String) {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                
            }
            guard let user = FIRAuth.auth()?.currentUser else { print("error"); return }
            FIRAuth.auth()?.currentUser?.uid
        }
    }
    
    
    func signUpButton(email: String, password: String, firstName: String, lastName: String) {
    
        if email != "" && password != "" {
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    let userDictionary = [(user?.uid)! : ["email": email, "firstName": firstName, "lastName": lastName, "uniqueKey": (user?.uid)!]]
                    
                    self.ref.child("users").child((user?.uid)!).setValue(userDictionary)
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }

                
            })
        }
    }
    
    
    // MARK: - Create new bottle message
    
    
    func createNewBottle(uniqueID: String, oceanID: String, messageContent: String) {
        
        let messageDictionary = ["uniqueKey": uniqueID, "messageContent": messageContent, "timestamp": String(describing: Date().timeIntervalSince1970)]
        let messageID = ref.childByAutoId().key
        
        ref.child("bottle").child(oceanID).setValue(messageDictionary, forKey: messageID)
        
    }
    
    
    // MARK: - Create chat room 
    
    
    func createChatRoomForUsers(userOne: User, userTwo: User) {
        
        let chatID = ref.childByAutoId().key
        let title = "Chat with \(userOne.name) and \(userTwo.name)"
        
        
        ref.child("users").child(userOne.uniqueKey).child("chats").setValue(userTwo.uniqueKey, forKey: chatID)
        
        ref.child("users").child(userTwo.uniqueKey).child("chats").setValue(userOne.uniqueKey, forKey: chatID)
        
        ref.child("chats").setValue(["title": title, "timestamp": String(describing: Date().timeIntervalSince1970)], forKey: chatID)
        
        ref.setValue(chatID, forKey: "chatMessages")
        
    }
    
    
    func sendMessage(sender: User, messageContent: String, chatID: String) {
        
        let messageID = ref.childByAutoId().key
        ref.child("chatMessages").child(chatID).setValue(["senderName": sender.name, "messageContent": messageContent, "timestamp": Date().timeIntervalSince1970.description] , forKey: messageID)
        
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



