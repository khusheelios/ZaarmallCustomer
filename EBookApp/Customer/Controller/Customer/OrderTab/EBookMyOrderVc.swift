//
//  EBookMyOrderVc.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookMyOrderVc: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var bookTitlesArray = ["The Death","The Road","The Book"]
    var bookSubTitlesArray = ["Death","Road","Book"]
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    @IBAction func btnBack(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//        self.present(nextViewController, animated:true, completion:nil)

        self.dismiss(animated: true, completion: nil)
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bookTitlesArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrderCell", for: indexPath) as!MyOrderCell
           //print(nameArray.count)
            


            cell.bookTileslbl?.text = bookTitlesArray[indexPath.row]
            cell.authorNamelbl?.text = bookSubTitlesArray[indexPath.row]

            
            cell.bookImage.image = bookImageArray[indexPath.row]
            
            cell.ratingView.delegate = self
            cell.ratingView.ratingValue = -1
            //btnWriteReviews
            
            cell.btnWriteReviews.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)


            return cell
            //EBookAppOrderStatusVc

        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookAppOrderStatusVc") as! EBookAppOrderStatusVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookReViewsVC") as! EBookReViewsVC
        self.present(nextViewController, animated:true, completion:nil)


        
    }


    

}
extension EBookMyOrderVc: RatingViewDelegate {
    func updateRatingFormatValue(_ value: Int) {
        print("Rating : = ", value)
    }
}
