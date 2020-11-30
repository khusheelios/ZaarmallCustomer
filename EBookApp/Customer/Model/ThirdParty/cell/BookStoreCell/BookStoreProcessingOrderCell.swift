//
//  BookStoreProcessingOrderCell.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit


class BookStoreProcessingOrderCell: UITableViewCell {
    
    @IBOutlet weak var compelteProgressPopup: UIView!
    @IBOutlet weak var orderiflbl: UILabel!
    @IBOutlet weak var sabtitleslbl: UILabel!
    @IBOutlet weak var titileslbl: UILabel!
    @IBOutlet weak var ProcessingOrderImage: UIImageView!

    @IBOutlet weak var ProcessingOrderView: CustomizableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        ProcessingOrderView.layer.shadowRadius = 5
//        ProcessingOrderView.layer.shadowOpacity = 0.6
//        ProcessingOrderView.layer.shadowOffset = CGSize(width: 0, height: 5)
//        ProcessingOrderView.layer.shadowColor = UIColor.white.cgColor
//
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
