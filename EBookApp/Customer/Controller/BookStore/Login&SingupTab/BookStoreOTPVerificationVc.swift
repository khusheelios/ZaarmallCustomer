//
//  BookStoreOTPVerificationVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire


class BookStoreOTPVerificationVc: UIViewController{

        @IBOutlet weak var Timerlbl: UILabel!
        @IBOutlet weak var btnSubmit: CustomizableButton!
        @IBOutlet weak var OTPFourText: CustomizableTextfield!
        @IBOutlet weak var OTPThreeText: CustomizableTextfield!
        @IBOutlet weak var OTPTwoText: CustomizableTextfield!
        @IBOutlet weak var OTPOneText: CustomizableTextfield!
        @IBOutlet weak var mobilenumberlbl: UILabel!
    var StrOTPNumber = NSNumber()
    var  StrUserMobilNumber = String()
    var StrUserMobil = ""
     var StrSingupOTPNumber = NSNumber()
    var StrSingupPhoneNumber = String()
    
    var strMatchOTP = 0
    


        
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

    var userOwner = String()

    var userbook_store_name = String()

    var useraddress = String()
    var userlandmark = String()
    var usercountry = String()

    var userstate = String()

    var usercity = String()
    var userbusiness_mobile = String()

    var userbusiness_email = String()

    var useragreement_sign = String()

    var userbook_language = String()

    var usercreated_date = String()

    
    var userIdArray = [String]()
    var userNameArray = [String]()

    var userEmailArray = [String]()

    var userPasswordArray = [String]()

    var userProfilepicArray = [String]()

    var userOwnerArray = [String]()

    var userbookstorenameArray = [String]()

    var useraddressArray = [String]()
    var userlandmarkArray = [String]()
    var usercountryArray = [String]()

    var userstateArray = [String]()

    var usercityArray = [String]()
    var userbusiness_mobileArray = [String]()

    var userbusiness_emailArray = [String]()

    var useragreement_signArray = [String]()

    var userbook_languageArray = [String]()

    var usercreated_dateArray = [String]()





