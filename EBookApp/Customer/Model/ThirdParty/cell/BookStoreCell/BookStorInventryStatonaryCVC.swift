//
//  BookStorInventryStatonaryCVC.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStorInventryStatonaryCVC: UITableViewCell {
    @IBOutlet weak var btnSave1: CustomizableButton!
    
    @IBOutlet weak var amountText1: UITextField!
    @IBOutlet weak var rupeePopUpView1: CustomizableView!
    @IBOutlet weak var orderiflbl: UILabel!
    @IBOutlet weak var sabtitleslbl: UILabel!
    @IBOutlet weak var titileslbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var btnEdit1: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSave1(_ sender: Any) {
        rupeePopUpView1.isHidden = true
        btnSave1.isHidden = true

    }
    @IBAction func btnEdit1(_ sender: Any) {
        if(rupeePopUpView1.isHidden == true){
            rupeePopUpView1.isHidden = false
            btnSave1.isHidden = false
            
        }else{
            rupeePopUpView1.isHidden = true
            btnSave1.isHidden = true
        }
    }
}
