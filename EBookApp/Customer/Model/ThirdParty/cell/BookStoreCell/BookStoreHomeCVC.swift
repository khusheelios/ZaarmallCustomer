//
//  BookStoreHomeCVC.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
protocol FavurtiesttonDelegetes {

    func FavurtiesButton(_ cell:BookStoreHomeCVC)
}



class BookStoreHomeCVC: UICollectionViewCell {
   
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var bookTitles: UILabel!
    @IBOutlet weak var Authornamelbl: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var amountlbl: UILabel!

    @IBOutlet weak var btnFavorites: UIButton!
    @IBOutlet weak var perstagelbl: UILabel!
    @IBOutlet weak var amountlbl1: UILabel!
    
    var editData: FavurtiesttonDelegetes?
    var indexPath : IndexPath?


    @IBAction func btnFav(_ sender: Any) {
        self.editData?.FavurtiesButton(self)


        if btnFavorites.tag == indexPath?.row {


        }

    }
}
