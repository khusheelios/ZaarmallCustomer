//
//  MainCell.swift
//  EBookApp
//
//  Created by apple on 26/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

protocol CrossDelegate {
    func crossData(sender:MainCell)
   
}

class MainCell: UICollectionViewCell {
    
    var editData :CrossDelegate?
    
    @IBOutlet weak var btnCross: UIButton!
    @IBOutlet weak var bookAuthorImage: UIImageView!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var bookAuthorNamelbl: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblSellingPrice: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    
    
    @IBAction func crossAction(_ sender: Any)
    {
        self.editData?.crossData(sender: self)
    }
    

}
