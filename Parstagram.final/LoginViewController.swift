//
//  LoginViewController.swift
//  Parstagram.final
//
//  Created by Julio Rodriguez  on 3/24/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        testParseConnection()
    }
    
    
    func testParseConnection(){
            let myObj = PFObject(className:"FirstClass")
            myObj["message"] = "Hey ! First message from Swift. Parse is now connected"
            myObj.saveInBackground { (success, error) in
                if(success){
                    print("You are connected!")
                }else{
                    print("An error has occurred!")
                }
            }
        }
    
    

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
            else{
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
        
    
 
        
        


    
    
   
}

    

    



