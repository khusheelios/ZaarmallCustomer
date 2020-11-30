//
//  ProductOfferCell.swift
//  EBookApp
//
//  Created by apple on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ProductOfferCell: UITableViewCell {

    @IBOutlet weak var datelbl: UILabel!
    
    @IBOutlet weak var btnReject: CustomizableButton!
    @IBOutlet weak var btnAccept: CustomizableButton!
    @IBOutlet weak var amountlbl1: UILabel!
    @IBOutlet weak var textlbl: UILabel!
    @IBOutlet weak var perstagelbl: UILabel!
    @IBOutlet weak var amountlbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTileslbl: UILabel!
    @IBOutlet weak var authorNamelbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
