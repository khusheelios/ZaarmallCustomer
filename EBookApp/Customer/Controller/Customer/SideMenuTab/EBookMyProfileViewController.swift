//
//  EBookMyProfileViewController.swift
//  EBookApp
//
//  Created by apple on 04/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import MBProgressHUD

class EBookMyProfileViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var viewMyOrder: UILabel!
    @IBOutlet weak var viewChangePwd: UILabel!
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var mobileText: UITextField!

    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnProfile: CustomizableButton!
    var eBookUpdateProfileViewController:EBookUpdateProfileViewController!
    
    var userId = String()
    var userName = String()

    var userEmail = String()

    var userPassword = String()

    var userProfile_pic = String()

    var userPhone = String()


    var usercreated_date = String()
    var strEditName = String()
    var strEditEmail = String()
    var getCustomerId = String()
    var getCustomerName = String()

    var getCustomerEmail = String()

    var getCustomerPhone = String()
    var EditUserName = String()

        var strImage1 = UIImage()


    var getUserId = String()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }

       getProfile()
        btnProfile.setBackgroundImage(strImage1, for: .normal)
        //profileImage.image = strImage1

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
               
           tap.numberOfTapsRequired = 1
           self.viewChangePwd.addGestureRecognizer(tap)
     
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleTap2(_:)))
                    
                tap2.numberOfTapsRequired = 1
                self.viewMyOrder.addGestureRecognizer(tap2)
        
        

   let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EBookMyProfileViewController.dismissController))
    tapGestureRecognizer.numberOfTapsRequired = 1
    self.view.addGestureRecognizer(tapGestureRecognizer)
    // Do any additional setup after loading the view.
}


@objc func dismissController(gesture: UITapGestureRecognizer)
{
    self.view.endEditing(true)
}

func textFieldShouldReturn(_ textField: UITextField) ->Bool
{
    
    textField.resignFirstResponder()
    
    return true
    //we can also put false in place of true
    
}
   
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
         // handling code
        print("imag")
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                  let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookChagePasswordVc") as! EBookChagePasswordVc
                  self.present(nextViewController, animated:true, completion:nil)

     }
    
    @objc func handleTap2(_ sender: UITapGestureRecognizer? = nil) {
         // handling code
        print("imag")
           let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAllOrdersVC") as! EBAllOrdersVC
              self.present(nextViewController, animated:true, completion:nil)
     }
    
    
        @IBAction func btnMyOrder(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMyOrderVc") as! EBookMyOrderVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        @IBAction func btnChagePassword(_ sender: Any) {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookChagePasswordVc") as! EBookChagePasswordVc
            self.present(nextViewController, animated:true, completion:nil)

        }

        @IBAction func btnProfile(_ sender: Any) {
            
//            let image = UIImagePickerController()
//            image.delegate = self
//
//            image.sourceType = .photoLibrary
//            image.allowsEditing = false
//
//            self.present(image, animated: true)
//            {
//
//            }
//

        }
    
    
    
    
        @IBAction func btnEdit(_ sender: Any) {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookUpdateProfileViewController") as! EBookUpdateProfileViewController
            
            
            nextViewController.getCustomerId1 = getUserId
            
            nextViewController.getName = userName
            
            nextViewController.getEmail = userEmail
            
            nextViewController.getMobNo = userPhone
            self.present(nextViewController, animated:true, completion:nil)

        }
        @IBAction func btnBack(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)


            
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
             return
            }

//                 profileImage.image = selectedImage
//
//            
//                   picker.dismiss(animated: true, completion: nil)
//
        }

    
    func getProfile(){
        
                        let parametersBal: Parameters=[
                            "customer_id":self.getUserId
                            
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        // BasUrl.baseURLPOST + "customer_login"
                        //http://zaarmall.com/development/get_user_profile
                        
                        Alamofire.request(BasUrl.baseURLPOST + "get_user_profile", method: .post, parameters: parametersBal).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                     var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                             



                                    
                                    if (status == 200 as CFBoolean)
                                    {

                            let data = (result as AnyObject).value(forKey: "data") as? NSDictionary
                                        
                                        
                                        self.userId = (data as AnyObject).value(forKey: "customer_id") as? String ?? ""

                               

                                        
                                        self.userName = (data as AnyObject).value(forKey: "name") as? String ?? ""


                                        self.NameText.text = self.userName

                                        self.userEmail = (data as AnyObject).value(forKey: "email") as? String ?? ""
                                        self.EmailText.text = self.userEmail

                                       
                                        self.EmailText.text = self.userEmail

                                        _ = (data as AnyObject).value(forKey: "password") as? String

                               
                                        self.userPhone = (data as AnyObject).value(forKey: "phone") as? String ?? ""

                                      
                                        self.mobileText.text = self.userPhone


                                        self.usercreated_date = (data as AnyObject).value(forKey: "created_date") as? String ?? ""

                                   
                                        
                            let image = (data as AnyObject).value(forKey: "profile_pic") as? String
                                                                            

                                        let getImgUrl = image ?? ""
                                        
                                        // BasUrl.baseURLPOST + "customer_login"

                                        let geturl = NSURL(string: BasUrl.baseURLPOST + getImgUrl )
                                                                                                                                                       
                                                                       
                                                                             
                                                    //    self.profileImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
                                                                                                         self.profileImage.sd_setImage(with: geturl! as URL) { (image, error, cache, urls) in
                                                                                                                      if (error != nil) {
                                                                                                                         self.profileImage.image = UIImage(named: "ar-undraw_book_lover_mkck-1")
                                                                                                                      }
                                                                                                                  }
                                                                            
                                                                            
                                                                          
                                                                
                                                         
                                                                        
                                                        
                                                                        
                                                                                                           
                                                                    



                                        
                                        
                                        


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
