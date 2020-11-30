//
//  EBAddressTVC.swift
//  ZaarmallApp
//
//  Created by Zanjo iOS Dev on 19/09/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

protocol buttonDelegate {
    func editAddress(sender:EBAddressTVC)
   
}


class EBAddressTVC: UITableViewCell {

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
      var editData :buttonDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editAction(_ sender: Any)
    {
        self.editData?.editAddress(sender: self)
    }
    

}
