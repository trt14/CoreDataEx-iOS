//
//  ViewController.swift
//  CoreDataEx
//
//  Created by Tarooti on 25/05/1443 AH.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = [
                   ["firstName": "John", "email": "john.blake@example.com"],
                   ["firstName": "Rodney", "email": "rodney.roberts20@example.com"]
               ]
               users.forEach {
                   user in
                   let newUser = User(context: managedObjectContext) // Should have been declared as a constant within the ViewController's scope
                   newUser.firstName = user["firstName"]
                   newUser.email = user["email"]
                   do {
                       try managedObjectContext.save()
                       print("Success in VC")
                   } catch {
                       print("Unresolved error \(error)")
                       abort()
                   }
               }
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSave(_ sender: Any) {
        let user = User(context: managedObjectContext)
        user.firstName = "Bob"
        user.email = "Bob@bobmail.com"
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success!")
                
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
}

