//
//  EBookUpdatePasswordVc.swift
//  EBookApp
//
//  Created by apple on 21/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookUpdatePasswordVc: UIViewController {

    
    @IBOutlet weak var NewPassword: UITextField!
    @IBOutlet weak var ConfromPassword: UITextField!

    @IBOutlet weak var btnhideConfromPassword: UIButton!
    
    @IBOutlet weak var confrompass: UITextField!
    @IBOutlet weak var btnHideNewPassword: UIButton!
    
    var UserPassword = String()
    var UserConfromPassword = String()
    var getStrCustomerId = String()

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnhideConfromPassword(_ sender: Any) {
        if (confrompass.isSecureTextEntry == true){
            confrompass.isSecureTextEntry = false
        }
        else{
            confrompass.isSecureTextEntry = true

        }

    }
    @IBAction func btnHideNewPassword(_ sender: Any) {
        if (NewPassword.isSecureTextEntry == true){
            NewPassword.isSecureTextEntry = false
        }
        else{
            NewPassword.isSecureTextEntry = true

        }
    }
    @IBAction func UpdatePassword(_ sender: Any) {
        UpdatePassword()
    }
    
    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }

    func UpdatePassword(){
        
        UserPassword = NewPassword.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserConfromPassword = confrompass.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if((UserPassword.isEmpty)
            || (UserConfromPassword.isEmpty))
            {
               
                if (UserPassword.isEmpty) {
                   
                   displayMyAlertMessage(userMessage: "Please Password")

               }
               else if (UserConfromPassword.isEmpty) {
                   displayMyAlertMessage(userMessage: "Please Enter ConfromPassword")

               }
        }

        else
        {
            if (UserPassword == UserConfromPassword){

        let parametersBal: Parameters=[
            "customer_id":self.getStrCustomerId,
            "password":self.UserPassword

            
        ]
        
        print(parametersBal)
                
                // BasUrl.baseURLPOST + "customer_login"
                //http://zaarmall.com/development/changePassword
        
                        Alamofire.request(BasUrl.baseURLPOST + "changePassword", method: .post, parameters: parametersBal).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                    //var data = (result as AnyObject).value(forKey: "data") as! NSNumber

                                    
                                    


                                    
                                    if (status == 200 as CFBoolean )
                                    {

                                        LoginHelperFunctions.notifyUser("Alert", message: "Password Change Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                                                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                            
                                                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
                                                    self.present(nextViewController, animated:true, completion:nil)




                                        })

                                    }
                                    
                                    else{
                                        
                                    }
                                }
        }
            }
            else{
                displayMyAlertMessage(userMessage: "Password and ConfromPassword not Match")

            }

                
                
                
        }
        
    }

}
