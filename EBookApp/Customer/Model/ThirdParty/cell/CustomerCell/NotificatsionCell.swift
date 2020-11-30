//
//  NotificatsionCell.swift
//  EBookApp
//
//  Created by apple on 02/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class NotificatsionCell: UITableViewCell {

    @IBOutlet weak var textlbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var perstagelbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
