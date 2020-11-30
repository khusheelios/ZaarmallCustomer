//
//  BookStoreBookPublishVc.swift
//  EBookApp
//
//  Created by apple on 08/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreBookPublishVc: UIViewController {

    @IBOutlet weak var publishBookPopup: UIView!
    @IBOutlet weak var btnAddProduct: CustomizableButton!
    @IBOutlet weak var btnPublishToStore: CustomizableButton!
    @IBOutlet weak var btnSaveDraft: CustomizableButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddProduct(_ sender: Any) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAddProductVc") as! BookStoreAddProductVc
                self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnBack(_ sender: Any) {
    }
    
    @IBAction func btnPublishToStore(_ sender: Any) {
        
        
        btnPublishToStore.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        
        btnPublishToStore.setTitleColor(UIColor.white, for: .normal)
            btnSaveDraft.backgroundColor = UIColor.clear
         //var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
         
         btnSaveDraft.setTitleColor(.black, for: .normal)
         
         btnPublishToStore.layer.cornerRadius = 20
         btnPublishToStore.layer.borderWidth = 1
         var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
         btnPublishToStore.layer.borderColor = red.cgColor



         btnSaveDraft.layer.cornerRadius = 20
         btnSaveDraft.layer.borderWidth = 1
         var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
         btnSaveDraft.layer.borderColor = red1.cgColor



        
        
    }
    
    @IBAction func btnAdSaveToDraft(_ sender: Any) {
        btnSaveDraft.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        
        btnSaveDraft.setTitleColor(UIColor.white, for: .normal)
            btnPublishToStore.backgroundColor = UIColor.clear
        
        btnPublishToStore.setTitleColor(.black, for: .normal)
        
        
        btnPublishToStore.layer.cornerRadius = 20
        btnPublishToStore.layer.borderWidth = 1
        var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnPublishToStore.layer.borderColor = red.cgColor



        btnSaveDraft.layer.cornerRadius = 20
        btnSaveDraft.layer.borderWidth = 1
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnSaveDraft.layer.borderColor = red1.cgColor


        


    }
}
