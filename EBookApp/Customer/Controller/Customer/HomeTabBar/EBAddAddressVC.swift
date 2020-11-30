//
//  EBAddAddressVC.swift
//  ZaarmallApp
//
//  Created by Zanjo iOS Dev on 19/09/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class EBAddAddressVC: UIViewController,UITableViewDataSource,UITableViewDelegate,buttonDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraddresstitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EBAddressTVC
        
        cell.editData = self
                 
            cell.tag = indexPath.row
        
        cell.lblTitle.text = arraddresstitle[indexPath.row]
        cell.lblAddress.text = "\(arrflat[indexPath.row])" + ", \(arrstreet[indexPath.row])" + ", \(arrcity[indexPath.row])" + ", \(arrpincode[indexPath.row])"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  if let firstname = arraddresstitle[indexPath.row] {
    //     getAddress =  arraddresstitle[indexPath.row]
     //    }
        
    //    performSegue(withIdentifier: "unwindFromAddressVc", sender: self)
        
        UserDefaults.standard.set(arrpincode[indexPath.row], forKey: "getPincode")
                      UserDefaults.standard.synchronize()
        
                UserDefaults.standard.set("\(arrstreet[indexPath.row])" + ", \(arrcity[indexPath.row])", forKey: "getAddress")
                UserDefaults.standard.synchronize()
        
            UserDefaults.standard.set(arraddresstitle[indexPath.row], forKey: "getTitle")
            UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set("\(arrflat[indexPath.row])" + ", \(arrstreet[indexPath.row])" + ", \(arrcity[indexPath.row])" + ", \(arrpincode[indexPath.row])", forKey: "getFullAddress")
                   UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(arrname[indexPath.row], forKey: "getName")
                       UserDefaults.standard.synchronize()
          
          
        if getAddress == "Emptycart"
                     {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
                        
                        nextViewController.selectedIndex = 3
                        
                        
                        self.present(nextViewController, animated:false, completion:nil)
        }
           else if getAddress == "Payment"
                                {
                                   let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                   let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBPaymentVC") as! EBPaymentVC
                                   
                               //    nextViewController.selectedIndex = 3
                                   
                                   
                                   self.present(nextViewController, animated:false, completion:nil)
                   }
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            
            
            
            self.present(nextViewController, animated:false, completion:nil)
              }
        
//          postSortOrder = getAddress
//          performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    
    func editAddress(sender: EBAddressTVC) {
        var cel = EBAddressTVC()
                   let cell = sender.tag
                  let buttonPosition = sender.convert(CGPoint.zero, to: tblView)
                    print(buttonPosition)
                    guard let indexPath = self.tblView.indexPathForRow(at: buttonPosition) else {
                        return
                    }
                    print(indexPath.row)
        let currentCell = tblView.cellForRow(at: indexPath) as! EBAddressTVC
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBEditAddressVC") as! EBEditAddressVC
        
        
     //   nextViewController.getHomeOfficeOther = arr
        nextViewController.getName = arrname[indexPath.row]
        nextViewController.getMobileNo = arrmobile[indexPath.row]
        nextViewController.getFlatHouse  = arrflat[indexPath.row]
        nextViewController.getStreetSociety  = arrstreet[indexPath.row]
        nextViewController.getPincode  = arrpincode[indexPath.row]
        nextViewController.getCountry  = arrCountry[indexPath.row]
         nextViewController.getCity  = arrcity[indexPath.row]
          nextViewController.getId  = arraddressid[indexPath.row]
         nextViewController.getHomeOfficeOther  = arraddresstitle[indexPath.row]
        
        nextViewController.chkUpdateOrAdd  = "Update"
     //   nextViewController.getState  = arr[indexPath.row]
        
        
             self.present(nextViewController, animated:true, completion:nil)
        
        
        
    }
    
  
                                                       
                                            var arraddressid = [String]()
                                            var arrcustomerid = [String]()
                                            var arrname = [String]()
                                            var arrmobile = [String]()
                                            var arraddresstitle =  [String]()
                                               var arrflat = [String]()
                                               var arrstreet = [String]()
                                               var arrpincode = [String]()
    var arrcity = [String]()
    var arrdefaultadd = [String]()
    
 var arrCountry = [String]()
    
     var arrCountryId = [String]()
    
     var getAddress:String?
    

    @IBOutlet weak var tblView: UITableView!
    
    var getUserId = String()
      
      

      override func viewDidLoad() {
          super.viewDidLoad()
          
          if getUserId.isEmpty
              {
                  getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
              }
        // Do any additional setup after loading the view.
        
        
       
        
        
        getAddressDetailsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addAddressAction(_ sender: Any)
    {
           let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBEditAddressVC") as! EBEditAddressVC
           
       
           
                self.present(nextViewController, animated:true, completion:nil)
      
        
    }
    
    
    
    
    func getAddressDetailsData(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId
        ]
                
                print(parametersBal)

        
        
                
                Alamofire.request(BasUrl.baseURLPOST + "get_customer_address", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            

                                              MBProgressHUD.hide(for: self.view, animated: true)
                                                                                             
                                     //       timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
                                            
                                            
                                            if strStatus == 200
                                            {
                                                  
                                                for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                {
                                                    
                          
                                                    let address_id = getInstallment["address_id"] as? String
                                                    let customer_id = getInstallment["customer_id"] as? String
                                                    let name = getInstallment["name"] as? String
                                                    let mobile = getInstallment["mobile"] as? String
                                                   let addresstitle = getInstallment["address_title"] as? String
                                                   let flat = getInstallment["flat"] as? String
                                                   let street = getInstallment["street"] as? String
                                                    
                                                    let pincode = getInstallment["pincode"] as? String
                                                    
                                                    let city = getInstallment["city"] as? String
                                                    let default_add = getInstallment["default_add"] as? String
                                                  let country_name = getInstallment["country_name"] as? String
                                                    
                                                    self.arraddressid.append(address_id ?? "")
                                                    self.arrcustomerid.append(customer_id ?? "")
                                                    self.arrname.append(name ?? "")
                                                    self.arrmobile.append(mobile ?? "")
                                                    self.arraddresstitle.append(addresstitle ?? "")
                                                    self.arrflat.append(flat ?? "")
                                                    self.arrstreet.append(street ?? "")
                                                    self.arrpincode.append(pincode ?? "")
                                                    self.arrcity.append(city ?? "")
                                                    self.arrCountry.append(country_name ?? "")
                                                    
                                                
                                                    
                                                }
                                                
                                                
                                               
                                                
                                                self.tblView.reloadData()
                                                
                                                


                                                


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
    
  
    
   
}
