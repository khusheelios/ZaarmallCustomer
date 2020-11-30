//
//  BookStoreDetailsCVC.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
protocol FavurtiesttonsDelegetes1 {

    func FavurtiesButton(_ cell:BookStoreDetailsCVC)
}


class BookStoreDetailsCVC: UICollectionViewCell {
        @IBOutlet weak var btnAddToCart: CustomizableButton!
        @IBOutlet weak var ratingslbl: UILabel!
        @IBOutlet weak var bookTitles: UILabel!
        @IBOutlet weak var Authornamelbl: UILabel!
        @IBOutlet weak var bookImage: UIImageView!
        @IBOutlet weak var amountlbl: UILabel!
        @IBOutlet weak var amountlbl1: UILabel!
        @IBOutlet weak var perstagelbl: UILabel!
        
        var editData: FavurtiesttonsDelegetes1?
        var indexPath : IndexPath?

        
        @IBOutlet weak var btnFavuties: UIButton!
        
        @IBAction func btnFavrtioes(_ sender: Any) {
            self.editData?.FavurtiesButton(self)


            if btnFavuties.tag == indexPath?.row {


            }

        }
        
    }