        override func viewDidLoad() {
            super.viewDidLoad()
            
            let defaults = UserDefaults.standard
            
            mobilenumberlbl.text = StrSingupPhoneNumber
            
            strMatchOTP = Int(StrSingupOTPNumber)


                counter = 30
                        Timerlbl.text = "00:\(counter)"

                        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EBookOTPVerificatsionVC.updateCounter), userInfo: nil, repeats: true)
                        
                        OTPOneText.isUserInteractionEnabled = false
                        OTPTwoText.isUserInteractionEnabled = false
                        OTPThreeText.isUserInteractionEnabled = false
                        OTPFourText.isUserInteractionEnabled = false
            
            
            
            strThirddigit = (Int(strMatchOTP) % 10000)/1000
            OTPOneText.placeholder = String(strThirddigit)

            
            strfourdigit = (Int(strMatchOTP) % 1000)/100
            OTPTwoText.placeholder = String(strfourdigit)

            
            strfivedigit = (Int(strMatchOTP) % 100)/10
            OTPThreeText.placeholder = String(strfivedigit)

            
            strSixdigit = Int(strMatchOTP) % 10
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
                  //getMatchOTP()
            
    }
    
            func getMatchOTP(){
                
                let parametersBal: Parameters=[
                    "phone":self.StrSingupPhoneNumber,
                    "otp":self.strMatchOTP

                    
                ]
                
                print(parametersBal)
                
                                Alamofire.request("http://zaarmall.com/development/store_match_otp", method: .post, parameters: parametersBal).responseJSON
                                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                            var otpdata = (result as AnyObject).value(forKey: "data") as! NSArray

                                            
                                            


                                            
                                            if (status == 200 as CFBoolean )
                                            {
                                                
                                                for user in otpdata
                                                {
                                                    self.userId = (user as AnyObject).value(forKey: "id") as! String

                                                    print(self.userId)
                                                    
                                                    UserDefaults.standard.set(self.userId, forKey: "id")
                                                    UserDefaults.standard.synchronize()

                                                    
                                                    self.userName = (user as AnyObject).value(forKey: "name") as! String

                                                    print(self.userName)
                                                    
                                                    UserDefaults.standard.set(self.userName, forKey: "name")
                                                    UserDefaults.standard.synchronize()


                                                    self.userEmail = (user as AnyObject).value(forKey: "email") as! String

                                                    print(self.userEmail)
                                                    
                                                    UserDefaults.standard.set(self.userEmail, forKey: "email")
                                                    UserDefaults.standard.synchronize()


                                                    self.userPassword = (user as AnyObject).value(forKey: "password") as! String

                                                    print(self.userPassword)
                                                    
                                                    UserDefaults.standard.set(self.userPassword, forKey: "password")
                                                    UserDefaults.standard.synchronize()


                                                   // self.userProfile_pic = (user as AnyObject).value(forKey: "profile_pic") as! String

                                                    print(self.userProfile_pic)
                                                    
                                                    UserDefaults.standard.set(self.userProfile_pic, forKey: "profile_pic")
                                                    UserDefaults.standard.synchronize()


                                                    self.userOwner = (user as AnyObject).value(forKey: "owner") as! String

                                                    print(self.userOwner)
                                                    
                                                    UserDefaults.standard.set(self.userOwner, forKey: "owner")
                                                    UserDefaults.standard.synchronize()


                                                    self.userbook_store_name = (user as AnyObject).value(forKey: "store_name") as! String

                                                    print(self.userbook_store_name)
                                                    
                                                    UserDefaults.standard.set(self.userbook_store_name, forKey: "store_name")
                                                    UserDefaults.standard.synchronize()


                                                    self.useraddress = (user as AnyObject).value(forKey: "address") as! String

                                                    print(self.useraddress)
                                                    
                                                    UserDefaults.standard.set(self.useraddress, forKey: "address")
                                                    UserDefaults.standard.synchronize()


                                                    self.userlandmark = (user as AnyObject).value(forKey: "landmark") as! String

                                                    print(self.userlandmark)
                                                    
                                                    UserDefaults.standard.set(self.userlandmark, forKey: "landmark")
                                                    UserDefaults.standard.synchronize()


                                                    self.usercountry = (user as AnyObject).value(forKey: "country") as! String

                                                    print(self.usercountry)
                                                    
                                                    UserDefaults.standard.set(self.usercountry, forKey: "country")
                                                    UserDefaults.standard.synchronize()


                                                    self.userstate = (user as AnyObject).value(forKey: "state") as! String

                                                    print(self.userstate)
                                                    
                                                    UserDefaults.standard.set(self.userstate, forKey: "state")
                                                    UserDefaults.standard.synchronize()


                                                    self.usercity = (user as AnyObject).value(forKey: "city") as! String

                                                    print(self.usercity)
                                                    
                                                    UserDefaults.standard.set(self.usercity, forKey: "city")
                                                    UserDefaults.standard.synchronize()


                                                    self.userbusiness_mobile = (user as AnyObject).value(forKey: "business_mobile") as! String

                                                    print(self.userbusiness_mobile)
                                                    
                                                    UserDefaults.standard.set(self.userbusiness_mobile, forKey: "business_mobile")
                                                    UserDefaults.standard.synchronize()


                                                    self.userbusiness_email = (user as AnyObject).value(forKey: "business_email") as! String

                                                    print(self.userbusiness_email)
                                                    
                                                    UserDefaults.standard.set(self.userbusiness_email, forKey: "business_email")
                                                    UserDefaults.standard.synchronize()


                                                    self.useragreement_sign = (user as AnyObject).value(forKey: "agreement_sign") as! String

                                                    print(self.useragreement_sign)
                                                    
                                                    UserDefaults.standard.set(self.useragreement_sign, forKey: "agreement_sign")
                                                    UserDefaults.standard.synchronize()


                                                    self.userbook_language = (user as AnyObject).value(forKey: "licence_no") as! String

                                                    print(self.userbook_language)
                                                    
                                                    UserDefaults.standard.set(self.userbook_language, forKey: "licence_no")
                                                    UserDefaults.standard.synchronize()


                                                    self.usercreated_date = (user as AnyObject).value(forKey: "created_date") as! String

                                                    print(self.usercreated_date)
                                                    
                                                    UserDefaults.standard.set(self.usercreated_date, forKey: "created_date")
                                                    UserDefaults.standard.synchronize()



                                                    
                                                    
                                                }

                                           let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                                           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreMemberShipeVc") as! BookStoreMemberShipeVc
                                           self.present(nextViewController, animated:true, completion:nil)



                                            }
                                            
                                            else{
                                                
                                            }
                                        }
                }

                
            }


    }
