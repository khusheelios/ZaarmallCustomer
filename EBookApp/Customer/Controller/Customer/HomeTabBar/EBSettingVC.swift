//
//  EBSettingVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 01/10/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

class EBSettingVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EBSettingTVC
        
        if indexPath.row == 0{
            cell.btnSwitch.isHidden = true
            cell.imgRightClosure.isHidden = false
            cell.lblTitle.text = arrTitle[indexPath.row]
        }
        else if indexPath.row == 1{
            cell.btnSwitch.isHidden = true
            cell.imgRightClosure.isHidden = false
            cell.lblTitle.text = arrTitle[indexPath.row]
        }
        if indexPath.row == 2{
            cell.btnSwitch.isHidden = false
            cell.imgRightClosure.isHidden = true
            cell.lblTitle.text = arrTitle[indexPath.row]
        }
        else{
            cell.btnSwitch.isHidden = true
            cell.imgRightClosure.isHidden = true
            cell.lblTitle.text = arrTitle[indexPath.row]
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBReviewWriterVC") as! EBReviewWriterVC
            
            self.present(nextViewController, animated:false, completion:nil)
        }
        else if indexPath.row == 3{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
            
            self.present(nextViewController, animated:false, completion:nil)
        }
    }
    
    
    
    
    var arrTitle = ["Account Setting","Become Review Writer","Notification Setting","Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    


}
