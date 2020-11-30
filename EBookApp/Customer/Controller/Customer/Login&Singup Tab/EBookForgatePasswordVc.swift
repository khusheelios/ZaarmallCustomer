//
//  EBookForgatePasswordVc.swift
//  EBookApp
//
//  Created by apple on 21/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire


class EBookForgatePasswordVc: UIViewController {
    
    var UserEmail = String()

    
    @IBOutlet weak var enterMobileNumber: UITextField!
    var UserContactNumber = String()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSendOTP(_ sender: Any) {
        //EBookUpdatePasswordVc
        
        getForgatePassword()
        

        

    }
        func displayMyAlertMessage(userMessage:String)
        {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
            let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
            let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
            myAlert.addAction(okAction);
            myAlert.addAction(cancelAction);
            self.present(myAlert, animated: true,completion:nil);
            
            
        }

        
            
            func isValidEmail(testStr:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: testStr)
            }


    
    
    func getForgatePassword(){
        
        
        UserEmail = enterMobileNumber.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
         if (UserEmail.isEmpty) {
            
            displayMyAlertMessage(userMessage: "Please Enter Email")

        }
       
        if isValidEmail(testStr: UserEmail){

                                let parametersBal: Parameters=[
                                    "email":self.UserEmail
                                    
                                ]
                                
                                print(parametersBal)
                                
                                // BasUrl.baseURLPOST + "customer_login"
                                //http://zaarmall.com/development/forgotPassword
                                
                                Alamofire.request(BasUrl.baseURLPOST + "forgotPassword"
, method: .post, parameters: parametersBal).responseJSON
                                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                             var message = (result as AnyObject).value(forKey: "message") as! NSString
                                            var data = (result as AnyObject).value(forKey: "data") as! NSNumber



                                            
                                            if (status == 200 as CFBoolean)
                                            {

                                                LoginHelperFunctions.notifyUser("Alert", message: "Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                                

                                              print("successfully")

                                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookForgateOTPVerificatsionVC") as! EBookForgateOTPVerificatsionVC
                                                    
                                                    nextViewController.StrForgateOTPNumber = data
                                                    nextViewController.StrForgateEmail = self.UserEmail

                                                    
                                                self.present(nextViewController, animated:true, completion:nil)




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
        else{
            displayMyAlertMessage(userMessage: "Please Enter Valid EmailAddress")

        }
    }

}
