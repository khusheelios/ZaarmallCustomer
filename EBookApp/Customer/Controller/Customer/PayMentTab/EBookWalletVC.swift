//
//  EBookWalletVC.swift
//  EBookApp
//
//  Created by apple on 27/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookWalletVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(moneyPopupView)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EBookWalletVC.handleTap(_:)))
            moneyPopupView.addGestureRecognizer(tapGesture)
        }
        
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            moneyPopupView.isHidden = true
        }
    @IBOutlet weak var moneyPopupView: UIView!
    

    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnAddMoney(_ sender: Any) {
        if(moneyPopupView.isHidden == true){
            moneyPopupView.isHidden = false
            moneyPopupView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            moneyPopupView.isHidden = true
        }
    }
    
    @IBAction func btnCross(_ sender: Any) {
        moneyPopupView.isHidden = true

    }
    @IBAction func btnProceed(_ sender: Any) {
        moneyPopupView.isHidden = true

    }
}
