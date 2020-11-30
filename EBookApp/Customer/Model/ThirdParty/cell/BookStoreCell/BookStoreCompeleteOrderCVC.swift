//
//  BookStoreCompeleteOrderCVC.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreCompeleteOrderCVC: UITableViewCell {
    
    @IBOutlet weak var Compeletelbl: UILabel!
    @IBOutlet weak var orderiflbl: UILabel!
    @IBOutlet weak var sabtitleslbl: UILabel!
    @IBOutlet weak var titileslbl: UILabel!
    @IBOutlet weak var CompelteOrderImage: UIImageView!


    @IBOutlet weak var CompleteOrderView: CustomizableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        CompleteOrderView.layer.shadowRadius = 5
//        CompleteOrderView.layer.shadowOpacity = 0.6
//        CompleteOrderView.layer.shadowOffset = CGSize(width: 0, height: 5)
//        CompleteOrderView.layer.shadowColor = UIColor.white.cgColor
//
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
