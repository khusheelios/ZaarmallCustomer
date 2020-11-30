//
//  RequestProductCell.swift
//  EBookApp
//
//  Created by apple on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RequestProductCell: UITableViewCell {

    
    @IBOutlet weak var textlbl: UILabel!
    @IBOutlet weak var bntView: CustomizableButton!
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
