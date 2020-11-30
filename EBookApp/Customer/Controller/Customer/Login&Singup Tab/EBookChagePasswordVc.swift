//
//  EBookChagePasswordVc.swift
//  EBookApp
//
//  Created by apple on 24/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookChagePasswordVc: UIViewController {

    
    @IBOutlet weak var OldPasswordText: UITextField!
    @IBOutlet weak var NewPasswordTect: UITextField!
    @IBOutlet weak var ConfromPasswordTect: UITextField!


    var getUserId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if getUserId.isEmpty
        {
            getUserId  = UserDefaults.standard.string(forKey: "customer_id")!
        }

        self.OldPasswordText.isHidden = false
        
        self.NewPasswordTect.isHidden = false
        
        self.ConfromPasswordTect.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)

    }
    @IBAction func btnOldPassword(_ sender: Any) {
        if (OldPasswordText.isSecureTextEntry == true){
            OldPasswordText.isSecureTextEntry = false

        }
        else{
            OldPasswordText.isSecureTextEntry = true

        }

    }
    @IBAction func btnNewPassword(_ sender: Any) {
        if (NewPasswordTect.isSecureTextEntry == true){
            NewPasswordTect.isSecureTextEntry = false

        }else{
            NewPasswordTect.isSecureTextEntry = true

        }

    }
    
    @IBAction func btnConfromPassword(_ sender: Any) {
        if (ConfromPasswordTect.isSecureTextEntry == true){
            ConfromPasswordTect.isSecureTextEntry = false

        }
        else{
            ConfromPasswordTect.isSecureTextEntry = true

        }

    }

    
    @IBAction func btnChangePassword(_ sender: Any) {
        getChahgePassword()
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSingupVc") as! EBookSingupVc
//        self.present(nextViewController, animated:true, completion:nil)
//
    }

    
    func getChahgePassword(){
                                let parametersBal: Parameters=[
                                    "customer_id":getUserId,
                                    "old_password":OldPasswordText.text!,
                                    "new_password":NewPasswordTect.text!,
                                    "confirm_password":ConfromPasswordTect.text!
                                    
                                    
                                ]
                                
                                print(parametersBal)
                                
                                // BasUrl.baseURLPOST + "customer_login"
                                //http://laxmi1963.com/ZaarMall/changePassword
                                
                                Alamofire.request(BasUrl.baseURLPOST + "changePassword", method: .post, parameters: parametersBal).responseJSON
                                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                             var message = (result as AnyObject).value(forKey: "message") as! NSString
                                            //var data = (result as AnyObject).value(forKey: "data") as! NSNumber



                                            
                                            if (status == 200 as CFBoolean)
                                            {

                                                LoginHelperFunctions.notifyUser("Alert", message: "Change Password Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                                

                                              print("Password Change successfully")

                                                



                                                })
                                                
                                                


                                            }
                                            else if(status == 1 as CFBoolean){
                                                print("Already Exit")

                                            }
                                            else{
                                                
                                            }

                                        }

                                     }

                

    }



}
