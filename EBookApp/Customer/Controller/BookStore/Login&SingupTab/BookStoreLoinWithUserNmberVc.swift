
import UIKit
import Alamofire

class BookStoreLoinWithUserNmberVc: UIViewController {

        @IBOutlet weak var PasswordTect: UITextField!
        @IBOutlet weak var mobileNumberText: UITextField!
    
    var UserContactNumber = String()
    var UserPassword = String()
    var UserEmail = String()
    

        override func viewDidLoad() {
                super.viewDidLoad()

                // Do any additional setup after loading the view.
            }
            
            @IBAction func btnSignUp(_ sender: Any) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTypeOfBusniessPageVc") as! BookStoreTypeOfBusniessPageVc
                self.present(nextViewController, animated:true, completion:nil)

            }
    @IBAction func btnHidePassword(_ sender: Any) {
        if(PasswordTect.isSecureTextEntry == true){
            PasswordTect.isSecureTextEntry = false
        }
        else{
            PasswordTect.isSecureTextEntry = true
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        //getLogin()
                let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
                self.present(nextViewController, animated:true, completion:nil)

            }
            

            @IBAction func btnSkip(_ sender: Any) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
                self.present(nextViewController, animated:true, completion:nil)

            }
            
            @IBAction func btnForgatePassword(_ sender: Any) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreForgatePasswordVc") as! BookStoreForgatePasswordVc
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
                        
                        displayMyAlertMessage(userMessage: "Please Enter Mobile number")

                    }
                    else if (UserPassword.isEmpty) {
                        displayMyAlertMessage(userMessage: "Please Enter Password")

                    }
             }

             else{
                            if isValidPhone(phone: UserContactNumber){

            
                                    let parametersBal: Parameters=[
                                        "business_mobile":self.UserContactNumber
                                        
                                        
                                        
                                    ]
                                    
                                    print(parametersBal)
                                    
                                    
                                    
                                    Alamofire.request("http://zaarmall.com/development/bookStore_login", method: .post, parameters: parametersBal).responseJSON
                                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                 var message = (result as AnyObject).value(forKey: "message") as! NSString
                                                let data = (result as AnyObject).value(forKey: "data") as! NSNumber



                                                
                                                if (status == 200 as CFBoolean)
                                                {

                                                    
                                                    
    //                                                UserDefaults.standard.set(self.data, forKey: "data")
    //                                                UserDefaults.standard.synchronize()
                                                 LoginHelperFunctions.notifyUser("Alert", message: "Login Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                                  print("Login sucess")
                                                    let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                                                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreOTPVerificationVc") as! BookStoreOTPVerificationVc
                                                    nextViewController.StrOTPNumber = data
                                                   // nextViewController.StrUserMobilNumber = self.enterMobileNumber.text!


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
                                displayMyAlertMessage(userMessage: "Please Enter Valid ContactNumber")

                                
                }
                
                }

                    

        }

            
        }
