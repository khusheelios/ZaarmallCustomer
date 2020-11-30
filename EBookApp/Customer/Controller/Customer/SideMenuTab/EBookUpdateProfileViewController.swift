
import UIKit
import Alamofire
import MBProgressHUD
import Loaf

class EBookUpdateProfileViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {


@IBOutlet weak var EmailText: UITextField!
@IBOutlet weak var mobileText: UITextField!

@IBOutlet weak var NameText: UITextField!
@IBOutlet weak var profileImage: UIImageView!
@IBOutlet weak var btnProfile: CustomizableButton!
    
    var getCustomerId1 = String()
    var UserName = String()

    var getName = String()
    var getEmail = String()
    var getMobNo = String()
    
    var strImage = UIImage()

    
    var ImgMaskFront = Data()




override func viewDidLoad() {
    super.viewDidLoad()
    
    
    print(getName,getEmail,getMobNo)
    
    self.NameText.text = getName
    
    self.EmailText.text = getEmail
    
    self.mobileText.text = getMobNo

}
    
    

                

                
//                @objc func UpdateName(_ textField: UITextField) {
//
//                    NamePopup.isHidden = false
//                    Emailpopup.isHidden = true
//                    Contactpopup.isHidden = true
//
//                    NameText.placeholder = editName.text
//                    NameText.textAlignment = .right
//
//
//                    }

                
    
    
    

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
    @IBAction func btnUpdateProfile(_ sender: Any) {
        getUpdateProfile()
       // self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func btnProfile(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true)
      


    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
         return
        }

             profileImage.image = selectedImage
           //  strImage = selectedImage

      
               self.ImgMaskFront = selectedImage.jpegData(compressionQuality: 0.1)!
           
        
               picker.dismiss(animated: true, completion: nil)

    }
    
    
    
        func displayMyAlertMessage(userMessage:String)
        {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
            let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
            let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
            myAlert.addAction(okAction);
            myAlert.addAction(cancelAction);
            self.present(myAlert, animated: true,completion:nil);
            
            
        }

    func getUpdateProfile(){
        UserName = NameText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
         if (UserName.isEmpty) {
            
            displayMyAlertMessage(userMessage: "Please Enter Name")

        }

         else{
            MBProgressHUD.showAdded(to: self.view, animated: true)
                     
           
               // let ImageData = user_image.pngData()
                   
                        let parameters: Parameters = [
                                             "customer_id":self.getCustomerId1,
                                             "name":self.UserName
                                     ]
                
                print(parameters)
                
                Alamofire.upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(self.ImgMaskFront, withName: "profile_pic",fileName: self.getCustomerId1 + "profile" + ".jpg", mimeType: "image/jpg")
                    for (key, value) in parameters {
                        let stringValue = value as! String
                        multipartFormData.append(stringValue.data(using: String.Encoding.utf8)!, withName: key)
                        
                    } //Optional for extra parameters
                },
                                 // BasUrl.baseURLPOST + "customer_login"
                                 //http://zaarmall.com/development/update_user_profile
                                 to:BasUrl.baseURLPOST + "update_user_profile")
                { (result) in
                    
                    
                    switch result {
                    case .success(let upload, _, _):
                        
                        
                        upload.uploadProgress(closure: { (progress) in
                            print("Upload Progress: \(progress.fractionCompleted)")
                            
                            
                            
                        })
                        
                        upload.responseJSON { response in
                          //  print(response.result.value!)
                            
                            
                            if let result = response.result.value {
                                
                                //converting it as NSDictionary
                                let jsonData = result as! NSDictionary
                                
                              
                                var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                let message = (result as AnyObject).value(forKey: "message") as! String
                                
                                var data = (result as AnyObject).value(forKey: "data") as! NSDictionary


                                        MBProgressHUD.hide(for: self.view, animated: true)
                                                      
                                                      if (status == 200 as CFBoolean)
                                                      {

                                                          
//                                                          LoginHelperFunctions.notifyUser("Alert", message: "Update Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in

                                                            
                                            //                self.dismiss(animated: true, completion: nil)

                                                        
                                                  

                                                          let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMyProfileViewController") as! EBookMyProfileViewController
//                                                              nextViewController.strEditName = self.UserName
//                                                              nextViewController.strImage1 = self.strImage

                                                      

                                                          self.present(nextViewController, animated:true, completion:nil)

                                                            Loaf("Update Successful", state: .success, location: .bottom, sender: self).show()
                                                        
                                             //             })
                                                          
                                                          


                                                      }
                                                      else if(status == 1 as CFBoolean){
                                                          print("Already Exit")
                                                          Loaf(message, state: .error, location: .bottom, sender: self).show()

                                                      }
                                                      else{
                                                          
                                                      }
                                
                            }
                            
                        }
                        
                    case .failure(let encodingError):
                        print(encodingError)
                        
                        
                    }
                }
          
            
            
            

        

        }
    }


    
}

