//
//  EbookFavoritesCell.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EbookFavoritesCell: UITableViewCell {

    @IBOutlet weak var bookAuthorImage: UIImageView!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var bookAuthorNamelbl: UILabel!
    
    
    @IBOutlet weak var bookAuthorImage1: UIImageView!
    @IBOutlet weak var bookTitles1: UILabel!
    @IBOutlet weak var bookAuthorNamelbl1: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
