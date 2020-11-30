//
//  BookStoreReuestStatusVc.swift
//  EBookApp
//
//  Created by apple on 07/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreReuestStatusVc: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var requestedPopUp: UIView!
    @IBOutlet weak var requestProductStatusPopup: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnRequestProduct: CustomizableButton!
    @IBOutlet weak var btnproductStatus: CustomizableButton!
    
    @IBOutlet weak var firstRequestPopupView: UIView!
    
    var bookTitleArray = ["Internal Squrity book","Internal Squrity book","Internal Squrity book"]
   
    var booSubTitlesArray = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore"]
    
    var statusArray = ["Accepted","Pending","Reject"]
    
    
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04")]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView1.separatorStyle = UITableViewCell.SeparatorStyle.none
        view.addSubview(firstRequestPopupView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreReuestStatusVc.handleTap(_:)))
                firstRequestPopupView.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                firstRequestPopupView.isHidden = true
            }

    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnSendOffer(_ sender: Any) {
        
        firstRequestPopupView.isHidden = true
    }
    
    @IBAction func btnRequestProduct(_ sender: Any) {
        if(requestedPopUp.isHidden == true){
           requestedPopUp.isHidden = false
            btnproductStatus.backgroundColor = .clear
            btnRequestProduct.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

            requestProductStatusPopup.isHidden = true
           
            btnRequestProduct.layer.cornerRadius = 20
            btnRequestProduct.layer.borderWidth = 1
            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnRequestProduct.layer.borderColor = red.cgColor
            btnRequestProduct.setTitleColor(.white, for: .normal)
            btnproductStatus.setTitleColor(.black, for: .normal)



            btnproductStatus.layer.cornerRadius = 20
            btnproductStatus.layer.borderWidth = 1
            var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnproductStatus.layer.borderColor = red1.cgColor


        }
        else{
            requestedPopUp.isHidden = true
        }

    }
    
    @IBAction func btnproductStatus(_ sender: Any) {
        if(requestProductStatusPopup.isHidden == true){
           requestProductStatusPopup.isHidden = false
            btnproductStatus.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

            btnRequestProduct.backgroundColor = .clear
            requestedPopUp.isHidden = true
            
            
            btnRequestProduct.layer.cornerRadius = 20
            btnRequestProduct.layer.borderWidth = 1
            var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnRequestProduct.layer.borderColor = red.cgColor
            btnproductStatus.setTitleColor(.white, for: .normal)
            btnRequestProduct.setTitleColor(.black, for: .normal)



            btnproductStatus.layer.cornerRadius = 20
            btnproductStatus.layer.borderWidth = 1
            var red1 = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnproductStatus.layer.borderColor = red1.cgColor



        }
        else{
            requestProductStatusPopup.isHidden = true
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == tableView{

            count = self.bookTitleArray.count
        }
        else if tableView == tableView1{
            count = self.bookTitleArray.count

        }
        else{
            count = 2

        }
        
        return count!

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          var cellToReturn = UITableViewCell()
        if tableView == self.tableView {

         let cell = tableView.dequeueReusableCell(withIdentifier: "ProductStatusCell", for: indexPath) as!ProductStatusCell
        cell.internallbl?.text = bookTitleArray[indexPath.row]
        cell.loremlbl.text = booSubTitlesArray[indexPath.row]
        cell.productImage.image = bookImageArray[indexPath.row]
        cell.customView.backgroundColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)



        if indexPath.row == 0{
            cell.btnaccepted.backgroundColor = UIColor(red: 0/255.0, green: 144/255.0, blue: 81/255.0, alpha: 1.0)
            cell.btnaccepted.setTitle("Accepted", for: .normal)



        }
   else  if indexPath.row == 1{
            cell.btnaccepted.backgroundColor = .systemYellow
            cell.btnaccepted.setTitle("Pending", for: .normal)


        }else{
            cell.btnaccepted.backgroundColor = .systemRed
            cell.btnaccepted.setTitle("Rejected", for: .normal)


        }

            cellToReturn = cell
            
        }
        else if tableView == self.tableView1{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "BooStoreRequestedProductCell", for: indexPath) as!BooStoreRequestedProductCell
                 cell.internallbl?.text = bookTitleArray[indexPath.row]
                 cell.loremlbl.text = booSubTitlesArray[indexPath.row]
                 cell.productImage.image = bookImageArray[indexPath.row]
                 cell.customView.backgroundColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
            cell.btnaccepted.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)




                 if indexPath.row == 0{
                    cell.btnaccepted.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                     cell.btnaccepted.setTitle("View Request", for: .normal)
                    cell.btnaccepted.setTitleColor(UIColor.white, for: .normal)
                    



                 }
            else  if indexPath.row == 1{
                     cell.btnaccepted.backgroundColor = .clear
                     cell.btnaccepted.setTitle("View Request", for: .normal)
                    cell.btnaccepted.setTitleColor(UIColor.black, for: .normal)
                    cell.btnaccepted.layer.cornerRadius = 20
                    cell.btnaccepted.clipsToBounds = true
                    cell.btnaccepted.borderColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                    cell.btnaccepted.borderWidth = 1



                 }else{
                     cell.btnaccepted.backgroundColor = .clear
                     cell.btnaccepted.setTitle("View Request", for: .normal)
                    cell.btnaccepted.setTitleColor(UIColor.black, for: .normal)
                    cell.btnaccepted.layer.cornerRadius = 20
                    cell.btnaccepted.clipsToBounds = true
                    cell.btnaccepted.borderColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                    cell.btnaccepted.borderWidth = 1



                 }

                     cellToReturn = cell

            
        }
        return cellToReturn
    }

    
    @objc func thumbsUpButtonPressed() {
        if(firstRequestPopupView.isHidden == true){
            firstRequestPopupView.isHidden = false
            firstRequestPopupView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            firstRequestPopupView.isHidden = true

        }

    }


}
