
import UIKit
import Alamofire

class BookStoreSingupVc: UIViewController,UITableViewDelegate,UITableViewDataSource,UIDocumentPickerDelegate,UITextFieldDelegate {

    
    @IBOutlet weak var btnOwner1: UIButton!
    @IBOutlet weak var uploadLicenseText: UITextField!
    @IBOutlet weak var firstPopup: CustomizableView!
    @IBOutlet weak var mainPopUP: CustomizableView!
    @IBOutlet weak var lanuageTableView: UITableView!
    @IBOutlet weak var languagepopup: CustomizableView!
    @IBOutlet weak var stateTableView: UITableView!
    @IBOutlet weak var statepopup: CustomizableView!
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var cityPopup: CustomizableView!
    @IBOutlet weak var CountryTableView: UITableView!
    @IBOutlet weak var countryPopup: CustomizableView!
    @IBOutlet weak var landmarkText: UITextField!
    @IBOutlet weak var OwnerTableView: UITableView!
    @IBOutlet weak var Owmerpopup: CustomizableView!
    @IBOutlet weak var btnLanuageOfBook: UIButton!
    @IBOutlet weak var languagesofbooksText: UITextField!
    @IBOutlet weak var businessEmailText: UITextField!
    @IBOutlet weak var businessContactNumberText: UITextField!
    @IBOutlet weak var btnState: UIButton!
    @IBOutlet weak var StateText: UITextField!
    @IBOutlet weak var btnCityDropDown: UIButton!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var conntryText: UITextField!
    @IBOutlet weak var addtressText: UITextField!
    @IBOutlet weak var bookStoreNmaeText: UITextField!
    @IBOutlet weak var owmerText: UITextField!
    @IBOutlet weak var btnsingup: CustomizableButton!
        @IBOutlet weak var emailText: UITextField!
        @IBOutlet weak var mobileNumberText: UITextField!
        @IBOutlet weak var yourNameText: UITextField!
        @IBOutlet weak var ConfromPasswordText: UITextField!
        @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var btnOwner: UIButton!
    @IBOutlet weak var btnCountry: UIButton!
    @IBOutlet weak var btnHidePassword: UIButton!
    @IBOutlet weak var btnHideConfromPassword: UIButton!
    
        var OwnerArray = ["Rahul","Sumit"]
//        var countryArray = ["India","Amrica"]
//        var cityArray = ["Indore","Bhopal"]
//        var stateArray = ["M.P","U.P"]
       var laguageArray = ["English","Arabic"]


    var selectedRows:[IndexPath] = []


    var strLanuageName = String()
    
    
    var UserFullName = String()
    var UserEmail = String()
    var UserPassword = String()
    var UserConfromPassword = String()
    var UserOwner = String()

    var UserBookStoreName = String()

    var UserAddress = String()

    var UserLandMark = String()

    var UserCountry = String()

    var UserCity = String()

    var UserState = String()

    var User = String()

    var UserBusinessContactNumber = String()

    var UserBusinessEmailAddress = String()
    var UserLanuange = String()

    var contryId = String()
    var contrysortname = String()

    var contryname = String()

    var contrycurrency_code = String()

    var contrycurrency_name = String()

    var contryphone_code = String()

    var contrycapital = String()

    var contryflag = String()

    var contryunit = String()

    var contryemergencyNumber = String()
    var contrytax = String()
    var contrystatus = String()

   var countryNamearray = [String]()
    var countryIdArray = [String]()
    var strCountryId = String()

    var stateId = String()
    var statename = String()

    var statestate_code = String()

    var statecountry_id = String()

    var statestatus = String()
    var stateNameArray = [String]()
    var stateIdArray = [String]()
    var strStateId = String()




    
    var cityId = String()
    var cityname = String()

    var citystate_id = String()

    var citycountry_id = String()

    var citystatus = String()
    var cityNameArray = [String]()
    
