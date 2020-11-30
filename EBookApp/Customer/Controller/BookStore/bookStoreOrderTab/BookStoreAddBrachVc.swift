//
//  BookStoreAddBrachVc.swift
//  EBookApp
//
//  Created by apple on 08/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreAddBrachVc: UIViewController {

    @IBOutlet weak var landmarkText: UITextField!
    @IBOutlet weak var buildingNameText: UITextField!
    @IBOutlet weak var zipcodeText: UITextField!
    @IBOutlet weak var flatNoText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var countryText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAddProductVc") as! BookStoreAddProductVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnSave(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAddProductVc") as! BookStoreAddProductVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
}
