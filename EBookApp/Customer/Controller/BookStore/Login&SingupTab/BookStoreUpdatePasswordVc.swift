//
//  BookStoreUpdatePasswordVc.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class BookStoreUpdatePasswordVc: UIViewController {

        @IBOutlet weak var NewPassword: UITextField!
        @IBOutlet weak var ConfromPassword: UITextField!

    
        @IBOutlet weak var btnhideConfromPassword: UIButton!
        
        @IBOutlet weak var confrompass: UITextField!
        @IBOutlet weak var btnHideNewPassword: UIButton!
    var getUserId = String()

           override func viewDidLoad() {
               super.viewDidLoad()
               
               if getUserId.isEmpty
                   {
                       getUserId  = UserDefaults.standard.string(forKey: "customer_id")!
                   }

            // Do any additional setup after loading the view.
        }
        

        @IBAction func btnhideConfromPassword(_ sender: Any) {
            if (ConfromPassword.isSecureTextEntry == true){
                ConfromPassword.isSecureTextEntry = false
            }
            else{
                ConfromPassword.isSecureTextEntry = true

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
    //        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    //
    //        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
    //        self.present(nextViewController, animated:true, completion:nil)

       //    changePassword
            
            getUpdateProfileDetailsData()
            
        }
    
    
    
    
    func getUpdateProfileDetailsData(){
        
        guard let getNewPassword = NewPassword.text , NewPassword.text != "" else {
                           //   snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Username", textColor: UIColor.white, interval: 2)
                        displayMyAlertMessage(userMessage: "Please Enter New Password")

            
                              return
                          }
                          guard let getConfromPassword = ConfromPassword.text , ConfromPassword.text != "" else {
                          //    snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Password", textColor: UIColor.white, interval: 2)
                            
                                 displayMyAlertMessage(userMessage: "Please Enter Confirm Password")
                            
                              return }
        
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                let parametersBal: Parameters=[
                   "customer_id":getUserId,
                    "old_password":getConfromPassword,
                    "new_password":getNewPassword
        ]
                
                print(parametersBal)

                
                Alamofire.request("http://zaarmall.com/development/get_all_product", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            


                                            
                                            if strStatus == 200
                                            {
                                                   MBProgressHUD.hide(for: self.view, animated: true)
                                             
                                                         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                             
                                                     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
                                                     self.present(nextViewController, animated:true, completion:nil)

                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }

    func displayMyAlertMessage(userMessage:String)
             {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
                 let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
                 let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
                 myAlert.addAction(okAction);
                 myAlert.addAction(cancelAction);
                 self.present(myAlert, animated: true,completion:nil);
                 
                 
             }
    

}
