//
//  EBEditAddressVC.swift
//  ZaarmallApp
//
//  Created by Zanjo iOS Dev on 19/09/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class EBEditAddressVC: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = arrCountry[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    print(arrCountryId[indexPath.row],arrCountry[indexPath.row])
        
      //  getStateDetailsData(getId: arrCountryId[indexPath.row])
        
        if self.getStateId.isEmpty {
          
            self.getStateId = ""
            
                   self.getStateId = arrCountryId[indexPath.row]
                   
        
        
                   self.txtState.text = arrCountry[indexPath.row]
                   
        }
        else{

            self.txtCity.text = arrCountry[indexPath.row]
        }
        
         self.viewBackground.isHidden = true
       
    }
    
    @IBAction func searchAction(_ sender: Any)
    {
        
//        if txtSearch.text != nil{
//
//
//                      MBProgressHUD.showAdded(to: self.view, animated: true)
//
//
//                              let parametersBal: Parameters=[
//                                  "id":getId,
//                                  "customer_id":getUserId,
//                                  "address":txtFlatHouse.text ?? ""
//                      ]
//
//                              print(parametersBal)
//
//
//                              Alamofire.request(BasUrl.baseURLPOST + "get_country", method: .get, parameters: nil).responseJSON
//                                  {
//                                                      response in
//
//                                                      print(response)
//
//                                                      //getting the json value from the server
//                                                      if let result = response.result.value {
//
//
//                                                          let jsonData = result as! NSDictionary
//
//
//                                                         let strMessage = jsonData["message"] as? String
//
//                                                         let strStatus = jsonData["status"] as? Int
//
//
//                                                          self.arrCountry.removeAll()
//                                                                                                     self.arrCountryId.removeAll()
//                                                                                                     self.arrState.removeAll()
//
//                                                          if strStatus == 200
//                                                          {
//
//                                                            for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
//                                                            {
//                                                                let strName = getInstallment["name"] as? String
//
//                                                                self.arrCountry.append(strName ?? "")
//
//                                                                let strId = getInstallment["id"] as? String
//
//                                                        self.arrCountryId.append(strId ?? "")
//
//                                                            }
//
//
//
//                                                            DispatchQueue.main.async {
//                                                                self.tblView.reloadData()
//                                                            }
//
//
//
//
//                                                          }
//                                                          else{
//
//                                                              self.displayMyAlertMessage(userMessage: "Field must be required.")
//                                                              MBProgressHUD.hide(for: self.view, animated: true)
//
//
//                                                          }
//
//                                                      }
//                                      else{
//
//                                                                                      self.displayMyAlertMessage(userMessage: "something went wrong.")
//                                                                                      MBProgressHUD.hide(for: self.view, animated: true)
//
//
//                                                                                  }
//
//
//                              }
//
//
//        }
//        else{
//            self.getCountryDetailsData()
//        }
          
            
        }
    
    @IBOutlet weak var viewBackground: UIView!
    
    var arrCountry = [String]()
    var arrState = [String]()
    var arrCountryId = [String]()
    
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnOffice: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var txtSearch: CustomizableTextfield!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobNo: UITextField!
    @IBOutlet weak var txtFlatHouse: UITextField!
    @IBOutlet weak var txtStreetSociety: UITextField!
    @IBOutlet weak var txtPincode: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtState: UITextField!
    
       @IBOutlet weak var txtCity: UITextField!
    
    var getHomeOfficeOther : String = "Home"
    var getName : String = ""
    var getMobileNo : String = ""
    var getFlatHouse : String = ""
    var getStreetSociety : String = ""
    var getPincode : String = ""
    var getCountry : String = ""
    var getState : String = ""
    
     var getId : String = ""
     var getCity : String = ""
    
    var chkUpdateOrAdd : String = ""
    
      var getUserId = String()
    
    var getStateId : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewBackground.isHidden = true
        
        if getUserId.isEmpty
            {
                getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
            }
        

        
        if chkUpdateOrAdd == "Update"
        {
            self.txtName.text = getName
                         self.txtMobNo.text = getMobileNo
                         self.txtFlatHouse.text = getFlatHouse
                         self.txtStreetSociety.text = getStreetSociety
                         self.txtPincode.text = getPincode
                         self.txtCountry.text = getCountry
                       self.txtCity.text = getCity
            
            self.txtState.text = getState
                               
            if getHomeOfficeOther == "Home"{
                   homeAction(self)
            }
            else if getHomeOfficeOther == "Office"{
                   officeAction(self)
            }
            else{
                otherAction(self)
            }
         
            
        }
        else{
          
            getHomeOfficeOther = "Home"

        }
        
        
        getCountryDetailsData()
        
