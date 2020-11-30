//
//  SaveAddressCVC.swift
//  EBookApp
//
//  Created by apple on 25/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SaveAddressCVC: UITableViewCell {

    @IBOutlet weak var btnEdit: CustomizableButton!
    @IBOutlet weak var btnMenu: CustomizableButton!
    @IBOutlet weak var HomeImage: UIImageView!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var Homelbl: UILabel!
    @IBOutlet weak var headerView: CustomizableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
