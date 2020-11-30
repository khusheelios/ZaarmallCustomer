//
//  EBookContactUsVc.swift
//  EBookApp
//
//  Created by apple on 16/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookContactUsVc: UIViewController {

    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var UserName = String()
    var UserEmail = String()
    var UserMessage = String()

     var getUserId = String()

           override func viewDidLoad() {
               super.viewDidLoad()
               
               if getUserId.isEmpty
                   {
                       getUserId  = UserDefaults.standard.string(forKey: "customer_id")!
                   }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
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
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }



    
    @IBAction func btnProceed(_ sender: Any) {
        getCustomerSupport()
    }
    func getCustomerSupport(){
        
        UserName = NameText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserEmail = EmailText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserMessage = messageText.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if((UserName.isEmpty)
            || (UserEmail.isEmpty) || (UserMessage.isEmpty))
            {
               
                if (UserName.isEmpty) {
                   
                   displayMyAlertMessage(userMessage: "Please Enter Name")

               }
               else if (UserEmail.isEmpty) {
                   displayMyAlertMessage(userMessage: "Please Enter Email")

               }
               else if (UserMessage.isEmpty) {
                   
                   displayMyAlertMessage(userMessage: "Please Enter Message")

               }

        }

        else{
            if isValidEmail(testStr: UserEmail){

        let parametersBal: Parameters=[
            "customer_id":getUserId,
            "name":self.UserName,
            "email":self.UserEmail,
            "message":self.UserMessage

            
            
        ]
        
        print(parametersBal)
        
        
        
        Alamofire.request("http://laxmi1963.com/ZaarMall/add_customer_support", method: .post, parameters: parametersBal).responseJSON
            {
                response in
                
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    
                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                     var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                    var data = (result as AnyObject).value(forKey: "data") as! NSDictionary



                    
                    if (status == 200 as CFBoolean)
                    {

                        
                        LoginHelperFunctions.notifyUser("Alert", message: "Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in



                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc

                        
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

}
