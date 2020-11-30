
//
//  EBPaymentVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 24/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class EBPaymentVC: UIViewController {

    @IBOutlet weak var lblInvalid: CustomizableView!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblSavingAmount: UILabel!
    @IBOutlet weak var lblFinalAmoint: UILabel!
    @IBOutlet weak var btnAddressType: CustomizableButton!
    @IBOutlet weak var lblAddress: UILabel!
    
   
   var getPaymentType = String()
    var getUserId = String()
     var getAddress = String()
    
    var getTotalAmount = String()
        var getSavingAmount = String()
    var getFinalAmount = String()
     
     var getTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }
        
        if getAddress.isEmpty
                     {
                         getAddress  = UserDefaults.standard.string(forKey: "getFullAddress") ?? "Indore,Vijay nagar"
                       
                       lblAddress.text = getAddress
                     }
        
        if getTitle.isEmpty
            {
                getTitle  = UserDefaults.standard.string(forKey: "getTitle") ?? "Home"
                
                btnAddressType.setTitle(getTitle, for: .normal)
            }
               
        
        self.lblTotalAmount.text = getTotalAmount
        
        self.lblFinalAmoint.text = getFinalAmount
        
        self.lblSavingAmount.text = getSavingAmount
        
        
self.lblInvalid.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func coupanAplyAction(_ sender: Any) {
        self.lblInvalid.isHidden = false
    }
    
    @IBAction func changeAddress(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAddAddressVC") as! EBAddAddressVC
              
              nextViewController.getAddress = "Payment"
                       self.present(nextViewController, animated:true, completion:nil)
    }
    

        func getProductDetailsData(){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   
            
            
                    let parametersBal: Parameters=[
                        "customer_id":getUserId,
                        "address_id":getAddress,
                        "paid_amount":getTotalAmount,
                        "payment_type":getPaymentType,
                        "coupon_code":""
            ]
                    
                    print(parametersBal)

                    // BasUrl.baseURLPOST + "customer_login"
                    //http://zaarmall.com/development/get_my_cart

                    Alamofire.request(BasUrl.baseURLPOST + "get_my_cart", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                let jsonData = result as! NSDictionary

                                                                               
                                               let strMessage = jsonData["message"] as? String
                                               
                                               let strStatus = jsonData["status"] as? Int
                                                

                            
                                                
                                     MBProgressHUD.hide(for: self.view, animated: true)
                                                
                                                if strStatus == 200
                                                {
                                                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                                         
                                                         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc

                                                         self.present(nextViewController, animated:true, completion:nil)
                                                }
                                                else{
                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                }

                                            }
                                            else{
                                                MBProgressHUD.hide(for: self.view, animated: true)
                            }


                    }
                    

            
        }
    
    
    
    @IBAction func placeOrderAction(_ sender: Any)
    {
     getProductDetailsData()
    }
  
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
