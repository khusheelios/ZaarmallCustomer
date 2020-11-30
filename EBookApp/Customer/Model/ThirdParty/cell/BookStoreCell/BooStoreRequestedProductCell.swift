//
//  BooStoreRequestedProductCell.swift
//  EBookApp
//
//  Created by apple on 07/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BooStoreRequestedProductCell: UITableViewCell {

        @IBOutlet weak var btnaccepted: CustomizableButton!
        @IBOutlet weak var acceptlbl: UILabel!
        @IBOutlet weak var loremlbl: UILabel!
        @IBOutlet weak var internallbl: UILabel!
        @IBOutlet weak var productImage: UIImageView!
        var customView = UIView()

        override func awakeFromNib() {
            super.awakeFromNib()
            customView = UIView(frame: CGRect(x: 18, y: 3, width: 390, height:1))
            self.addSubview(customView)
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
