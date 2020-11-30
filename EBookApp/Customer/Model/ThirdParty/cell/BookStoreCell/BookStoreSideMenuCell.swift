//
//  BookStoreSideMenuCell.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreSideMenuCell: UITableViewCell {

    @IBOutlet weak var rightBackImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imgSideMenuView: UIImageView!
    @IBOutlet weak var titleslbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
