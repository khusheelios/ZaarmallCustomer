
import UIKit
import Alamofire
import Loaf

class EBookLoginNumberVc: UIViewController {

    @IBOutlet weak var PasswordTect: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    var UserContactNumber = String()
    var UserPassword = String()
    var UserEmail = String()
    
    var userId = String()
    var userName = String()

    var userEmail = String()

    var userPassword = String()

    var userProfile_pic = String()

    var userPhone = String()


    var usercreated_date = String()


    override func viewDidLoad() {
            super.viewDidLoad()
        let defaults = UserDefaults.standard


        }
        
    
        @IBAction func btnSignUp(_ sender: Any)
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSingupVc") as! EBookSingupVc
            self.present(nextViewController, animated:true, completion:nil)
        }
    
    
    
        @IBAction func btnLogin(_ sender: Any) {
            getLogin()

        }
        
    
    @IBAction func btnHidePassword(_ sender: Any) {
        if(PasswordTect.isSecureTextEntry == true){
        PasswordTect.isSecureTextEntry = false
        }
        else{
            PasswordTect.isSecureTextEntry = true
        }

    }
    

        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
        @IBAction func btnForgatePassword(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookForgatePasswordVc") as! EBookForgatePasswordVc
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
            
            UserContactNumber = mobileNumberText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            UserPassword = PasswordTect.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)


             if((UserContactNumber.isEmpty)
                 || (UserPassword.isEmpty) )
                 {
                    
                     if (UserContactNumber.isEmpty) {
                     
                        Loaf("Please Enter Mobile number", state: .info, location: .bottom, sender: self).show()

                    }
                    else if (UserPassword.isEmpty) {
                       
                        Loaf("Please Enter Password", state: .info, location: .bottom, sender: self).show()

                    }
             }

             else{
                      //      if isValidPhone(phone: UserContactNumber){

            
                                    let parametersBal: Parameters=[
                                        "phone":self.UserContactNumber,
                                        "password":self.UserPassword

                                        
                                        
                                        
                                    ]
                                    
                                    print(parametersBal)
                                    
                                    //BasUrl.baseURLPOST
                                    //http://zaarmall.com/development/customer_login
                                    
                                    Alamofire.request(BasUrl.baseURLPOST + "customer_login", method: .post, parameters: parametersBal).responseJSON
                                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                let jsonData = result as! NSDictionary
                                                                                                         
                                                print(jsonData)
                                                
                                                
                                                let strMessage = jsonData["message"] as? String
                                                                               
                                                let strStatus = jsonData["status"] as? Int
                                                
                                                
                                               

                                                if strStatus == 200
                                                {

                                                   
                                                    if let data = jsonData["data"] as? [String: Any] {
                                                        self.userId = (data as AnyObject).value(forKey: "customer_id") as! String

                                                                                                                                        print(self.userId)
                                                                                                                                        
                                                                                                                                        UserDefaults.standard.set(self.userId, forKey: "customer_id")
                                                                                                                                        UserDefaults.standard.synchronize()

                                                                                                                                        
                                                                                                                                        self.userName = (data as AnyObject).value(forKey: "name") as! String

                                                                                                                                        print(self.userName)
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        UserDefaults.standard.set(self.userName, forKey: "name")
                                                                                                                                        UserDefaults.standard.synchronize()


                                                                                                                                        self.userEmail = (data as AnyObject).value(forKey: "email") as! String

                                                                                                                                        print(self.userEmail)
                                                                                                                                        UserDefaults.standard.set(self.userEmail, forKey: "email")
                                                                                                                                        UserDefaults.standard.synchronize()
                                                                                                                                        
                                                                                                                                        

                                                                                                                                        self.userPassword = (data as AnyObject).value(forKey: "password") as! String

                                                                                                                                        print(self.userPassword)
                                                                                                                                        
                                                                                                                                        UserDefaults.standard.set(self.userPassword, forKey: "password")
                                                                                                                                        UserDefaults.standard.synchronize()


                                                                                            //                                            self.userProfile_pic = (user as AnyObject).value(forKey: "profile_pic") as! String
                                                                                            //
                                                                                            //                                            print(self.userProfile_pic)
                                                                                            //
                                                                                            //                                            UserDefaults.standard.set(self.userProfile_pic, forKey: "profile_pic")
                                                                                            //                                            UserDefaults.standard.synchronize()


                                                                                                                                        self.userPhone = (data as AnyObject).value(forKey: "phone") as! String

                                                                                                                                        print(self.userPhone)
                                                                                                                                        
                                                                                                                                        UserDefaults.standard.set(self.userPhone, forKey: "phone")
                                                                                                                                        UserDefaults.standard.synchronize()



                                                                                                                                        self.usercreated_date = (data as AnyObject).value(forKey: "created_date") as! String

                                                                                                                                        print(self.usercreated_date)
                                                                                                                                        
                                                                                                                                        UserDefaults.standard.set(self.usercreated_date, forKey: "created_date")
                                                                                                                                        UserDefaults.standard.synchronize()

                                                                                            
//                                                                                         LoginHelperFunctions.notifyUser("Alert", message: "Login Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                                                                          print("Login sucess")

                                                                                            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                                                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
                                                                                            
                                                                                            nextViewController.strCustomerId = self.userId
                                                                                            nextViewController.strCustomerName = self.userName

                                                                                            nextViewController.strCustomerEmail = self.userEmail

                                                                                            nextViewController.strCustomerPhone = self.userPhone

                                                                                            nextViewController.strCustomerPassword = self.UserPassword



                                                                                            
                                                                                            self.present(nextViewController, animated:true, completion:nil)


                                                                                            /*
                                                                                             var strCustomerId = String()
                                                                                             var strCustomerName = String()

                                                                                             var strCustomerEmail = String()

                                                                                             var strCustomerPhone = String()

                                                                                             var strCustomerPassword = String()

                                                                                             var strCustomerOTP = String()

                                                                                             var strCustomercreated_date = String()


                                                                                             
                                                                                             */


                                                                                            
                                                                                            
                                                                                            
                                                                                            

                                                                                         //   })
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
                
//                }
//                            else{
//                                displayMyAlertMessage(userMessage: "Please Enter Valid ContactNumber")
//
//
//                }
                
                }

                    

        }


        
    }
