//
//  BookStoreNewOrderCVC.swift
//  EBookApp
//
//  Created by apple on 09/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreNewOrderCVC: UITableViewCell {

    @IBOutlet weak var NewOrderView: CustomizableView!
    @IBOutlet weak var btnAssign: CustomizableButton!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var Iteamlbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var orderiflbl: UILabel!
    @IBOutlet weak var sabtitleslbl: UILabel!
    @IBOutlet weak var titileslbl: UILabel!
    @IBOutlet weak var newOrderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        NewOrderView.layer.shadowRadius = 5
//        NewOrderView.layer.shadowOpacity = 0.6
//        NewOrderView.layer.shadowOffset = CGSize(width: 0, height: 5)
//        NewOrderView.layer.shadowColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
