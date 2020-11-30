
import UIKit
import Alamofire
import UserNotifications

class BookStoreLoginVc: UIViewController,UNUserNotificationCenterDelegate {

        @IBOutlet weak var enterMobileNumber: UITextField!
    var UserContactNumber = String()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let defaults = UserDefaults.standard


            guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
               return
            }
            print(deviceID)
        }
        
        @IBAction func btnSignUp(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTypeOfBusniessPageVc") as! BookStoreTypeOfBusniessPageVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        @IBAction func btnSendOTP(_ sender: Any) {
          // getLogin()
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreOTPVerificationVc") as! BookStoreOTPVerificationVc
            self.present(nextViewController, animated:true, completion:nil)



        }
        

        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
        @IBAction func btnUserEmail(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoginWithEmailVc") as! BookStoreLoginWithEmailVc
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
                                    "business_mobile":self.UserContactNumber
                                    
                                    
                                    
                                ]
                                
                                print(parametersBal)
                                
                                
                                
                                Alamofire.request("http://laxmi1963.com/ZaarMall/bookStore_login", method: .post, parameters: parametersBal).responseJSON
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
                                                nextViewController.StrUserMobilNumber = self.enterMobileNumber.text!


                                                
                                                    var strData = Int()
                                                     var strData1 =  Int(data)
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


                                                
                                                
                                                
                                                
                                                //enterMobileNumber.text
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
