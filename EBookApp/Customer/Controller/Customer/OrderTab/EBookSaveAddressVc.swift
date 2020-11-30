//
//  EBookSaveAddressVc.swift
//  EBookApp
//
//  Created by apple on 25/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookSaveAddressVc: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var HomeArray = ["Home","Work","Other"]
    var addressArray = ["101 indore","102 Bhopal","303 Khategaon"]
    var homeImageArray = [UIImage (named:"home-1"),UIImage(named:"work"),UIImage(named:"other")]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
          
    
    @IBAction func btnBack(_ sender: Any) {
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return HomeArray.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "SaveAddressCVC", for: indexPath) as!SaveAddressCVC

            cell.Homelbl.text = HomeArray[indexPath.row]
            cell.addresslbl.text = addressArray[indexPath.row]



              
              cell.HomeImage.image = homeImageArray[indexPath.row]

              

              return cell

          }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SaveAddressCVC", for: indexPath) as!SaveAddressCVC
//        cell.headerView.borderColor = .systemOrange
//
//
//    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SaveAddressCVC", for: indexPath) as!SaveAddressCVC
//        cell.headerView.borderColor = .white
//
//
//    }


}
