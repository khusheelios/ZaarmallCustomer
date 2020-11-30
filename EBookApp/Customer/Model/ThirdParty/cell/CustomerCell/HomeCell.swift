//
//  HomeCell.swift
//  EBookApp
//
//  Created by apple on 18/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var btnAddToCart: CustomizableButton!
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var Authornamelbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var amountlbl: UILabel!
    
    @IBOutlet weak var ratingslbl1: UILabel!
    @IBOutlet weak var bookTitles1: UILabel!
    @IBOutlet weak var Authornamelbl1: UILabel!
    @IBOutlet weak var bookImage1: UIImageView!
    @IBOutlet weak var amountlbl1: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnAddToCart1(_ sender: Any) {
    }

    @IBAction func btnAddToCart(_ sender: Any) {
    }
}