//        txtState.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
//
//
//        txtCity.addTarget(self, action: #selector(myTargetFunction2), for: .touchDown)
     
        
     //   let recognizer = UITapGestureRecognizer(target: self, action: #selector(EBEditAddressVC.didTap))
      //           viewBackground.addGestureRecognizer(recognizer)
        
     //   get_state
        
       //   self.tx.text = getName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func StateAction(_ sender: Any) {
         self.viewBackground.isHidden = false
    }
    
    @IBAction func cityActiob(_ sender: Any) {
             self.viewBackground.isHidden = false
           getStateDetailsData(getId: getStateId)
    }
    
    
    @objc func didTap() {
  self.viewBackground.isHidden = true
       
    }
    
    @objc func myTargetFunction3(textField: UITextField) {
           print("myTargetFunction")
        
        self.viewBackground.isHidden = false
       }
    
    @objc func myTargetFunction(textField: UITextField) {
           print("myTargetFunction")
        
        self.viewBackground.isHidden = false
       }
    
    @objc func myTargetFunction2(textField: UITextField) {
             print("myTargetFunction")
        
        self.viewBackground.isHidden = false
        getStateDetailsData(getId: getStateId)
        
         }
    
    func getStateDetailsData(getId:String){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   
            
                    let parametersBal: Parameters=[
                        "state_id":self.getStateId
                      
            ]
              
                    print(parametersBal)

            
                    Alamofire.request(BasUrl.baseURLPOST + "get_city", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                let jsonData = result as! NSDictionary

                                                                               
                                                _ = jsonData["message"] as? String
                                               
                                               let strStatus = jsonData["status"] as? Int
                                                

                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                 
                                                self.arrCountry.removeAll()
                                                self.arrCountryId.removeAll()
                                                self.arrState.removeAll()
                                                
                                                
                                                if strStatus == 200
                                                {
                                                     
                                                    for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                    {
                                                        let strName = getInstallment["name"] as? String
                                                        
                                                        self.arrCountry.append(strName ?? "")
                                                  
                                                    }
                                                    

                                                    
                                                   DispatchQueue.main.async {
                                                       self.tblView.reloadData()
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                  //  self.displayMyAlertMessage(userMessage: "Field must be required.")
                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                   
                                                    
                                                }

                                            }
                            else{
                                                                            
                                                                    //        self.displayMyAlertMessage(userMessage: "something went wrong.")
                                                                            MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                                           
                                                                            
                                                                        }


                    }
                    

            
        }
    
    
        func getCountryDetailsData(){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   
            
                    let parametersBal: Parameters=[
                        "country_id":"101"
            ]
              
                    print(parametersBal)

            
                    Alamofire.request(BasUrl.baseURLPOST + "get_state", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                let jsonData = result as! NSDictionary

                                                                               
                                               let strMessage = jsonData["message"] as? String
                                               
                                               let strStatus = jsonData["status"] as? Int
                                                

                                                self.arrCountry.removeAll()
                                                                                             self.arrCountryId.removeAll()
                                                                                             self.arrState.removeAll()
                                                
                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                     
                                                
                                                if strStatus == 200
                                                {
                                                     
                                                    for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                    {
                                                        let strName = getInstallment["name"] as? String
                                                        
                                                        self.arrCountry.append(strName ?? "")
                                                        
                                                        
                                                        let strId = getInstallment["id"] as? String
                                                        
                                                        
                                                        print(strId)
                                                        
                                                        self.arrCountryId.append(strId ?? "")
                                                 
                                                    
                                                    }
                                                    

                                                    
                                                   DispatchQueue.main.async {
                                                       self.tblView.reloadData()
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                    self.displayMyAlertMessage(userMessage: "Field must be required.")
                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                   
                                                    
                                                }

                                            }
                            else{
                                                                            
                                                                            self.displayMyAlertMessage(userMessage: "something went wrong.")
                                                                            MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                                           
                                                                            
                                                                        }


                    }
                    

            
        }
    

        func updateAddressDetailsData(){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   
            
                    let parametersBal: Parameters=[
                        "id":getId,
                        "customer_id":getUserId,
                        "address":txtFlatHouse.text ?? ""
            ]
              
                    print(parametersBal)

            
                    Alamofire.request(BasUrl.baseURLPOST + "update_customer_address", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                let jsonData = result as! NSDictionary

                                                                               
                                               let strMessage = jsonData["message"] as? String
                                               
                                               let strStatus = jsonData["status"] as? Int
                                                


                                                
                                                if strStatus == 200
                                                {
                                                       MBProgressHUD.hide(for: self.view, animated: true)
                                                    
                                                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                                                                         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAddAddressVC") as! EBAddAddressVC
                                                                                                    
                                                                                                
                                                                                                    
                                                                                                         self.present(nextViewController, animated:true, completion:nil)
                                                    
    //                                                for case let getInstallment in ((jsonData["getProductsData"] as? [AnyObject]))!
    //                                                {
    //
    //                                                }
                                                    

                                                    
    //                                               DispatchQueue.main.async {
    //                                                   self.collectionView1.reloadData()
    //                                               }

                                                    


                                                }
                                                else{
                                                    
                                                    self.displayMyAlertMessage(userMessage: "Field must be required.")
                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                   
                                                    
                                                }

                                            }
                            else{
                                                                            
                                                                            self.displayMyAlertMessage(userMessage: "something went wrong.")
                                                                            MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                                           
                                                                            
                                                                        }


                    }
                    

            
        }
    
    
    
    
    func getProductDetailsData(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId,
                    "name":txtName.text ?? "",
                    "address_title":getHomeOfficeOther,
                    "mobile":txtMobNo.text ?? "",
                    "flat":txtFlatHouse.text ?? "",
                    "street":txtStreetSociety.text ?? "",
                    "pincode":txtPincode.text ?? "",
                    "country":txtCountry.text ?? "",
                    "state":txtState.text ?? "",
                    "city":txtCity.text ?? ""
        ]
        

                
                print(parametersBal)

                
                Alamofire.request(BasUrl.baseURLPOST + "add_customer_address", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            


                                            
                                            if strStatus == 200
                                            {
                                                   MBProgressHUD.hide(for: self.view, animated: true)
                                                
                                               let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                                         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAddAddressVC") as! EBAddAddressVC
                                                    
                                                
                                                    
                                                         self.present(nextViewController, animated:true, completion:nil)
                                                
//                                                for case let getInstallment in ((jsonData["getProductsData"] as? [AnyObject]))!
//                                                {
//
//                                                }
                                                

                                                
//                                               DispatchQueue.main.async {
//                                                   self.collectionView1.reloadData()
//                                               }

                                                


                                            }
                                            else{
                                                
                                                self.displayMyAlertMessage(userMessage: "Field must be required.")
                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                               
                                                
                                            }

                                        }
                        else{
                                                                    
                                                                 //   self.displayMyAlertMessage(userMessage: "Field must be required.")
                                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                                   
                                                                    
                                                                }


                }
                

        
    }
    
    
    func displayMyAlertMessage(userMessage:String)
         {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
             let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
             let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
             myAlert.addAction(okAction);
             myAlert.addAction(cancelAction);
             self.present(myAlert, animated: true,completion:nil);
             
             
         }
    
    
    @IBAction func homeAction(_ sender: Any) {
        
        self.btnOffice.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.btnOther.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.btnHome.backgroundColor = #colorLiteral(red: 0.1100466922, green: 0.539958477, blue: 0.7510432005, alpha: 1)
        
        self.btnOffice.layer.borderWidth = 2
              self.btnOffice.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
              self.btnOther.layer.borderWidth = 2
              self.btnOther.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        
        self.btnOffice.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                    self.btnOther.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                    
        self.btnHome.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        getHomeOfficeOther = "Home"
    }
    
    @IBAction func officeAction(_ sender: Any) {
        self.btnHome.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
             self.btnOther.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.btnOffice.backgroundColor = #colorLiteral(red: 0.1100466922, green: 0.539958477, blue: 0.7510432005, alpha: 1)
        
        self.btnHome.layer.borderWidth = 2
              self.btnHome.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
              self.btnOther.layer.borderWidth = 2
              self.btnOther.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        
        self.btnHome.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
              self.btnOther.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.btnOffice.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        getHomeOfficeOther = "Office"
    }
    
    @IBAction func otherAction(_ sender: Any) {
    self.btnHome.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.btnOffice.backgroundColor = #colorLiteral(red: 0.2306025326, green: 0.2306025326, blue: 0.2306025326, alpha: 0.166015625)
        self.btnOther.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        
        self.btnHome.layer.borderWidth = 2
        self.btnHome.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        self.btnOffice.layer.borderWidth = 2
        self.btnOffice.layer.borderColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        
        self.btnHome.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.btnOffice.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.btnOther.setTitleColor(#colorLiteral(red: 0.8164212108, green: 0.8914373517, blue: 0.9526236653, alpha: 1), for: .normal)
        
        getHomeOfficeOther = "Other"
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveAction(_ sender: Any)
    {
               
         if chkUpdateOrAdd == "Update"
         {
 
                        updateAddressDetailsData()
         }
         else{
            getProductDetailsData()

         }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
