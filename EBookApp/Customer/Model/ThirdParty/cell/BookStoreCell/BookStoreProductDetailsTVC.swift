//
//  BookStoreProductDetailsTVC.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreProductDetailsTVC: UITableViewCell {

        @IBOutlet weak var readmorelbl: UILabel!
        @IBOutlet weak var daylbl: UILabel!
        @IBOutlet weak var descrptionlbl: UILabel!
        @IBOutlet weak var ratinglbl: UILabel!
        @IBOutlet weak var namelbl: UILabel!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
