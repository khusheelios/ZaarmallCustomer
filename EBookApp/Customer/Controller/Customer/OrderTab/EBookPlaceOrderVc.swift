//
//  EBookPlaceOrderVc.swift
//  EBookApp
//
//  Created by apple on 23/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit



class EBookPlaceOrderVc: UIViewController {

    @IBOutlet weak var amountlbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var btnOther: CustomizableButton!
    @IBOutlet weak var btnWork: CustomizableButton!
    @IBOutlet weak var btnHome: CustomizableButton!
    @IBOutlet weak var zipCodeText: UITextField!
    @IBOutlet weak var landMarkText: UITextField!
    @IBOutlet weak var FlatNoText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var topView: UIView!
    var flag = Int()
    override func viewDidLoad() {
            super.viewDidLoad()
        flag = 0
        print(flag)
        }

    @IBAction func btnProceed(_ sender: Any) {
    }
    
    @IBAction func btnOther(_ sender: Any) {
        btnOther.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnOther.setTitleColor(UIColor.white, for: .normal)
            btnWork.backgroundColor = UIColor.clear
            btnHome.backgroundColor = UIColor.clear
        btnHome.setTitleColor(UIColor.black, for: .normal)

        btnWork.setTitleColor(UIColor.black, for: .normal)



        

    }
    @IBAction func btnWork(_ sender: Any) {
        btnWork.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWork.setTitleColor(UIColor.white, for: .normal)
            btnHome.backgroundColor = UIColor.clear
            btnOther.backgroundColor = UIColor.clear
        btnHome.setTitleColor(UIColor.black, for: .normal)

        btnOther.setTitleColor(UIColor.black, for: .normal)


        
    }
    @IBAction func btnHome(_ sender: Any) {
        
        btnHome.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnHome.setTitleColor(UIColor.white, for: .normal)
            btnWork.backgroundColor = UIColor.clear
            btnOther.backgroundColor = UIColor.clear
        btnWork.setTitleColor(UIColor.black, for: .normal)

        btnOther.setTitleColor(UIColor.black, for: .normal)

            
        
    }
    @IBAction func btnUseCurrentLocation(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMapVc") as! EBookMapVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnFillYourAddress(_ sender: Any) {
        
        
    }
    
        
        @IBAction func btnBack(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)

            
        }

        
        
    }

