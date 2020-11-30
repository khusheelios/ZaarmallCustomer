//
//  BookStoreAgremeentVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreAgremeentVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnUpload(_ sender: Any) {
    }
    
    @IBAction func btnDownload(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTypeOfAgreementUploadVc") as! BookStoreTypeOfAgreementUploadVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTypeOfAgreementUploadVc") as! BookStoreTypeOfAgreementUploadVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    
}
