//
//  EbookReuestBooksVc.swift
//  EBookApp
//
//  Created by apple on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EbookReuestBooksVc: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var languageText: UITextField!
    @IBOutlet weak var discerptonText: UITextView!
    
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var titlesText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    
    @IBOutlet weak var desText: UITextView!
    @IBOutlet weak var lanuagePOPUpView: CustomizableView!
       @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lanuangefirstlbl: UILabel!
    var strLanuageName = String()

    @IBOutlet weak var btnGarllry: UIButton!
    
    @IBOutlet weak var ReatanularDashedView: RectangularDashedView!
    var lanuagneArray = ["English","Arabic"]
       var selectedRows:[IndexPath] = []
    
    var UserTitle = String()
    var UserAuthor = String()
    var Userlanuage = String()
    var Userdescription = String()
    var flag = 0
    
    var strImage1 = UIImage()
    var strImage2 = UIImage()



    var getUserId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if getUserId.isEmpty
        {
            getUserId  = UserDefaults.standard.string(forKey: "customer_id")!
        }

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        tableView.delegate = self
        tableView.dataSource = self

        
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EbookReuestBooksVc.handleTap(_:)))
            lanuagePOPUpView.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            lanuagePOPUpView.isHidden = true
        }


    @IBAction func btnGarllry(_ sender: Any) {
        flag = 2
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            
        }

    }
    @IBAction func btnCamera(_ sender: Any) {
        flag = 2
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
         return
        }
                    if flag == 1
                    {
                        productImage.image = selectedImage
                        strImage1 = productImage.image!
//                        btnCamera.isHidden = true
//                        btnGarllry.isHidden = true
                        ReatanularDashedView.isHidden = true


                        
                            }
                    else if flag == 2
                    {
                        productImage.image = selectedImage
                        
                        strImage2 = productImage.image!

                        
                        ReatanularDashedView.isHidden = true

//                        btnCamera.isHidden = true
//                        btnGarllry.isHidden = true



                    }
        


               picker.dismiss(animated: true, completion: nil)

    }

    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

//                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//                self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnDropDown(_ sender: Any) {
        if(lanuagePOPUpView.isHidden == true){
            lanuagePOPUpView.isHidden = false
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            lanuagePOPUpView.isHidden = true
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

        }

    }
    
    @IBAction func btnSendRequest(_ sender: Any) {
        getRequestProduct()
    }
    
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return lanuagneArray.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ReuestBookTVC", for: indexPath) as!ReuestBookTVC
                    
                        


                    
                    cell.languagelbl.text = lanuagneArray[indexPath.row]
                    strLanuageName = cell.languagelbl.text!
                    
                    
                    if selectedRows.contains(indexPath)
                    {
                                  cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)
                        //lanuangefirstlbl.text = strLanuageName
                            cell.btnLaguageSlect.setTitle(strLanuageName, for: .normal)
                        languageText.text = strLanuageName
                        lanuagePOPUpView.isHidden = true
                        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


    //                    strCusinesName1 = cell.btncheck.setTitle(strCusinesName, for: .normal)

                    }
                    else
                    {
                                  cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)
                    }
                    cell.btnLaguageSlect.tag = indexPath.row
    //                strTag = cell.btncheck.tag
    //                print(strTag)
                    cell.btnLaguageSlect.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)

                    
                    
                    
                    
                    

                    
                    
                    
                    

             return cell
        
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
          self.tableView.reloadData()
            
            
        }

    
    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }

    func getRequestProduct(){
        
        UserTitle = titleText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        UserAuthor = authorText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        Userlanuage = languageText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        Userdescription = discerptonText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        
        if((UserTitle.isEmpty)
            || (UserAuthor.isEmpty) || (Userlanuage.isEmpty) || (Userdescription.isEmpty))
            {
               
                if (UserTitle.isEmpty) {
                   
                   displayMyAlertMessage(userMessage: "Please Enter Title Name")

               }
               else if (UserAuthor.isEmpty) {
                   displayMyAlertMessage(userMessage: "Please Enter Author Name")

               }
               else if (Userlanuage.isEmpty) {
                   
                   displayMyAlertMessage(userMessage: "Please Enter Lanuage")

               }
                
                else if (Userdescription.isEmpty) {
                    
                    displayMyAlertMessage(userMessage: "Please Enter Description")

                }


        }

        else{

        let parametersBal: Parameters=[
            "customer_id":getUserId,
            "title":self.UserTitle,
            "author":self.UserAuthor,
            "description":self.Userdescription,
            "order_id":"1",
            "language":self.Userlanuage

            
            
        ]
        
        print(parametersBal)
        
        
        // BasUrl.baseURLPOST + "customer_login"
         //http://laxmi1963.com/ZaarMall/send_book_request
        Alamofire.request(BasUrl.baseURLPOST + "send_book_request", method: .post, parameters: parametersBal).responseJSON
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

                        
                        LoginHelperFunctions.notifyUser("Alert", message: "Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in



                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc

                        
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



    
}
