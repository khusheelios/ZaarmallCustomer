//
//  MyOrderCell.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MyOrderCell: UITableViewCell {

    @IBOutlet weak var btnWriteReviews: CustomizableButton!
    @IBOutlet weak var ratingView: StarRateView!
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
