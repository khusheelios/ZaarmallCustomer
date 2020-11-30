//
//  BookStoreUpdateProfileVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class BookStoreUpdateProfileVc: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {


    @IBOutlet weak var bookStoreEmailText: UITextField!
    @IBOutlet weak var bookStoreNameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var businessContactNumberText: UITextField!

@IBOutlet weak var NameText: UITextField!
@IBOutlet weak var profileImage: UIImageView!
@IBOutlet weak var btnProfile: CustomizableButton!
    
    
    @IBOutlet weak var NamePopup: CustomizableView!
    @IBOutlet weak var Emailpopup: CustomizableView!
    @IBOutlet weak var businessContactpopup: CustomizableView!
    @IBOutlet weak var bookStoreNamePopup: CustomizableView!
    @IBOutlet weak var buniessEmailPopup: CustomizableView!
    
    @IBOutlet weak var editBusniessEmailText: UITextField!
    @IBOutlet weak var editBookStoreName: UITextField!
    @IBOutlet weak var editContactText: UITextField!
    @IBOutlet weak var editEmailText: UITextField!
    @IBOutlet weak var editNameText: UITextField!



override func viewDidLoad() {
    super.viewDidLoad()
    
    //NamePopup.isHidden = false
    NameText.addTarget(self, action: #selector(UpdateName(_:)),for: .editingDidBegin)

    EmailText.addTarget(self, action: #selector(UpdateEmail(_:)),for: .editingDidBegin)
    businessContactNumberText.addTarget(self, action: #selector(UpdateContactNumber(_:)),for: .editingDidBegin)

    bookStoreNameText.addTarget(self, action: #selector(UpdatBookStoreName(_:)),for: .editingDidBegin)

    bookStoreEmailText.addTarget(self, action: #selector(UpdateBookStoreEmail(_:)),for: .editingDidBegin)



    // Do any additional setup after loading the view.
}
    @objc func UpdateContactNumber(_ textField: UITextField) {
    
        businessContactpopup.isHidden = false
        NamePopup.isHidden = true
        Emailpopup.isHidden = true
        bookStoreNamePopup.isHidden = true
        buniessEmailPopup.isHidden = true


        }

    
    @objc func UpdatBookStoreName(_ textField: UITextField) {
    
        
        businessContactpopup.isHidden = true
        NamePopup.isHidden = true
        Emailpopup.isHidden = true
        bookStoreNamePopup.isHidden = false
        buniessEmailPopup.isHidden = true
        
        //bookStoreNameText.isUserInteractionEnabled = false
        bookStoreNameText.placeholder = editBookStoreName.text
         bookStoreNameText.textAlignment = .right




        }

    
    @objc func UpdateBookStoreEmail(_ textField: UITextField) {
    
        
        businessContactpopup.isHidden = true
        NamePopup.isHidden = true
        Emailpopup.isHidden = true
        bookStoreNamePopup.isHidden = true
        buniessEmailPopup.isHidden = false
        
       // bookStoreEmailText.isUserInteractionEnabled = false
        bookStoreEmailText.placeholder = editBusniessEmailText.text
         bookStoreEmailText.textAlignment = .right




        }

    
    @objc func UpdateName(_ textField: UITextField) {
    
        
        businessContactpopup.isHidden = true
        NamePopup.isHidden = false
        Emailpopup.isHidden = true
        bookStoreNamePopup.isHidden = true
        buniessEmailPopup.isHidden = true
        //NameText.isUserInteractionEnabled = false
        NameText.placeholder = editNameText.text
        NameText.textAlignment = .right



        }

    
    @objc func UpdateEmail(_ textField: UITextField) {
    
        
        businessContactpopup.isHidden = true
        NamePopup.isHidden = true
        Emailpopup.isHidden = false
        bookStoreNamePopup.isHidden = true
        buniessEmailPopup.isHidden = true
        
        //EmailText.isUserInteractionEnabled = false
        EmailText.placeholder = editEmailText.text
        EmailText.textAlignment = .right




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
    @IBAction func btnUpdate(_ sender: Any) {
        getUpdateProfile()
        

    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)


        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
         return
        }

             profileImage.image = selectedImage

        
               self.dismiss(animated: true, completion: nil)

    }
    
    func getUpdateProfile(){
        
                        let parametersBal: Parameters=[
                            "user_id":"1",
                            "name":editNameText.text!,
                            "profile_pic":"",
                            "email":editEmailText.text!,
                            "book_store_name":editBookStoreName.text!,
                            "business_email":editBusniessEmailText.text!
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        
                        
                        Alamofire.request("http://laxmi1963.com/ZaarMall/update_bookStore_profile", method: .post, parameters: parametersBal).responseJSON
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

                                        
                                        LoginHelperFunctions.notifyUser("Alert", message: "Update Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                                        print(self.editBusniessEmailText.text)


                                        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreMyprofileVc") as! BookStoreMyprofileVc
                                        nextViewController.strEditName = self.editNameText.text!
                                        nextViewController.strEditEmail = self.editEmailText.text!

                                        nextViewController.strEditBookStoreName = self.editBookStoreName.text!

                                        nextViewController.strEditBookStoreEmail = self.editBusniessEmailText.text!
                                        

                                        
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

    
}
