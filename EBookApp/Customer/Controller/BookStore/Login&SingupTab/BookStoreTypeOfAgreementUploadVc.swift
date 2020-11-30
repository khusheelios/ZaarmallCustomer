//
//  BookStoreTypeOfAgreementUploadVc.swift
//  EBookApp
//
//  Created by apple on 08/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreTypeOfAgreementUploadVc: UIViewController {

    @IBOutlet weak var verificationPopup: UIView!
    @IBOutlet weak var firstpopup: CustomizableView!
    @IBOutlet weak var agreementTypePopup: CustomizableView!
    @IBOutlet weak var uplaoadlbl: UILabel!
    @IBOutlet weak var agreementlbl: UILabel!
    @IBOutlet weak var btnDropDown: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      view.addSubview(verificationPopup)
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreTypeOfAgreementUploadVc.handleTap(_:)))
              verificationPopup.addGestureRecognizer(tapGesture)
          }
          
          @objc func handleTap(_ sender: UITapGestureRecognizer) {
              verificationPopup.isHidden = true
          }

//    func createAgreementPopup(){
//        var customView = UIView(frame: CGRect(x: 120, y: 15, width: 366, height:150))
//
//
//    }
    @IBAction func btnTermsAndConditions(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAgremeentVc") as! BookStoreAgremeentVc
        self.present(nextViewController, animated:true, completion:nil)

    }

    
    @IBAction func btnUpload(_ sender: Any) {
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
    @IBAction func btnSubmit(_ sender: Any) {
            if(verificationPopup.isHidden == true){
                verificationPopup.isHidden = false
                verificationPopup.backgroundColor = UIColor.black.withAlphaComponent(0.50)

            }
            else{
                verificationPopup.isHidden = true
            }

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
