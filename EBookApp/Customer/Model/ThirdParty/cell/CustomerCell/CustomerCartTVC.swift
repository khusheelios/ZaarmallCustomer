//
//  CustomerCartTVC.swift
//  EBookApp
//
//  Created by apple on 21/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

protocol buttonDelegate2 {
    func AddCartItem(sender:CustomerCartTVC)
    func MinusCartItem(sender:CustomerCartTVC)
    func removeFromCart(sender:CustomerCartTVC)
    func addToFavourites(sender:CustomerCartTVC)
}

class CustomerCartTVC: UITableViewCell {

    @IBOutlet weak var btnAddItem: UIButton!

    @IBOutlet weak var amountlbl6: UILabel!
    @IBOutlet weak var amountlbl5: UILabel!
    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var offerlbl: UILabel!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var Qtylbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnMoveFavorties: UIButton!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var amountlbl4: UILabel!
    @IBOutlet weak var amount3: UILabel!
    @IBOutlet weak var amountlbl2: UILabel!
    @IBOutlet weak var amountlbl1: UILabel!
    @IBOutlet weak var rockehardlbl: UILabel!
    @IBOutlet weak var sellerNamelbl: UILabel!
    @IBOutlet weak var sizelbl: UILabel!
    @IBOutlet weak var rockhardlbl: UILabel!
    @IBOutlet weak var lbloriginalPrice: UILabel!
    
    @IBOutlet weak var btnMinusCart: UIButton!
    @IBOutlet weak var lblCartValue: UILabel!
    
    var editData2 :buttonDelegate2?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeAction(_ sender: Any) {
             self.editData2?.removeFromCart(sender: self)
    }
    
    @IBAction func moveToFavouriteAction(_ sender: Any) {
        
             self.editData2?.addToFavourites(sender: self)
    }
    
    @IBAction func addCartAction(_ sender: Any) {
             self.editData2?.AddCartItem(sender: self)
    }
    
    
    @IBAction func minusCartAction(_ sender: Any) {
        self.editData2?.MinusCartItem(sender: self)
    }
    
}
