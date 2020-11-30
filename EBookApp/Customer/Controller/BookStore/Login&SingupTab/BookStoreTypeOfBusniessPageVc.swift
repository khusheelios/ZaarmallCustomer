//
//  BookStoreTypeOfBusniessPageVc.swift
//  EBookApp
//
//  Created by apple on 07/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreTypeOfBusniessPageVc: UIViewController {

    @IBOutlet weak var busniesslbl: UILabel!
    @IBOutlet weak var btnDropDown: UIButton!

    
    @IBOutlet weak var busniessText: UITextField!
    @IBOutlet weak var businessPopupView: CustomizableView!
    var UserBusniess = String()

    
    override func viewDidLoad() {
                super.viewDidLoad()

        
                }
                
    @IBAction func btndropDown(_ sender: Any) {
        
        if(businessPopupView.isHidden == true){
            businessPopupView.isHidden = false
            
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

           // busniessText.isUserInteractionEnabled = false
        }
        else{
            businessPopupView.isHidden = true
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

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

    
            @IBAction func btnSenProceed(_ sender: Any) {
               UserBusniess = busniessText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)


                                    let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreSingupVc") as! BookStoreSingupVc
                                    self.present(nextViewController, animated:true, completion:nil)

                
                
//                 if (UserBusniess.isEmpty) {
//
//                    displayMyAlertMessage(userMessage: "Please Select Busniess Type ")
//
//
//
//
//                }
//                 else {
//
//                    let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
//
//                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreSingupVc") as! BookStoreSingupVc
//                    self.present(nextViewController, animated:true, completion:nil)
//
//
//                }

            }
            
    @IBAction func btnAuthor(_ sender: Any) {
       // let str1 = "Author & Publisher"
        busniessText?.placeholder = "Author & Publisher"
        businessPopupView.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)



    }
    @IBAction func btnEbook(_ sender: Any) {
        busniessText?.placeholder = "Ebook Seller "
        businessPopupView.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)



    }
    @IBAction func btnAudio(_ sender: Any) {
        busniessText?.placeholder = "Audiobook Seller"
        businessPopupView.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)



    }
    
    @IBAction func btnBookStore(_ sender: Any) {
        busniessText?.placeholder = "E-commerce Store"
        businessPopupView.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


        
    }
    
        }