    var strOwner = String()
    var getStrOTP = NSNumber()



    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        OwnerTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        CountryTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        cityTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        stateTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        lanuageTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        owmerText.delegate = self
        
        OwnerTableView.delegate = self
        OwnerTableView.dataSource = self

        CountryTableView.delegate = self
        CountryTableView.dataSource = self
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        stateTableView.delegate = self
        stateTableView.dataSource = self





              mainPopUP.addSubview(Owmerpopup)
        

              mainPopUP.addSubview(countryPopup)
        

              mainPopUP.addSubview(cityPopup)
        

              mainPopUP.addSubview(statepopup)
        




        }
    

    @IBAction func btnUploadLicense(_ sender: Any) {
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        Owmerpopup.isHidden = true
        btnOwner.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

    }

    
    @IBAction func btnHideConfromPassword(_ sender: Any) {
        ConfromPasswordText.isSecureTextEntry = false
    }
    
    @IBAction func btnHidePassword(_ sender: Any) {
        passwordText.isSecureTextEntry = false

    }
    
    @IBAction func btnCountry(_ sender: Any) {
        if(countryPopup.isHidden == true){
            countryPopup.isHidden = false
            getCountry()
            btnCountry.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            countryPopup.isHidden = true
            btnCountry.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }

    }
    @IBAction func btnOwner(_ sender: Any) {
        if(Owmerpopup.isHidden == true){
            Owmerpopup.isHidden = false
            //animate(toogle: true, type: btnOwner)

            btnOwner.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            Owmerpopup.isHidden = true
            //animate(toogle: false, type: btnOwner)

            btnOwner.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }

    }
    @IBAction func btnLanuageOfBook(_ sender: Any) {
        if(languagepopup.isHidden == true){
            languagepopup.isHidden = false
            btnLanuageOfBook.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            languagepopup.isHidden = true
            btnLanuageOfBook.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
    }
    @IBAction func btnState(_ sender: Any) {
        if(statepopup.isHidden == true){
            statepopup.isHidden = false
            getCity()
            btnState.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            statepopup.isHidden = true
            btnState.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }

    }
    @IBAction func btnCityDropDown(_ sender: Any) {
        if(cityPopup.isHidden == true){
            cityPopup.isHidden = false
            getState()
            btnCityDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            cityPopup.isHidden = true
            btnCityDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }

    }
    
        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
            self.present(nextViewController, animated:true, completion:nil)
        }
        
        
        @IBAction func btnSingup(_ sender: Any) {
            getSingup()
            

        }
    
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == btnOwner {
        
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.Owmerpopup.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.Owmerpopup.isHidden = true
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

    
//        func isValidPassword(testStr:String?) -> Bool {
//            guard testStr != nil else { return false }
//
//            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*?[-!@#$%&*ˆ+=_]).{8,}")
//            return passwordTest.evaluate(with: testStr)
//        }
//
        
        func isValidEmail(testStr:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }

    
    
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("The textField ended editing. Do something based on app requirements.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {

              let cico = url as URL
              print(cico)
              print(url)

              print(url.lastPathComponent)

              print(url.pathExtension)

             }
    
    
    func getCity(){
                        let parametersBal: Parameters=[
                            "state_id":self.strStateId
                            ]
                        
                        print(parametersBal)
                        
                        
                        
                        Alamofire.request("http://zaarmall.com/development/get_city", method: .post, parameters: parametersBal).responseJSON
                            {
                                                response in
                                                
                                                print(response)
                                                
                                                //getting the json value from the server
                                                if let result = response.result.value {
                                                    
                                                    
                                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                  //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                                    var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                    


                                                    
                                                    if (status == 200 as CFBoolean )
                                                    {

                                                        print("hiiii")
                                                          for user in data
                                                          {
                                                            
                                                            self.cityId = (user as AnyObject).value(forKey: "id") as! String
                                                            
                                                            UserDefaults.standard.set(self.cityId, forKey: "id")
                                                            UserDefaults.standard.synchronize()
                                                            
                                                            self.cityname = (user as AnyObject).value(forKey: "name") as! String
                                                            self.cityNameArray.append(self.cityname)

                                                            
                                                            UserDefaults.standard.set(self.cityname, forKey: "name")
                                                            UserDefaults.standard.synchronize()


                                                            

                                                            self.citystate_id = (user as AnyObject).value(forKey: "state_id") as! String
                                                            print(self.citystate_id)
                                                            

                                                            
                                                            UserDefaults.standard.set(self.citystate_id, forKey: "state_id")
                                                            UserDefaults.standard.synchronize()

                                                            


                                                            self.citycountry_id = (user as AnyObject).value(forKey: "country_id") as! String
                                                            print(self.citycountry_id)
                                                            
                                                            UserDefaults.standard.set(self.citycountry_id, forKey: "country_id")
                                                            UserDefaults.standard.synchronize()


                                                            self.citystatus = (user as AnyObject).value(forKey: "status") as! String
                                                            
                                                            UserDefaults.standard.set(self.citystatus, forKey: "status")
                                                            UserDefaults.standard.synchronize()








                                                            
                                                          }
                                                        
                                                       DispatchQueue.main.async {
                                                           self.stateTableView.reloadData()
                                                       }

                                                        


                                                    }
                                                    else{
                                                        
                                                    }

                                                }


                        }
                        


        
    }
    

    
    
    
    func getState(){
                        let parametersBal: Parameters=[
                            "country_id":self.strCountryId
                            ]
                        
                        print(parametersBal)
                        
                        
                        
                        Alamofire.request("http://zaarmall.com/development/get_state", method: .post, parameters: parametersBal).responseJSON
                            {
                                                response in
                                                
                                                print(response)
                                                
                                                //getting the json value from the server
                                                if let result = response.result.value {
                                                    
                                                    
                                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                  //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                                    var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                    


                                                    
                                                    if (status == 200 as CFBoolean )
                                                    {

                                                        print("hiiii")
                                                          for user in data
                                                          {
                                                            
                                                            self.stateId = (user as AnyObject).value(forKey: "id") as! String
                                                            self.stateIdArray.append(                      self.stateId)
                                                            
                                                            UserDefaults.standard.set(self.stateId, forKey: "id")
                                                            UserDefaults.standard.synchronize()
                                                            
                                                            self.statename = (user as AnyObject).value(forKey: "name") as! String
                                                            self.stateNameArray.append(self.statename)

                                                            
                                                            UserDefaults.standard.set(self.statename, forKey: "name")
                                                            UserDefaults.standard.synchronize()


                                                            

                                                            self.statestate_code = (user as AnyObject).value(forKey: "state_code") as! String
                                                            print(self.statestate_code)
                                                            

                                                            
                                                            UserDefaults.standard.set(self.statestate_code, forKey: "state_code")
                                                            UserDefaults.standard.synchronize()

                                                            


                                                            self.statecountry_id = (user as AnyObject).value(forKey: "country_id") as! String
                                                            print(self.statecountry_id)
                                                            
                                                            UserDefaults.standard.set(self.statecountry_id, forKey: "country_id")
                                                            UserDefaults.standard.synchronize()


                                                            self.statestatus = (user as AnyObject).value(forKey: "status") as! String
                                                            
                                                            UserDefaults.standard.set(self.statestatus, forKey: "status")
                                                            UserDefaults.standard.synchronize()








                                                            
                                                          }
                                                        
                                                       DispatchQueue.main.async {
                                                           self.cityTableView.reloadData()
                                                       }

                                                        


                                                    }
                                                    else{
                                                        
                                                    }

                                                }


                        }
                        


        
    }
    
    func getCountry(){
        
        Alamofire.request("http://zaarmall.com/development/get_country", method: .get).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                  //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                    var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                    


                                    
                                    if (status == 200 as CFBoolean )
                                    {

                                        
                                          for user in data
                                          {
                                            self.contryId = (user as AnyObject).value(forKey: "id") as! String
                                            self.countryIdArray.append(self.contryId)
                                            UserDefaults.standard.set(self.contryId, forKey: "id")
                                            UserDefaults.standard.synchronize()
                                            
                                            
                                            self.contrysortname = (user as AnyObject).value(forKey: "sortname") as! String
                                            
                                            UserDefaults.standard.set(self.contrysortname, forKey: "sortname")
                                            UserDefaults.standard.synchronize()
                                            
                                            
                                            self.contryname = (user as AnyObject).value(forKey: "name") as! String
                                            
                                            self.countryNamearray.append(self.contryname)
                                            UserDefaults.standard.set(self.contryname, forKey: "name")
                                            UserDefaults.standard.synchronize()





                                            

                                            self.contrycurrency_code = (user as AnyObject).value(forKey: "currency_code") as! String
                                            

                                            
                                            UserDefaults.standard.set(self.contrycurrency_code, forKey: "currency_code")
                                            UserDefaults.standard.synchronize()

                                            
                                            self.contrycurrency_name = (user as AnyObject).value(forKey: "currency_name") as! String
                                            print(self.contrycurrency_name)
                                            
                                            UserDefaults.standard.set(self.contrycurrency_name, forKey: "currency_name")
                                            UserDefaults.standard.synchronize()


                                            self.contryphone_code = (user as AnyObject).value(forKey: "phone_code") as! String
                                            
                                            UserDefaults.standard.set(self.contryphone_code, forKey: "phone_code")
                                            UserDefaults.standard.synchronize()


                                            self.contrycapital = (user as AnyObject).value(forKey: "capital") as! String
                                            
                                            UserDefaults.standard.set(self.contrycapital, forKey: "capital")
                                            UserDefaults.standard.synchronize()


                                            self.contryflag = (user as AnyObject).value(forKey: "flag") as! String
                                            
                                            UserDefaults.standard.set(self.contryflag, forKey: "flag")
                                            UserDefaults.standard.synchronize()

                                            
                                            self.contryunit = (user as AnyObject).value(forKey: "unit") as! String
                                            
                                            UserDefaults.standard.set(self.contryunit, forKey: "unit")
                                            UserDefaults.standard.synchronize()


                                            self.contryemergencyNumber = (user as AnyObject).value(forKey: "emergencyNumber") as! String
                                            
                                            UserDefaults.standard.set(self.contryemergencyNumber, forKey: "emergencyNumber")
                                            UserDefaults.standard.synchronize()


                                            self.contrytax = (user as AnyObject).value(forKey: "tax") as! String
                                            
                                            UserDefaults.standard.set(self.contrytax, forKey: "tax")
                                            UserDefaults.standard.synchronize()


                                            self.contrystatus = (user as AnyObject).value(forKey: "status") as! String
                                            
                                            UserDefaults.standard.set(self.contrystatus, forKey: "status")
                                            UserDefaults.standard.synchronize()



                                            
                                          }
                                        
                                       DispatchQueue.main.async {
                                           self.CountryTableView.reloadData()
                                       }

                                        


                                    }
                                    else{
                                        
                                    }

                                }


        }

        
    }

    
    
    func getSingup(){
        
        
        UserFullName = yourNameText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserEmail = emailText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserPassword = passwordText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        UserConfromPassword = ConfromPasswordText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        UserOwner = owmerText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserBookStoreName = bookStoreNmaeText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserAddress = addtressText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserLandMark = landmarkText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserCountry = conntryText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserCity = cityText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserState = StateText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserBusinessContactNumber = businessContactNumberText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserBusinessEmailAddress = businessEmailText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        UserLanuange = uploadLicenseText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)


     if((UserFullName.isEmpty)
         || (UserEmail.isEmpty) || (UserPassword.isEmpty) || (UserConfromPassword.isEmpty) || (UserOwner.isEmpty) || (UserBookStoreName.isEmpty) || (UserAddress.isEmpty) || (UserLandMark.isEmpty) || (UserCountry.isEmpty) || (UserCity.isEmpty) || (UserState.isEmpty) || (UserBusinessContactNumber.isEmpty) || (UserBusinessEmailAddress.isEmpty) || (UserLanuange.isEmpty))
         {
            
             if (UserFullName.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter FullName")

            }
            else if (UserEmail.isEmpty) {
                displayMyAlertMessage(userMessage: "Please Enter Email")

            }
            else if (UserPassword.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter Password")

            }

            else if (UserConfromPassword.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter ConfromPassword")

            }
            
            else if (UserOwner.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter Owner Name")

            }

            
            else if (UserBookStoreName.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter BookStoreName")

            }

            else if (UserAddress.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter Address")

            }

            else if (UserLandMark.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter LandMark")

            }

            else if (UserCountry.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter CountryName")

            }

            else if (UserCity.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter CityName")

            }

            else if (UserState.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter StateName")

            }

            else if (UserBusinessContactNumber.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter BusinessContactNumber")

            }

            else if (UserBusinessEmailAddress.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter BusinessEmailAddress")

            }

            else if (UserLanuange.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Enter License Number")

            }




         }

        
     else{
        
        if isValidEmail(testStr: UserBusinessEmailAddress){
            if isValidPhone(phone: UserBusinessContactNumber){
             if isValidEmail(testStr: UserEmail){
                if (UserPassword == UserConfromPassword){



        
                        let parametersBal: Parameters=[
                            "name":self.UserFullName,
                            "email":self.UserEmail,
                            "password":self.UserPassword,
                            "owner":self.UserOwner,
                            "store_name":self.UserBookStoreName,
                            "address":self.UserAddress,
                            "landmark":self.UserLandMark,
                            "country":self.UserCountry,
                            "state":self.UserState,
                            "city":self.UserCity,
                            "business_mobile":self.UserBusinessContactNumber,
                            "business_email":self.UserBusinessEmailAddress,
                            "licence_no":self.UserLanuange,

                            
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        
                        
                        Alamofire.request("http://zaarmall.com/development/store_signup", method: .post, parameters: parametersBal).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                     var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                    var data = (result as AnyObject).value(forKey: "data") as! NSDictionary

//                                    UserDefaults.standard.set(self.otpdata, forKey: "data")
//                                    UserDefaults.standard.synchronize()


                                    
                                    if (status == 200 as CFBoolean)
                                    {

                                        

                                      self.getStrOTP = (data as AnyObject).value(forKey: "otp") as! NSNumber

                                        



                                        LoginHelperFunctions.notifyUser("Alert", message: "Registration Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreOTPVerificationVc") as! BookStoreOTPVerificationVc
                                            nextViewController.StrSingupOTPNumber = self.getStrOTP
                                            nextViewController.StrSingupPhoneNumber = self.UserBusinessContactNumber

                                            
                                               // StrSingupPhoneNumber

                           self.present(nextViewController, animated:true, completion:nil)



                                        })
                                        


                                    }
                                    else if(status == 1 as CFBoolean){
                                        print("Already Exit")
                                        self.displayMyAlertMessage(userMessage: " BusinessContactNumber Already Exit")

                                    }
                                    else{
                                        
                                    }

                                }
                                
                    }
                    
                }
                    else{
                        displayMyAlertMessage(userMessage: "Password and ConfromPassword not Match")

                    }

                    
                }
                else{
                    displayMyAlertMessage(userMessage: "Please Enter Valid Email")

                }

            }
            else{
                displayMyAlertMessage(userMessage: "Please Enter Valid BusinessContactNumber")

            }

            
        }
        else{
            displayMyAlertMessage(userMessage: "Please Enter Valid BusinessEmailAddress")

        }
        }

        
        
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         var count:Int?
         if tableView == OwnerTableView{

             count = self.OwnerArray.count
         }
         else if tableView == CountryTableView{
             count = self.countryNamearray.count

         }
            else if tableView == cityTableView{
                count = self.stateNameArray.count

            }

            else if tableView == stateTableView{
                count = self.cityNameArray.count

            }

            else if tableView == lanuageTableView{
                count = self.laguageArray.count

            }

         else{
             count = 5

         }
         
         return count!

     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
           var cellToReturn = UITableViewCell()
         if tableView == self.OwnerTableView {

          let cell = tableView.dequeueReusableCell(withIdentifier: "OwnerTVC", for: indexPath) as!OwnerTVC

         cell.ownerlbl?.text = OwnerArray[indexPath.row]

             cellToReturn = cell
             
         }
         else if tableView == self.CountryTableView{
                   let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTVC", for: indexPath) as!CountryTVC
            let getCountryId = countryIdArray[indexPath.row]
                  cell.Countrylbl?.text = countryNamearray[indexPath.row]

                      cellToReturn = cell

             
         }
        else if tableView == self.cityTableView{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "CityTVC", for: indexPath) as!CityTVC
                 let getStateId = stateIdArray[indexPath.row]

            cell.Citylbl?.text = stateNameArray[indexPath.row]

                     cellToReturn = cell

            
        }//cityArray
        else if tableView == self.stateTableView{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "StateTVC", for: indexPath) as!StateTVC
                 cell.statelbl?.text = cityNameArray[indexPath.row]

                     cellToReturn = cell

            
        }
        else if tableView == self.lanuageTableView{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "LanuageTVC", for: indexPath) as!LanuageTVC
                                 cell.languagelbl.text = laguageArray[indexPath.row]
                                 strLanuageName = cell.languagelbl.text!
                                 
                                 
                                 if selectedRows.contains(indexPath)
                                 {
                                               cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)
                                     languagesofbooksText.text = strLanuageName
                                    btnLanuageOfBook.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

                                     languagepopup.isHidden = true

                                 }
                                 else
                                 {
                                               cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)
                                    btnLanuageOfBook.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

                                 }
                                 cell.btnLaguageSlect.tag = indexPath.row
                                 cell.btnLaguageSlect.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)


                     cellToReturn = cell

            
        }



         return cellToReturn
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            if tableView == self.OwnerTableView{
                 let   selectedData = OwnerArray[indexPath.row]
                owmerText.text = selectedData
                btnOwner.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

                Owmerpopup.isHidden = true

                 OwnerTableView.reloadData()

            }
           else  if tableView == self.CountryTableView{
                
                            self.strCountryId = countryIdArray[indexPath.row]
                              let   selectedData = countryNamearray[indexPath.row]
                             conntryText.text = selectedData

                             countryPopup.isHidden = true
                btnCountry.transform = CGAffineTransform(rotationAngle: 2*CGFloat.pi)


                              CountryTableView.reloadData()

            }
            else if tableView == self.cityTableView{
                self.strStateId = stateIdArray[indexPath.row]
                 let   selectedData = stateNameArray[indexPath.row]
                cityText.text = selectedData

                cityPopup.isHidden = true
                btnCityDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


                 cityTableView.reloadData()

            }
            else{
                 let   selectedData = cityNameArray[indexPath.row]
                StateText.text = selectedData
                statepopup.isHidden = true
                btnState.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


                 stateTableView.reloadData()

            }
  
        
    }
    
    @objc func checkBoxSelection(_ sender:UIButton)
    {
      let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
      if self.selectedRows.contains(selectedIndexPath)
      {
        self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
      }
      else
      {
        self.selectedRows.append(selectedIndexPath)
      }
      self.lanuageTableView.reloadData()
    }

    
    }
