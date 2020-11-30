//
//  EBookLoginVC.swift
//  EBookApp
//
//  Created by apple on 15/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Loaf

class EBookLoginVC: UIViewController {

    @IBOutlet weak var enterMobileNumber: UITextField!
    var UserContactNumber = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSingupVc") as! EBookSingupVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnSendOTP(_ sender: Any) {
        
        getLogin()

    }
    

    @IBAction func btnSkip(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnUserEmail(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginWithEmailVc") as! EBookLoginWithEmailVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
            func displayMyAlertMessage(userMessage:String)
            {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
                let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
                let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
                myAlert.addAction(okAction);
                myAlert.addAction(cancelAction);
                self.present(myAlert, animated: true,completion:nil);
                
                
            }

            
            func isValidPhone(phone: String) -> Bool {
                let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
                let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
                return phoneTest.evaluate(with: phone)
            }

            
            func getLogin(){
                
                UserContactNumber = enterMobileNumber.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

                 if (UserContactNumber.isEmpty) {
                    
                    displayMyAlertMessage(userMessage: "Please Enter Mobile Number")

                }
                 else{
                                if isValidPhone(phone: UserContactNumber){

                
                                        let parametersBal: Parameters=[
                                            "phone":self.UserContactNumber,
                                            "password":self.UserContactNumber

                                            
                                            
                                            
                                        ]
                                        
                                        print(parametersBal)
                                        
                                        
                                        
                                        Alamofire.request("http://zaarmall.com/development/customer_login", method: .post, parameters: parametersBal).responseJSON
                                            {
                                                response in
                                                
                                                print(response)
                                                
                                                //getting the json value from the server
                                                if let result = response.result.value {

                                                    //converting it as NSDictionary
                                                    let jsonData = result as! NSDictionary
                                                    
                                                    let strStatus = jsonData["status"] as? Int
                                                    
                                                    let strMessage = jsonData["message"] as? String
                                                                                                       
                                                   

                                                    
                                                    if strStatus == 200
                                                    {

                                                        
                                                        if let getdata = jsonData["data"] as? [String: Any]
                                                        {
                                                            
                                                            let strCustomer_id = jsonData["customer_id"] as? Int
                                                                                                               
                                                                                                              
                                                            
                                                                
                                                                UserDefaults.standard.set(strCustomer_id, forKey: "customer_id")
                                                                UserDefaults.standard.synchronize()
                                                            
                                                                                                         LoginHelperFunctions.notifyUser("Alert", message: "Login Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                                                                                          print("Login sucess")
                                                                                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                                                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookOTPVerificatsionVC") as! EBookOTPVerificatsionVC
                                                                                                            //nextViewController.StrOTPNumber = data
                                                                                                            nextViewController.StrUserMobilNumber = self.enterMobileNumber.text!


                                                                                                            


                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                            //enterMobileNumber.text
                                                                                                            self.present(nextViewController, animated:true, completion:nil)

                                                                                                            })
                                                            
                                                        }
                                                        



                                                        
                                                        
                                                        


                                                    }
                                                    else if strStatus == 1{
                                                        print("Already Exit")
                                                        
                                                        Loaf(strMessage ?? "Something went wrong.", state: .error, location: .bottom, sender: self).show()

                                                    }
                                                    else{
                                                        
                                                    }

                                                }

                                             }
                    
                    }
                                else{
                                    displayMyAlertMessage(userMessage: "Please Enter Valid ContactNumber")

                                    
                    }
                    
                    }

                        

            }
    
    
    

    
}
