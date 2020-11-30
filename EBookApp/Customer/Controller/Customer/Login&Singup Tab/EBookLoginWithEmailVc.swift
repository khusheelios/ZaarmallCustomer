//
//  EBookLoginWithEmailVc.swift
//  EBookApp
//
//  Created by apple on 24/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookLoginWithEmailVc: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var EnterEmailText: UITextField!
    @IBOutlet weak var EnterPasswordText: UITextField!
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBAction func btnSignUp(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSingupVc") as! EBookSingupVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        @IBAction func btnLogin(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookOTPVerificatsionVC") as! EBookOTPVerificatsionVC
            self.present(nextViewController, animated:true, completion:nil)

        }
        

        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
        @IBAction func btnUserNumber(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
    }
