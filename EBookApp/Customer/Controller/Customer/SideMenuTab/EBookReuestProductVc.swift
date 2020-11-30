//
//  EBookReuestProductVc.swift
//  EBookApp
//
//  Created by apple on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookReuestProductVc: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var totalNumberOffProduct: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var bookTitlesArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    var bookdecriptsionArray = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]



    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bookTitlesArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RequestProductCell", for: indexPath) as!RequestProductCell
           //print(nameArray.count)
            


            cell.bookTileslbl?.text = bookTitlesArray[indexPath.row]
            cell.authorNamelbl?.text = bookSubTitlesArray[indexPath.row]

            
            cell.bookImage.image = bookImageArray[indexPath.row]
            
            cell.bntView.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
            cell.textlbl.text = bookdecriptsionArray[indexPath.row]



            
            

            return cell

        }

    
    @objc func buttonSelected(sender: UIButton){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookReuestProductOfferVc") as! EBookReuestProductOfferVc
        self.present(nextViewController, animated:true, completion:nil)

    }


    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    

}
