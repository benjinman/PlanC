//
//  LogInViewController.swift
//  PlanC
//
//  Created by iGuest on 11/29/16.
//  Copyright © 2016 PlanB. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func signIn () {
        //FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            // ...
        //FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: <#T##FIRAuthResultCallback?##FIRAuthResultCallback?##(FIRUser?, Error?) -> Void#>)
    }
        
	@IBAction func logIn(_ sender: AnyObject) {
        // check if username exists
        
        // check if password is correct for username
        
        performSegue(withIdentifier: "logInToProfileSegue", sender: self)
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
