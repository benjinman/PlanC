//
//  ProfileViewController.swift
//  PlanC
//
//  Created by iGuest on 11/29/16.
//  Copyright © 2016 PlanB. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
   
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
    var email = ""
    var address = ""
    var creditCard = ""
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            // 2
            if user == nil {
                // 3
                self.performSegue(withIdentifier: "profileToLogInSegue", sender: self)
            }
        }
        let ref = self.appDelegate.getDatabaseReference()
        let userID = FIRAuth.auth()?.currentUser?.uid
        let usersRef = ref.child("Users")
        let userRef = usersRef.child(byAppendingPath: userID!)
        userRef.setValue(["Address": "it fucking worked", "creditCard": "pay with my body", "email": email])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToProduct(_ sender: AnyObject) {
        // check if there's at least 1 address and is selected
        
        // check if there's at least 1 payment and is selected
        
        performSegue(withIdentifier: "profileToProductSegue", sender: self)
    }
    
    // log out user
    @IBAction func logOut(_ sender: AnyObject) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            performSegue(withIdentifier: "profileToLogInSegue", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileToAddress") {
            let controller = segue.destination as! AddAddressViewController
            controller.email = email
            controller.address = address
            controller.creditCard = creditCard
        }
        else if (segue.identifier == "profileToPayment"){
            let controller = segue.destination as! AddPaymentViewController
            controller.email = email
            controller.address = address
            controller.creditCard = creditCard
        }
        else if (segue.identifier == "profileToProduct"){
            let controller = segue.destination as! ProductPageViewController
            controller.email = email
            controller.address = address
            controller.creditCard = creditCard
            
        } else {
            
        }
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
