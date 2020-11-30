//
//  EBookAboutUsVC.swift
//  EBookApp
//
//  Created by apple on 16/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookAboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        self.present(nextViewController, animated:true, completion:nil)

        
    }

}
