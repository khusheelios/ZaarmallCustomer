//
//  EBookCartCell.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

protocol AddbuttonDelegete {

    func PlusButton1(_ cell:EBookCartCell)
    func MiniusButton1(_ cell:EBookCartCell)

}



class EBookCartCell: UITableViewCell {

    @IBOutlet weak var rupeelbl: UILabel!
    @IBOutlet weak var bookSubTitleslbl: UILabel!
    @IBOutlet weak var bookTilitslbl: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var btnplus1: UIButton!
    @IBOutlet weak var btnminius1: UIButton!
    @IBOutlet weak var incrmentlbl: UILabel!


    
        var editData: AddbuttonDelegete?
        
    var indexPath : IndexPath?
    var strProductQuantity1 = 0


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
        @IBAction func btnMinus1(_ sender: Any) {
            
            self.editData?.MiniusButton1(self)


            if btnminius1.tag == indexPath?.row {


            }

            
            
            
            
        }
        @IBAction func btnplus1(_ sender: Any) {
            
    //        counterValue += 1;
    //        self.incrementlbl.text = "\(counterValue)"
    //        product.price = counterValue
    //        editData?.addProductToCart(product: product, atindex: productIndex)


            
            self.editData?.PlusButton1(self)


            if btnplus1.tag == indexPath?.row {


            }


        }
        


}
