//
//  EBookSingupVc.swift
//  EBookApp
//
//  Created by apple on 15/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications
import Loaf

class EBookSingupVc: UIViewController,UNUserNotificationCenterDelegate {

    @IBOutlet weak var btnsingup: CustomizableButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var yourNameText: UITextField!
    @IBOutlet weak var ConfromPasswordText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var UserName = String()
    var UserEmail = String()
    var UserPassword = String()
    var UserConfromPassword = String()
    var UserPhoneNumber = String()
    var StrOTPNumber1 = NSNumber()
    
    var isSingup:Bool = false

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnHidePassword(_ sender: Any) {
        if (passwordText.isSecureTextEntry == true){
            passwordText.isSecureTextEntry = false

        }else{
            passwordText.isSecureTextEntry = true

        }

    }
    @IBAction func btnHideConfromPassword(_ sender: Any) {
        if(ConfromPasswordText.isSecureTextEntry == true){
            ConfromPasswordText.isSecureTextEntry = false

        }
        else{
            ConfromPasswordText.isSecureTextEntry = true

        }

    }
    

    
    @IBAction func btnSkip(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookOTPVerificatsionVC") as! EBookOTPVerificatsionVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnSingup(_ sender: Any) {
        getSingup()


    }
    

    
    
    
        func displayMyAlertMessage(userMessage:String)
        {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
            let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
            let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
            myAlert.addAction(okAction);
            myAlert.addAction(cancelAction);
            self.present(myAlert, animated: true,completion:nil);
            
            
        }

        
    //        func isValidPassword(testStr:String?) -> Bool {
    //            guard testStr != nil else { return false }
    //
    //            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*?[-!@#$%&*ˆ+=_]).{8,}")
    //            return passwordTest.evaluate(with: testStr)
    //        }
    //
            
            func isValidEmail(testStr:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: testStr)
            }

        
        
        func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }

    
        func getSingup(){
            
            UserName = yourNameText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            UserEmail = emailText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            UserPassword = passwordText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            UserConfromPassword = ConfromPasswordText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            
            UserPhoneNumber = mobileNumberText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

            if((UserName.isEmpty)
                || (UserEmail.isEmpty) || (UserPassword.isEmpty) || (UserConfromPassword.isEmpty) || (UserPhoneNumber.isEmpty))
                {
                   
                    if (UserName.isEmpty) {
                       
                    //   displayMyAlertMessage(userMessage: "Please Enter Name")
                        
                        Loaf("Please Enter Name", state: .info, location: .bottom, sender: self).show()


                   }
                   else if (UserEmail.isEmpty) {
                      // displayMyAlertMessage(userMessage: "Please Enter Email")
                        
                        Loaf("Please Enter Email", state: .info, location: .bottom, sender: self).show()


                   }
                   else if (UserPassword.isEmpty) {
                       
                        Loaf("Please Enter Password", state: .info, location: .bottom, sender: self).show()

                   //    displayMyAlertMessage(userMessage: "Please Enter Password")

                   }

                   else if (UserConfromPassword.isEmpty) {
                       
                   //    displayMyAlertMessage(userMessage: "Please Enter ConfromPassword")
                        
                        Loaf("Please Enter ConfromPassword", state: .info, location: .bottom, sender: self).show()


                   }
                   
                   else if (UserPhoneNumber.isEmpty) {
                       
                     //  displayMyAlertMessage(userMessage: "Please Enter Mobile Number")
                        
                        Loaf("Please Enter Mobile Number", state: .info, location: .bottom, sender: self).show()


                   }
            }

            else{
            
            
            if isValidEmail(testStr: UserEmail){
                if isValidPhone(phone: UserPhoneNumber){
                    if (UserPassword == UserConfromPassword){



            
                            let parametersBal: Parameters=[
                                "name":self.UserName,
                                "email":self.UserEmail,
                                "password":self.UserPassword,
                                "phone":self.UserPhoneNumber
//                                "cpassword":self.UserConfromPassword
                                
                                
                                
                                
                            ]
                            
                            print(parametersBal)
                            
                           // BasUrl.baseURLPOST + "customer_login"
                        // http://zaarmall.com/development/customer_signup
                            
                            Alamofire.request(BasUrl.baseURLPOST + "customer_signup", method: .post, parameters: parametersBal).responseJSON
                                {
                                    response in
                                    
                                    print(response)
                                    
                                    //getting the json value from the server
                                    if let result = response.result.value {
                                        
                                        
                                        var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                         var message = (result as AnyObject).value(forKey: "message") as! String
                               



                                        
                                        if (status == 200 as CFBoolean)
                                        {
                                            
                                    var data = (result as AnyObject).value(forKey: "data") as! NSDictionary

                                            
                                            self.isSingup = true
                                            
                                            UserDefaults.standard.set(self.isSingup, forKey: "Singup Sucess")
                                            UserDefaults.standard.synchronize()

                                            
                                            self.StrOTPNumber1 = (data as AnyObject).value(forKey: "otp") as! NSNumber

                                            print(self.StrOTPNumber1)
                                            
                                            UserDefaults.standard.set(self.StrOTPNumber1, forKey: "otp")
                                            UserDefaults.standard.synchronize()

                                            
                                            LoginHelperFunctions.notifyUser("Alert", message: "Registration Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                          print("register sucess")
                                            
                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookOTPVerificatsionVC") as! EBookOTPVerificatsionVC
                                                nextViewController.StrSingupOTPNumber = self.StrOTPNumber1
                                                nextViewController.StrUserMobilNumber = self.UserPhoneNumber
                                                nextViewController.isSingup1 = self.isSingup
                                                
                                                    var strData = Int()
                                                var strData1 =  Int(self.StrOTPNumber1)
                                                    var strData2 = String(strData1)
                                                
                                                
                                                let content = UNMutableNotificationContent()

                                                //adding title, subtitle, body and badge
                                                content.title = "OneTime Password"
                                                content.subtitle = "Verify OTP"
                                                content.body = strData2
                                                content.badge = 1

                                                //getting the notification trigger
                                                //it will be called after 5 seconds
                                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

                                                //getting the notification request
                                                let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)

                                                UNUserNotificationCenter.current().delegate = self

                                                //adding the notification to notification center
                                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)


                                                
                                                
                                            self.present(nextViewController, animated:true, completion:nil)


                                            })

                                            
                                            
                                            


                                        }
                                        else if(status == 1 as CFBoolean){
                                          //  self.displayMyAlertMessage(userMessage: "Phone Number is Already Exit")
                                            
                                            Loaf("Phone Number is Already Exit", state: .error, location: .bottom, sender: self).show()


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
                else{
                    displayMyAlertMessage(userMessage: "Please Enter Valid ContactNumber")

                }

                }
                else{
                    displayMyAlertMessage(userMessage: "Please Enter Valid EmailAddress")

                }

        
                }
                
            
            
            
        }

}
