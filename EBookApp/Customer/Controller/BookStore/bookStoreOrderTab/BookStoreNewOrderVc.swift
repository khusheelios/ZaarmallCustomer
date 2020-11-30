//
//  BookStoreNewOrderVc.swift
//  EBookApp
//
//  Created by apple on 09/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreNewOrderVc: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var titlesArray = ["The Death","The Book"]
    var subtitlesArray = ["Death","Book"]

    
    var orderIdArray = ["#1234","#1231"]
    var addressArray = ["239/2 hhhhhhhhh","139/2 jjjjjjj"]
    var IteamArray = ["3","5"]
    var amountArray = ["234","139"]
    var dateArray = ["2 jun 2020","3 jun 2020"]
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
         let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreNewOrderCVC", for: indexPath) as!BookStoreNewOrderCVC
        cell.titileslbl?.text = titlesArray[indexPath.row]
        cell.sabtitleslbl.text = subtitlesArray[indexPath.row]
        cell.orderiflbl.text = orderIdArray[indexPath.row]
        
        cell.addresslbl?.text = addressArray[indexPath.row]
        cell.Iteamlbl.text = IteamArray[indexPath.row]
        cell.pricelbl.text = amountArray[indexPath.row]
        
        cell.datelbl.text = dateArray[indexPath.row]

        cell.newOrderImage.image = ImageArray[indexPath.row]


        
        
        
        

         return cell

    }


}
