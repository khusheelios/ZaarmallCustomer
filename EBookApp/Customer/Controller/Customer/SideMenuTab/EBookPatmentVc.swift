//
//  EBookPatmentVc.swift
//  EBookApp
//
//  Created by apple on 23/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookPatmentVc: UIViewController {

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var cvvNumberText: UITextField!
    @IBOutlet weak var cardHolderText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var cardNmberText: UITextField!
    @IBOutlet weak var AddDardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(AddDardView)

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EBookPatmentVc.handleTap(_:)))
            AddDardView.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            AddDardView.isHidden = true
        }


    @IBAction func btnCheckBox(_ sender: Any) {
        if (checkBox.isSelected == true)
        {
            checkBox.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)

                checkBox.isSelected = false;
        }
        else
        {
            checkBox.setBackgroundImage(UIImage(named: "checkbox-2"), for: UIControl.State.normal)

            checkBox.isSelected = true;
        }
    }
    @IBAction func btnCaRDCancel(_ sender: Any) {
        AddDardView.isHidden = true

    }
    @IBAction func btnSubmit(_ sender: Any) {
        AddDardView.isHidden = true

    }
    
    @IBAction func btnBack(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//        self.present(nextViewController, animated:true, completion:nil)

        
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func btnDone(_ sender: Any) {
        //EBookPaymentSucessVc
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPaymentSucessVc") as! EBookPaymentSucessVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnAddCard(_ sender: Any) {
        if(AddDardView.isHidden == true){
            AddDardView.isHidden = false
            AddDardView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            AddDardView.isHidden = true
        }
    }
    
    @IBAction func btnWallet(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookWalletVC") as! EBookWalletVC
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnMasterCard(_ sender: Any) {
    }
    @IBAction func btnVisa(_ sender: Any) {
    }
    
    @IBAction func btnPayPal(_ sender: Any) {
    }
}
