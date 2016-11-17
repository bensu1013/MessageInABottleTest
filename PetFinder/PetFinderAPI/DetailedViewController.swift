//
//  DetailedViewController.swift
//  PetFinderAPI
//
//  Created by Felicity Johnson on 10/23/16.
//  Copyright © 2016 FJ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class DetailedViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var animalPic: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!

    var animalToAdd: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = animalToAdd?.name
        breedLabel.text = animalToAdd?.breed
        ageLabel.text = animalToAdd?.age
        sizeLabel.text = animalToAdd?.size
        sexLabel.text = animalToAdd?.sex
        descriptionTextView.text = animalToAdd?.description
        animalPic.image = animalToAdd?.imageLink.setImageFromURl(stringImageUrl: (animalToAdd?.imageLink)!)
    }
    
    
    @IBAction func addToFavoritesButton(_ sender: AnyObject) {
        var favsToUpdate: [String] = []
        AnimalDataStore.sharedInstance.favorites.append(animalToAdd!)
        let ref = FIRDatabase.database().reference().root
        guard let unwrappedAnimalToAdd = animalToAdd?.name else {return}
        
        let key = (AnimalDataStore.sharedInstance.username)
        
        
        ref.child("favorites").observeSingleEvent(of: .value, with: { snapshot in
            print("Start")
            if let value = snapshot.value as? [String: Any] {
                let oldFavs = value[key]!
                favsToUpdate = oldFavs as! [String]
                favsToUpdate.append(unwrappedAnimalToAdd)
                ref.child("favorites").updateChildValues(["\(key)": favsToUpdate])
                
            } else {
                ref.child("favorites").updateChildValues(["\(key)": unwrappedAnimalToAdd])
            }
        })

        dismiss(animated: true, completion: nil)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
