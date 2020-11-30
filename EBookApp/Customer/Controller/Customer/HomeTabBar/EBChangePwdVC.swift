//
//  EBChangePwdVC.swift
//  EBookApp
//
//  Created by Zanjo iOS Dev on 22/09/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import Loaf
class EBChangePwdVC: UIViewController {

    @IBOutlet weak var txtOldPwd: UITextField!
    @IBOutlet weak var txtNewPwd: UITextField!
    @IBOutlet weak var txtConfirmPwd: UITextField!
    

    var getUserId = String()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    //    http://zaarmall.com/development/changePassword
    }
    
    @IBAction func saveAction(_ sender: Any)
    {
        guard let oldPassword = txtOldPwd.text , txtOldPwd.text != "" else {
                           //   snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Username", textColor: UIColor.white, interval: 2)
            Loaf("Enter Old Password", state: .info, location: .bottom, sender: self).show()
                  
                              return
                          }
                          guard let newPassword = txtNewPwd.text , txtNewPwd.text != "" else {
                          //    snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Password", textColor: UIColor.white, interval: 2)
                              Loaf("Enter New Password", state: .info, location: .bottom, sender: self).show()
                              
                              return }
                          guard let confirmPassword = txtConfirmPwd.text , txtConfirmPwd.text != "" else {
                                  Loaf("Enter Confirm Password", state: .info, location: .bottom, sender: self).show()
                                  
                            //      snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Mobile", textColor: UIColor.white, interval: 2)
                                  return }
        
        if txtNewPwd.text != txtConfirmPwd.text {
                            Loaf("Old & Confirm Password not match", state: .info, location: .bottom, sender: self).show()
                            
                      //      snackbarView.showSnackBar(view: self.view, bgColor: #colorLiteral(red: 0.6443261504, green: 0.1737350225, blue: 0.2090022564, alpha: 1), text: "Enter Mobile", textColor: UIColor.white, interval: 2)
                            return }
        
        
        changePwdOfProfile(getOldPwd: oldPassword, getNewPwd: newPassword)
        
    }
    
    func changePwdOfProfile(getOldPwd:String,getNewPwd:String){
            
                            let parametersBal: Parameters=[
                                "customer_id":getUserId,
                                "old_password":getOldPwd,
                                "new_password":getNewPwd
                                
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

                                         var message = (result as AnyObject).value(forKey: "message") as! String
                                  


                                        
                                        if (status == 200 as CFBoolean)
                                        {
                                           
                                              Loaf(message, state: .success, location: .bottom, sender: self).show()
                                            self.dismiss(animated: true, completion: nil)
                                             
                                        }
                                        else if(status == 1 as CFBoolean){
                                                   Loaf(message, state: .error, location: .bottom, sender: self).show()
                                            print("Already Exit")

                                        }
                                        else{
                                            
                                        }

                                    }

                                 }

            

            
        }

}
