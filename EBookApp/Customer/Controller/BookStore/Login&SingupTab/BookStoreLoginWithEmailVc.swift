//
//  BookStoreLoginWithEmailVc.swift
//  EBookApp
//
//  Created by apple on 07/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreLoginWithEmailVc: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var EnterEmailText: UITextField!
    @IBOutlet weak var EnterPasswordText: UITextField!
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        @IBAction func btnSignUp(_ sender: Any) {
//            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
//
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSingupVc") as! EBookSingupVc
//            self.present(nextViewController, animated:true, completion:nil)

        }
        @IBAction func btnLogin(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoginVc") as! BookStoreLoginVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        

        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
        @IBAction func btnUserNumber(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoinWithUserNmberVc") as! BookStoreLoinWithUserNmberVc
            self.present(nextViewController, animated:true, completion:nil)

        }
        
    }
