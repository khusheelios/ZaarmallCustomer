  //
//  BookStorInventryBookCVC.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStorInventryBookCVC: UITableViewCell {

    @IBOutlet weak var totalfirstlbl: UILabel!
    @IBOutlet weak var quntitylbl: UILabel!
    @IBOutlet weak var totalQuntityText: UITextField!
    @IBOutlet weak var editpopup: CustomizableView!
    @IBOutlet weak var rupeePopupView: CustomizableView!
    @IBOutlet weak var compelteProgressPopup: UIView!
    @IBOutlet weak var orderiflbl: UILabel!
    @IBOutlet weak var sabtitleslbl: UILabel!
    @IBOutlet weak var titileslbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!

    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var rupeeAmount: CustomizableView!
    @IBOutlet weak var btnSave: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnSave(_ sender: Any) {
       // rupeePopupView.isHidden = true
        //editpopup
        if(editpopup.isHidden == true){
            
            editpopup.isHidden = false
            rupeePopupView.isHidden  = true
            totalfirstlbl.isHidden = true
            btnSave.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnSave.setTitleColor(.white, for: .normal)

            
        }
        else{
            editpopup.isHidden = true
            rupeePopupView.isHidden = false
            totalfirstlbl.isHidden = false

            btnSave.backgroundColor = .white
            btnSave.layer.cornerRadius = 15
            btnSave.layer.borderWidth = 1
            var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnSave.layer.borderColor = red.cgColor
                       
            var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnSave.setTitleColor(red1, for: .normal)

        }
            


    }


    @IBAction func btnEdit(_ sender: Any) {
        if(rupeePopupView.isHidden == true){
            
            rupeePopupView.isHidden = false
            btnSave.isHidden = false
            
        }
        else{
            rupeePopupView.isHidden = true
            btnSave.isHidden = true
        }
            
            
        
    }
}
