//
//  BookStoreCompleteOrderVc.swift
//  EBookApp
//
//  Created by apple on 09/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
//BookStoreCompeleteOrderCVC


class BookStoreCompleteOrderVc: UIViewController,UITableViewDelegate,UITableViewDataSource {

        @IBOutlet weak var tableView: UITableView!
        
        var titlesArray = ["The Death","The Book"]
        var subtitlesArray = ["Death","Book"]

        
        var orderIdArray = ["#1234","#1231"]
        var CompelteArray = ["Completed","Completed"]
        var ImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),]

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

            //BookStoreNewOrderCVC

            // Do any additional setup after loading the view.
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return titlesArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreCompeleteOrderCVC", for: indexPath) as!BookStoreCompeleteOrderCVC
            cell.titileslbl?.text = titlesArray[indexPath.row]
            cell.sabtitleslbl.text = subtitlesArray[indexPath.row]
            cell.orderiflbl.text = orderIdArray[indexPath.row]
            
            cell.Compeletelbl?.text = CompelteArray[indexPath.row]

            cell.CompelteOrderImage.image = ImageArray[indexPath.row]


            
            
            
            

             return cell

        }


    }
