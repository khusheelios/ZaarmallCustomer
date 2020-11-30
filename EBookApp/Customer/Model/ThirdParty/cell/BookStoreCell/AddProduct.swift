//
//  AddProduct.swift
//  EBookApp
//
//  Created by apple on 09/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
protocol HignLightButtonDelegetes {

    func HignLightButton(_ cell:AddProduct)
}


class AddProduct: UICollectionViewCell {
    
    @IBOutlet weak var btnSelect: CustomizableButton!
    @IBOutlet weak var btnHigligth: CustomizableButton!
    @IBOutlet weak var btnSelectType: UIButton!
    @IBOutlet weak var addpopupView: CustomizableView!
    @IBOutlet weak var booklbl: UILabel!
    @IBOutlet weak var addProductImage: UIImageView!
    var editData: HignLightButtonDelegetes?
    var indexPath : IndexPath?

    
    
    @IBAction func btnHigligth(_ sender: Any) {
        self.editData?.HignLightButton(self)


        if btnHigligth.tag == indexPath?.row {


        }

    }
    
}
