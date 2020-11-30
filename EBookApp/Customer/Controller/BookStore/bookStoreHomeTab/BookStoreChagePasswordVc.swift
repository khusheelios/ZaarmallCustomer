
import UIKit
import Alamofire

class BookStoreChagePasswordVc: UIViewController {

        @IBOutlet weak var OldPasswordText: UITextField!
        @IBOutlet weak var NewPasswordTect: UITextField!
        @IBOutlet weak var ConfromPasswordTect: UITextField!



        override func viewDidLoad() {
            super.viewDidLoad()
//            getChahgePassword()

            // Do any additional setup after loading the view.
        }
        
        @IBAction func btnBack(_ sender: Any) {
           self.dismiss(animated: true, completion: nil)

        }
    @IBAction func btnOldPassword(_ sender: Any) {
        OldPasswordText.isSecureTextEntry = false

    }
    @IBAction func btnNewPassword(_ sender: Any) {
        NewPasswordTect.isSecureTextEntry = false

    }
    
    @IBAction func btnConfromPassword(_ sender: Any) {
        ConfromPasswordTect.isSecureTextEntry = false

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
                                        "user_id":"2",
                                        "old_password":OldPasswordText.text!,
                                        "new_password":NewPasswordTect.text!,
                                        "confirm_password":ConfromPasswordTect.text!
                                        
                                        
                                    ]
                                    
                                    print(parametersBal)
                                    
                                    
                                    
                                    Alamofire.request("http://laxmi1963.com/ZaarMall/bookStore_changePassword", method: .post, parameters: parametersBal).responseJSON
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
