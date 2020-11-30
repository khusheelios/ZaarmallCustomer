//
//  BookStoreMyprofileVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class BookStoreMyprofileVc: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var bookStoreEmailText: UITextField!
    @IBOutlet weak var bookStoreNameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
@IBOutlet weak var businessContactNumberText: UITextField!

@IBOutlet weak var NameText: UITextField!
@IBOutlet weak var profileImage: UIImageView!
@IBOutlet weak var btnProfile: CustomizableButton!

    @IBOutlet weak var btnUpdateProfile: CustomizableButton!
    
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
    
    var strEditName = String()
    var strEditEmail = String()
    var strEditBookStoreName = String()
    var strEditBookStoreEmail = String()



    
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    let defaults = UserDefaults.standard

    NameText.text = strEditName
    EmailText.text = strEditEmail

    bookStoreNameText.text = strEditBookStoreName

    bookStoreEmailText.text = strEditBookStoreEmail

    
    getProfile()

}
    @IBAction func btnMyOrder(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreOrderVc") as! BookStoreOrderVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnChagePassword(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreChagePasswordVc") as! BookStoreChagePasswordVc
        self.present(nextViewController, animated:true, completion:nil)

    }

    @IBAction func btnProfile(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            
        }


    }
    
    

    @IBAction func btnEdit(_ sender: Any) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreUpdateProfileVc") as! BookStoreUpdateProfileVc
        self.present(nextViewController, animated:true, completion:nil)



        

    }
    
    

    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
        self.present(nextViewController, animated:true, completion:nil)


        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
         return
        }

             profileImage.image = selectedImage

        
               self.dismiss(animated: true, completion: nil)

    }
    func getProfile(){
        
                        let parametersBal: Parameters=[
                            "user_id":"1"
                            
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        
                        
                        Alamofire.request("http://laxmi1963.com/ZaarMall/get_bookStore_profile", method: .post, parameters: parametersBal).responseJSON
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

                                        
                                        self.userId = (data as AnyObject).value(forKey: "id") as! String

                                        print(self.userId)
                                        
                                        UserDefaults.standard.set(self.userId, forKey: "id")
                                        UserDefaults.standard.synchronize()

                                        
                                        self.userName = (data as AnyObject).value(forKey: "name") as! String

                                        print(self.userName)
                                        
                                        
                                        UserDefaults.standard.set(self.userName, forKey: "name")
                                        UserDefaults.standard.synchronize()

                                          self.NameText.text = self.userName

                                        self.userEmail = (data as AnyObject).value(forKey: "email") as! String
                                        self.EmailText.text = self.userEmail

                                        print(self.userEmail)
                                        UserDefaults.standard.set(self.userEmail, forKey: "email")
                                        UserDefaults.standard.synchronize()

                                        self.userPassword = (data as AnyObject).value(forKey: "password") as! String

                                        print(self.userPassword)
                                        
                                        UserDefaults.standard.set(self.userPassword, forKey: "password")
                                        UserDefaults.standard.synchronize()


                                        self.userProfile_pic = (data as AnyObject).value(forKey: "profile_pic") as! String

                                        print(self.userProfile_pic)
                                        
                                        UserDefaults.standard.set(self.userProfile_pic, forKey: "profile_pic")
                                        UserDefaults.standard.synchronize()


                                        self.userOwner = (data as AnyObject).value(forKey: "owner") as! String

                                        print(self.userOwner)
                                        
                                        UserDefaults.standard.set(self.userOwner, forKey: "owner")
                                        UserDefaults.standard.synchronize()


                                        self.userbook_store_name = (data as AnyObject).value(forKey: "book_store_name") as! String

                                        print(self.userbook_store_name)
                                        self.bookStoreNameText.text = self.userbook_store_name
                                        
                                        UserDefaults.standard.set(self.userbook_store_name, forKey: "book_store_name")
                                        UserDefaults.standard.synchronize()


                                        self.useraddress = (data as AnyObject).value(forKey: "address") as! String

                                        print(self.useraddress)
                                        
                                        UserDefaults.standard.set(self.useraddress, forKey: "address")
                                        UserDefaults.standard.synchronize()


                                        self.userlandmark = (data as AnyObject).value(forKey: "landmark") as! String

                                        print(self.userlandmark)
                                        
                                        UserDefaults.standard.set(self.userlandmark, forKey: "landmark")
                                        UserDefaults.standard.synchronize()


                                        self.usercountry = (data as AnyObject).value(forKey: "country") as! String

                                        print(self.usercountry)
                                        
                                        UserDefaults.standard.set(self.usercountry, forKey: "country")
                                        UserDefaults.standard.synchronize()


                                        self.userstate = (data as AnyObject).value(forKey: "state") as! String

                                        print(self.userstate)
                                        
                                        UserDefaults.standard.set(self.userstate, forKey: "state")
                                        UserDefaults.standard.synchronize()


                                        self.usercity = (data as AnyObject).value(forKey: "city") as! String

                                        print(self.usercity)
                                        
                                        UserDefaults.standard.set(self.usercity, forKey: "city")
                                        UserDefaults.standard.synchronize()


                                        self.userbusiness_mobile = (data as AnyObject).value(forKey: "business_mobile") as! String

                                        print(self.userbusiness_mobile)
                                        
                                        self.businessContactNumberText.text = self.userbusiness_mobile

                                        
                                        UserDefaults.standard.set(self.userbusiness_mobile, forKey: "business_mobile")
                                        UserDefaults.standard.synchronize()


                                        self.userbusiness_email = (data as AnyObject).value(forKey: "business_email") as! String

                                        print(self.userbusiness_email)
                                        self.bookStoreEmailText.text = self.userbusiness_email

                                        

                                        
                                        UserDefaults.standard.set(self.userbusiness_email, forKey: "business_email")
                                        UserDefaults.standard.synchronize()


                                        self.useragreement_sign = (data as AnyObject).value(forKey: "agreement_sign") as! String

                                        print(self.useragreement_sign)
                                        UserDefaults.standard.set(self.useragreement_sign, forKey: "agreement_sign")
                                        UserDefaults.standard.synchronize()


                                        self.userbook_language = (data as AnyObject).value(forKey: "book_language") as! String

                                        print(self.userbook_language)
                                        
                                        UserDefaults.standard.set(self.userbook_language, forKey: "book_language")
                                        UserDefaults.standard.synchronize()


                                        self.usercreated_date = (data as AnyObject).value(forKey: "created_date") as! String

                                        print(self.usercreated_date)
                                        
                                        UserDefaults.standard.set(self.usercreated_date, forKey: "created_date")
                                        UserDefaults.standard.synchronize()


                                        
                                        



                                        
                                        
                                        


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
