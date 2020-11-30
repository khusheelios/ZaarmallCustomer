//
//  EBookGiftVc.swift
//  EBookApp
//
//  Created by apple on 02/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookGiftVc: UIViewController {

    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var zipcodeText: UITextField!
    @IBOutlet weak var landmarkText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var contryText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var NameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction1(_ sender: Any) {
        if (btn2.isSelected == true)
        {
            btn2.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)

                btn2.isSelected = false;
            
           
            btn1.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)

                
        }
        else
        {
            btn2.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)

            btn2.isSelected = true;
        }

        

    }
    
    @IBAction func btnAction(_ sender: Any) {
        
        if (btn1.isSelected == true)
        {
            btn1.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)

                btn1.isSelected = false;
            
           
            btn2.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)

                
        }
        else
        {
            btn1.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)

            btn1.isSelected = true;
        }

        

    }
    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookDetailsVc") as! EBookDetailsVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnDone(_ sender: Any) {
    }
}
