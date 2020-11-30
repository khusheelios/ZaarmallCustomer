//
//  BookStoreMemberShipeVc.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreMemberShipeVc: UIViewController {
    @IBOutlet weak var btnDropDown: UIButton!


    @IBOutlet weak var agreementTypePopup: CustomizableView!
    @IBOutlet weak var agreementlbl: UITextField!
    
    @IBOutlet weak var btnQuartly: UIButton!
    
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var btnCommsion: UIButton!
    @IBOutlet weak var btnAnnul: UIButton!
    @IBOutlet weak var btnMonhly: UIButton!
    
    @IBOutlet weak var mainView: CustomizableView!
    
    @IBOutlet weak var verificationPopup: UIView!

    
    var userMebership = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.addSubview(agreementTypePopup)
        
        view.addSubview(verificationPopup)


//        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(BookStoreMemberShipeVc.handleTap2(_:)))
//        agreementTypePopup.addGestureRecognizer(tapGesture2)
//
                  let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreMemberShipeVc.handleTap(_:)))
            verificationPopup.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            verificationPopup.isHidden = true
        }

    @objc func handleTap2(_ sender: UITapGestureRecognizer) {
        agreementTypePopup.isHidden = true
    }

    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }


    
    
    
    @IBAction func btnUpload(_ sender: Any) {
        
        
                 userMebership = agreementlbl.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        
             if (userMebership.isEmpty) {
                
                displayMyAlertMessage(userMessage: "Please Select Membership")

            }
             else if(btnCheckBox.isSelected == false){
                
                               if(verificationPopup.isHidden == true){
                                   verificationPopup.isHidden = false
                                   verificationPopup.backgroundColor = UIColor.black.withAlphaComponent(0.50)

                               }
                               else{
                                   verificationPopup.isHidden = true
                               }

                
                
                
                
        }


    }
    
    
    
    @IBAction func btnCheckBox(_ sender: Any) {
        if (btnCheckBox.isSelected == true)
        {
            btnCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)

                btnCheckBox.isSelected = false;
        }
        else
        {
            btnCheckBox.setBackgroundImage(UIImage(named: "checkbox-2"), for: UIControl.State.normal)

            btnCheckBox.isSelected = true;
        }

    }
    
    @IBAction func btnCommission(_ sender: Any) {
        agreementlbl.text = "Commission"
        agreementTypePopup.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


    }
    @IBAction func btnAnnully(_ sender: Any) {
        agreementlbl.text = "Annually"
        agreementTypePopup.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


    }
    @IBAction func btnQurtally(_ sender: Any) {
        agreementlbl.text = "Quartely"
        agreementTypePopup.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


    }
    @IBAction func btnmonthly(_ sender: Any) {
        agreementlbl.text = "Monthly"
        agreementTypePopup.isHidden = true
        btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


        
    }
    @IBAction func btndropDown(_ sender: Any) {
        if(agreementTypePopup.isHidden == true){
            agreementTypePopup.isHidden = false
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            agreementTypePopup.isHidden = true
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

        }

    }
    
    @IBAction func btnOk(_ sender: Any) {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
        
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
                        self.present(nextViewController, animated:true, completion:nil)


    }

    


}
