//
//  EBSettingTVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 01/10/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

class EBSettingTVC: UITableViewCell {

    @IBOutlet weak var imgRightClosure: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchAction(_ sender: UISwitch)
    {
        
    }
    
    

}
