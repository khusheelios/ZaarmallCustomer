//
//  BookStoreInventoryManagementVc.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
//BookStorInventryBookCVC

class BookStoreInventoryManagementVc: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var bookPopup: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBook: CustomizableButton!
    @IBOutlet weak var btnStationary: CustomizableButton!
    
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var selectCategorylbl: UILabel!
    
    var bookTitleArray = ["The Indian book","The Indian Book"]
   
    var booSubTitlesArray = ["Book","Book"]
    
    var quantityArray = ["15","20"]
    
    
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03")]
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        

            
                }
        
        


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookTitleArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //InvenetoryCategoryTVC

         let cell = tableView.dequeueReusableCell(withIdentifier: "BookStorInventryBookCVC", for: indexPath) as!BookStorInventryBookCVC
        cell.titileslbl?.text = bookTitleArray[indexPath.row]
        cell.sabtitleslbl.text = booSubTitlesArray[indexPath.row]
        cell.bookImage.image = bookImageArray[indexPath.row]
            
        cell.quntitylbl.text = quantityArray[indexPath.row]
       //cell.btnSave.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        
            
            

            
        
        return cell
    }
    
    @objc func thumbsUpButtonPressed() {
        
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "BookStorInventryBookCVC", for: indexPath) as!BookStorInventryBookCVC
//            
//            cell.btnSave.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//            cell.editpopup.isHidden = true


            
        }



}

