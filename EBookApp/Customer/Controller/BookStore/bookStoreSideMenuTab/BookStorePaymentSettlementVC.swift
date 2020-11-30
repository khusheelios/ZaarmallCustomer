//
//  BookStorePaymentSettlementVC.swift
//  EBookApp
//
//  Created by apple on 07/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStorePaymentSettlementVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var dueAmountlbl: UILabel!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkbox1: UIButton!
    @IBOutlet weak var SalePopupView: CustomizableView!
    
    @IBOutlet weak var recivedPopupView: CustomizableView!
    @IBOutlet weak var duePaymentPopup: CustomizableView!
    @IBOutlet weak var btnDue: CustomizableButton!
    @IBOutlet weak var btnRecived: CustomizableButton!
    @IBOutlet weak var btnSale: CustomizableButton!
    
    
    var transationIdArray = ["#1234","#1231","#1235","#1237","#1238","#1239"]
    var amountArray = ["234","121","123","237","138","129"]
    var dateArray = ["2 jun 2020","3 jun 2020","6 jun 2020","8 jun 2020","21 jun 2020","22 jun 2020"]

    var transationIdArray1 = ["#1234","#1231","#1235","#1237","#1238","#1239"]
    var amountArray1 = ["234","121","123","237","138","129"]
    var dateArray1 = ["2 jun 2020","3 jun 2020","6 jun 2020","8 jun 2020","21 jun 2020","22 jun 2020"]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView1.separatorStyle = UITableViewCell.SeparatorStyle.none




        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnAcceptAmount(_ sender: Any) {
        
         let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreHomeVc") as! BookStoreHomeVc
        // nextViewController.strCategoryName1 = strCategoryName
         self.present(nextViewController, animated:true, completion:nil)


    }
    
//    @IBAction func btncheckBox(_ sender: Any) {
//        if (checkbox1.isSelected == true)
//        {
//            checkbox1.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)
//
//                checkbox1.isSelected = false;
//        }
//        else
//        {
//            checkbox1.setBackgroundImage(UIImage(named: "checkbox-2"), for: UIControl.State.normal)
//
//            checkbox1.isSelected = true;
//        }
//
//    }
    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnDue(_ sender: Any) {
        if(duePaymentPopup.isHidden == true){
            duePaymentPopup.isHidden = false
            btnDue.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnRecived.backgroundColor = UIColor.clear
            recivedPopupView.isHidden = true
            
            btnRecived.layer.cornerRadius = 20
            btnRecived.layer.borderWidth = 1
            var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnRecived.layer.borderColor = red.cgColor
            btnDue.setTitleColor(.white, for: .normal)
            btnRecived.setTitleColor(.black, for: .normal)



            btnDue.layer.cornerRadius = 20
            btnDue.layer.borderWidth = 1
            var red1 = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnDue.layer.borderColor = red1.cgColor





        }
        else{
            duePaymentPopup.isHidden = true
            
//            btnDue.backgroundColor = UIColor.clear
//            btnRecived.backgroundColor = UIColor.systemOrange
//            btnSale.backgroundColor = UIColor.systemOrange
//

        }

    }
    
    @IBAction func btnRecivedAmount(_ sender: Any) {
        if(recivedPopupView.isHidden == true){
            recivedPopupView.isHidden = false
            btnRecived.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnDue.backgroundColor = UIColor.clear
            btnRecived.setTitleColor(.white, for: .normal)
            btnDue.setTitleColor(.black, for: .normal)

            
           duePaymentPopup.isHidden = true
            btnRecived.layer.cornerRadius = 20
            btnRecived.layer.borderWidth = 1
            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnRecived.layer.borderColor = red.cgColor


            btnDue.layer.cornerRadius = 20
            btnDue.layer.borderWidth = 1
            var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnDue.layer.borderColor = red1.cgColor



        }
        else{
            recivedPopupView.isHidden = true
//            btnRecived.backgroundColor = UIColor.clear
//            btnSale.backgroundColor = UIColor.systemOrange
//            btnDue.backgroundColor = UIColor.systemOrange



        }


        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        if tableView == tableView{
            count = self.transationIdArray.count
        }else if tableView == tableView1{
            count = self.transationIdArray1.count

        }
        else{
            count = 2
        }

        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          var cellToReturn = UITableViewCell()
        if tableView == self.tableView {

         let cell = tableView.dequeueReusableCell(withIdentifier: "SettlementCell", for: indexPath) as!SettlementCell
        cell.transacstionidlbl?.text = transationIdArray[indexPath.row]
        cell.amountlbl.text = amountArray[indexPath.row]
        cell.datelbl.text = dateArray[indexPath.row]
        //var red = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)

        cell.customView.backgroundColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)

            cellToReturn = cell
        }
        else if tableView == self.tableView1 {

         let cell = tableView.dequeueReusableCell(withIdentifier: "DuePaymentSettlementTVC", for: indexPath) as!DuePaymentSettlementTVC
        cell.transacstionidlbl?.text = transationIdArray1[indexPath.row]
        cell.amountlbl.text = amountArray1[indexPath.row]
        cell.datelbl.text = dateArray1[indexPath.row]
        //var red = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)

        cell.customView.backgroundColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
            
            
           cell.btnCheckBox.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)


            cellToReturn = cell
        }
        
   return cellToReturn

    }
    
    
    @objc func checkBoxSelection(_ sender:UIButton)
    {
        
                if (sender.isSelected == true)
                {
                    sender.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)

                        sender.isSelected = false;
                }
                else
                {
                    sender.setBackgroundImage(UIImage(named: "checkbox-2"), for: UIControl.State.normal)

                    sender.isSelected = true;
                }


        

    self.tableView1.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DuePaymentSettlementTVC", for: indexPath) as!DuePaymentSettlementTVC
//
////        cell.btnCheckBox.isSelected = true
//
//
//        cell.btnCheckBox.setBackgroundImage(UIImage(named: "checkbox"), for: UIControl.State.normal)


        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "DuePaymentSettlementTVC", for: indexPath) as!DuePaymentSettlementTVC
//
//       // cell.btnCheckBox.isSelected = false
//
//        cell.btnCheckBox.setBackgroundImage(UIImage(named: "checkbox-2"), for: UIControl.State.normal)



    }

}
