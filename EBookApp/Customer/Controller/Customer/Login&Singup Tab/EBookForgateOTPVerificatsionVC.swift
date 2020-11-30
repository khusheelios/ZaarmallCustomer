//
//  EBookForgateOTPVerificatsionVC.swift
//  EBookApp
//
//  Created by apple on 28/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications


class EBookForgateOTPVerificatsionVC: UIViewController,UNUserNotificationCenterDelegate {

    

    @IBOutlet weak var Timerlbl: UILabel!
    @IBOutlet weak var btnSubmit: CustomizableButton!
    @IBOutlet weak var OTPFourText: CustomizableTextfield!
    @IBOutlet weak var OTPThreeText: CustomizableTextfield!
    @IBOutlet weak var OTPTwoText: CustomizableTextfield!
    @IBOutlet weak var OTPOneText: CustomizableTextfield!
    @IBOutlet weak var mobilenumberlbl: UILabel!
    
    var StrForgateOTPNumber = NSNumber()
    var StrForgateEmail = String()

    var StrOTPNumber1 = NSNumber()
    var otpdata = NSNumber()
    var strData = NSNumber()

    var strMactchOTP = 0

 
    var  StrUserMobilNumber = String()
        var StrUserMobil = ""

    
    var timer = Timer()
    var counter = 0
    
    
     var strThirddigit = Int()
     var strfourdigit = Int()
     var strfivedigit = Int()
     var strSixdigit = Int()
    
    var userId = String()
    var userName = String()

    var userEmail = String()

    var userPassword = String()

    var userProfile_pic = String()

    var userPhone = String()


    var usercreated_date = String()
    
    
    var isSingup1:Bool = true




    override func viewDidLoad() {
        super.viewDidLoad()
        mobilenumberlbl.text = StrUserMobilNumber
        let defaults = UserDefaults.standard
        
        strMactchOTP = Int(StrForgateOTPNumber)

        
    
            counter = 30
                    Timerlbl.text = "00:\(counter)"

                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EBookOTPVerificatsionVC.updateCounter), userInfo: nil, repeats: true)
                    
                                OTPOneText.isUserInteractionEnabled = false
                                OTPTwoText.isUserInteractionEnabled = false
                                OTPThreeText.isUserInteractionEnabled = false
                                OTPFourText.isUserInteractionEnabled = false
                    
                    
                    
                    strThirddigit = (Int(strMactchOTP) % 10000)/1000
                    OTPOneText.placeholder = String(strThirddigit)

                    
                    strfourdigit = (Int(strMactchOTP) % 1000)/100
                    OTPTwoText.placeholder = String(strfourdigit)

                    
                    strfivedigit = (Int(strMactchOTP) % 100)/10
                    OTPThreeText.placeholder = String(strfivedigit)

                    
                    strSixdigit = Int(strMactchOTP) % 10
                    OTPFourText.placeholder = String(strSixdigit)
        
        

                }
        
        

        
        
        
        
                @objc func updateCounter() {
                    
                    counter -= 1
                    Timerlbl.text = "00:\(counter)"
                    
                    if counter == 0 {
                        timer.invalidate()
                        Timerlbl.text = "Time Out!!!"
                    }
                    
                }


    
    @IBAction func btnOTPBs(_ sender: Any) {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookWelcomeScreenPageTwoVc") as! EBookWelcomeScreenPageTwoVc
//        self.present(nextViewController, animated:true, completion:nil)
//
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
             getMatchOTP()

    }
    
    @IBAction func btnResendOTP(_ sender: Any) {
        getResendOTP()
        
            strData = otpdata
        var strData1 =  Int(strData)
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
        



    }
    @IBAction func btnSkip(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    


    
        func getResendOTP(){
            
            let parametersBal: Parameters=[
                "email":self.StrForgateEmail

                
            ]
            
            print(parametersBal)
            // BasUrl.baseURLPOST + "customer_login"
             //http://zaarmall.com/development/resend_otp
            
                            Alamofire.request(BasUrl.baseURLPOST + "resend_otp", method: .post, parameters: parametersBal).responseJSON
                                {
                                    response in
                                    
                                    print(response)
                                    
                                    //getting the json value from the server
                                    if let result = response.result.value {
                                        
                                        
                                        var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                        self.otpdata = (result as AnyObject).value(forKey: "data") as! NSNumber

                                        
                                        


                                        
                                        if (status == 200 as CFBoolean )
                                        {
                                            print("OTP")
                                            self.strMactchOTP = Int(self.otpdata)

                                            LoginHelperFunctions.notifyUser("Alert", message: "Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                                                
                                                self.counter = 30
                                                self.Timerlbl.text = "00:\(self.counter)"

                                                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EBookOTPVerificatsionVC.updateCounter), userInfo: nil, repeats: true)
                                                            
                                                self.OTPOneText.isUserInteractionEnabled = false
                                                self.OTPTwoText.isUserInteractionEnabled = false
                                                self.OTPThreeText.isUserInteractionEnabled = false
                                                self.OTPFourText.isUserInteractionEnabled = false
                                                            
                                                            
                                                            
                                                self.strThirddigit = (Int(self.otpdata) % 10000)/1000
                                                self.OTPOneText.placeholder = String(self.strThirddigit)

                                                            
                                                self.strfourdigit = (Int(self.otpdata) % 1000)/100
                                                self.OTPTwoText.placeholder = String(self.strfourdigit)

                                                            
                                                self.strfivedigit = (Int(self.otpdata) % 100)/10
                                                self.OTPThreeText.placeholder = String(self.strfivedigit)

                                                            
                                                self.strSixdigit = Int(self.otpdata) % 10
                                                self.OTPFourText.placeholder = String(self.strSixdigit)

                                                


                                            })

                                        }
                                        
                                        else{
                                            
                                        }
                                    }
            }

            
        }

    
    
    
    
    func getMatchOTP(){
        
    
        
        print(strMactchOTP)
        let parametersBal: Parameters=[
            "email":self.StrForgateEmail,
            "otp":self.strMactchOTP
            ]
        
        print(parametersBal)
                 // BasUrl.baseURLPOST + "customer_login"
                 //http://zaarmall.com/development/customer_match_otp

                        Alamofire.request(BasUrl.baseURLPOST + "customer_match_otp", method: .post, parameters: parametersBal).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                   
                                    


                                    
                                    if (status == 200 as CFBoolean )
                                    {
                                        
                                        var data = (result as AnyObject).value(forKey: "data") as! NSDictionary

                                                                           
                                        
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




                                            self.userPhone = (data as AnyObject).value(forKey: "phone") as! String

                                            print(self.userPhone)

                                            UserDefaults.standard.set(self.userPhone, forKey: "phone")
                                            UserDefaults.standard.synchronize()



                                            self.usercreated_date = (data as AnyObject).value(forKey: "created_date") as! String

                                            print(self.usercreated_date)

                                            UserDefaults.standard.set(self.usercreated_date, forKey: "created_date")
                                            UserDefaults.standard.synchronize()





                                            
                                            
                                        

                                        
                                        LoginHelperFunctions.notifyUser("Alert", message: "Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                                   let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                   let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookUpdatePasswordVc") as! EBookUpdatePasswordVc
                                            nextViewController.getStrCustomerId = self.userId
                                   self.present(nextViewController, animated:true, completion:nil)

                                        })


                                    }
                                    
                                    else{
                                        
                                    }
                                }
        }
        
        
        
    }

    }
    


