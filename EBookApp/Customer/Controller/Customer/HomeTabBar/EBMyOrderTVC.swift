//
//  EBMyOrderTVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 24/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

class EBMyOrderTVC: UITableViewCell {

    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    
    @IBOutlet weak var lblNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
