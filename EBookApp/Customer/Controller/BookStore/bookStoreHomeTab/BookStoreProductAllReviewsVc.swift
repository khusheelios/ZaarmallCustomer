//
//  BookStoreProductAllReviewsVc.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreProductAllReviewsVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
        var NameArray = ["Deepak","Jittu","Annu","Ojas"]
        var dayArray = ["1","2","3","4"]
    var ratingArray = ["1.1","2.1","3.1","4.1"]

    var descriptionArray = ["Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]




    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none


    }
    @IBAction func btnBack(_ sender: Any) {
        //EBookProductDetailsVc
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreProductDetailsVc") as! BookStoreProductDetailsVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return NameArray.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                

                let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreProductAllReviewsTVC", for: indexPath) as!BookStoreProductAllReviewsTVC
                
                    


                
                cell.namelbl.text = NameArray[indexPath.row]
                cell.daylbl.text = dayArray[indexPath.row]
                cell.ratinglbl.text = ratingArray[indexPath.row]

                cell.descrptionlbl.text = descriptionArray[indexPath.row]


                    

                
                
                
                

                return cell
    
    }



}

