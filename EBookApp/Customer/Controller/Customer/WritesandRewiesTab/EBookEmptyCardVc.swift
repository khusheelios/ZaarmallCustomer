//
//  EBookEmptyCardVc.swift
//  EBookApp
//
//  Created by apple on 04/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class EBookEmptyCardVc: UIViewController ,UITableViewDataSource,UITableViewDelegate,buttonDelegate2 {
    func AddCartItem(sender: CustomerCartTVC) {
          var cel = CustomerCartTVC()
                   let cell = sender.tag
                  let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
                    print(buttonPosition)
                    guard let indexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
                        return
                    }
                    print(indexPath.row)
        let currentCell = tableView.cellForRow(at: indexPath) as! CustomerCartTVC
              
     
        
    
        if count >= 0 {
          
               count += 1
            
            currentCell.lblCartValue.text = "\(count)"
            
              self.getAddAndRemoveToCartProductDetailsData(getProductID: arrproduct_id[indexPath.row], getCustomId: arrCustomId[indexPath.row], getQuantity: "\(count)", getType: "Add")
        }
        else{
            
        }
        
    }
    
    @IBOutlet weak var btnExpress: CustomizableButton!
    @IBOutlet weak var btnNormal: CustomizableButton!
    
  
    
    func MinusCartItem(sender: CustomerCartTVC) {
                  var cel = CustomerCartTVC()
                 let cell = sender.tag
                let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
                  print(buttonPosition)
                  guard let indexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
                      return
                  }
                  print(indexPath.row)
        let currentCell = tableView.cellForRow(at: indexPath) as! CustomerCartTVC
        
       
        
        
        if count > 1 {
          count -= 1
                
            currentCell.lblCartValue.text = "\(count)"
            
            self.getAddAndRemoveToCartProductDetailsData(getProductID: arrproduct_id[indexPath.row], getCustomId: arrCustomId[indexPath.row], getQuantity: "\(count)", getType: "Remove")
        }
        else{
            
        }
        
    }
    
    func removeFromCart(sender: CustomerCartTVC) {
                  var cel = CustomerCartTVC()
                 let cell = sender.tag
                let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
                  print(buttonPosition)
                    guard let indexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
                                  return
                              }
                  print(indexPath.row)
        let currentCell = tableView.cellForRow(at: indexPath) as! CustomerCartTVC
        
    //    getRemoveFromCartData()
        
        self.getAddAndRemoveToCartProductDetailsData(getProductID: arrproduct_id[indexPath.row], getCustomId: arrCustomId[indexPath.row], getQuantity: "0", getType: "Remove")
    }
    
    

        func getRemoveFromCartData(){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
                   

            
                    let parametersBal: Parameters=[
                        "customer_id":getUserId
                      
            ]
                    
                    print(parametersBal)

                    //                // BasUrl.baseURLPOST + "customer_login"
                    //http://zaarmall.com/development/all_remove_from_cart

                    Alamofire.request(BasUrl.baseURLPOST + "all_remove_from_cart", method: .post, parameters: parametersBal).responseJSON
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

                                                    MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                   
//                                                   DispatchQueue.main.async {
//                                                       self.tableView.reloadData()
//                                                   }
                                                    
                                                    self.getProductDetailsData()

                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        }
    
    var getNormalExpress = String()
    
    
     var strTotalAmount = String()
     var strSavingAmount = String()
     var strFinalAmount = String()
    
    @IBAction func NormalAction(_ sender: CustomizableButton)
    {
        self.btnNormal.setImage(#imageLiteral(resourceName: "dot-7"), for: .normal)
        self.btnExpress.setImage(#imageLiteral(resourceName: "circle-2"), for: .normal)
        self.btnExpress.tintColor = UIColor.black
        self.getNormalExpress = "Normal"
    }
    
    @IBAction func expressAction(_ sender: Any)
    {
        self.btnNormal.setImage(#imageLiteral(resourceName: "circle-2"), for: .normal)
        self.btnExpress.setImage(#imageLiteral(resourceName: "dot-7"), for: .normal)
        self.btnNormal.tintColor = UIColor.black
        self.getNormalExpress = "Express"
    }
    
    
    

        func getAddAndRemoveToCartProductDetailsData(getProductID:String,getCustomId:String,getQuantity:String,getType:String){
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
               
            
                    let parametersBal: Parameters=[
                      "product_id":getProductID,
                      "customer_id":getUserId,
                        "custom_id":getCustomId,
                        "quantity":getQuantity,
                        "type":getType
            ]
                    

            
                    print(parametersBal)

                    //                // BasUrl.baseURLPOST + "customer_login"
                      //http://zaarmall.com/development/add_to_cart

                    Alamofire.request(BasUrl.baseURLPOST + "add_to_cart", method: .post, parameters: parametersBal).responseJSON
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
                                                   
                                                    
                                                    
                                                    DispatchQueue.main.async {
                                                      
                                                        self.getProductDetailsData()
                                                        //self.tableView.reloadData()
                                                                                                    }
            


                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        }
    
    func addToFavourites(sender: CustomerCartTVC) {
                  var cel = CustomerCartTVC()
                 let cell = sender.tag
                let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
                  print(buttonPosition)
                  guard let indexPath = self.tableView.indexPathForRow(at: buttonPosition) else {
                      return
                  }
                  print(indexPath.row)
        let currentCell = tableView.cellForRow(at: indexPath) as! CustomerCartTVC
        
        
        getMOVETOFAVOURITES(getProductID: arrproduct_id[indexPath.row], getProductIdType: arrProductTypeId[indexPath.row], getCategoryId: arrcategory_id[indexPath.row])

      //  add_to_favourite
//        customer_id:1
//        product_id:2
//        product_type_id:2
//        category_id:1
        
        
        
        
    }
    
    
    
    func getMOVETOFAVOURITES(getProductID:String,getProductIdType:String,getCategoryId:String){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
//        self.arrId.removeAll()
//        self.arrproduct_id.removeAll()
//        self.arrquantity.removeAll()
//        self.arrproduct_name.removeAll()
//        self.arrselling_price.removeAll()
//        self.arroriginal_price.removeAll()
//        self.arrtotal_discount.removeAll()
//        self.arrstock_quantity.removeAll()
//        self.arrcategory_id.removeAll()
//        self.arrdiscounted_amount.removeAll()
//
//
//        self.arrseller_name.removeAll()
//       self.arrservice_charge.removeAll()
//        self.arrdelivery_expected_time.removeAll()
//       self.arrdelivery_charge.removeAll()
                                                    
  
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId,
                    "product_id":getProductID,
                    "product_type_id":getProductIdType,
                    "category_id":getCategoryId
        ]
                
                print(parametersBal)

                //                // BasUrl.baseURLPOST + "customer_login"
        //http://zaarmall.com/development/add_to_favourite

                Alamofire.request(BasUrl.baseURLPOST + "add_to_favourite", method: .post, parameters: parametersBal).responseJSON
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

                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                               
                                               DispatchQueue.main.async {
                                                       self.getProductDetailsData()
                                               }

                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
      var count : Int = 1
  
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var EBookCustomerAddCarrtVc: UILabel!
    
    @IBOutlet weak var ViewCart: UIView!
    
    @IBOutlet weak var lblAddressName: UILabel!
    @IBOutlet weak var lblAddressNumber: UILabel!
    @IBOutlet weak var btnChange: CustomizableButton!
    
    @IBOutlet weak var btnHomeOffice: CustomizableButton!
    @IBOutlet weak var lblFullAddress: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDeliveryFee: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var lblTotalPaidAmount: UILabel!
    
    @IBOutlet weak var heightVariable: NSLayoutConstraint!
    
    @IBOutlet weak var viewCheckout: UIView!
    
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var contactlbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
//    var sizeArray = ["M","L","XL","Full","XL"]
//    var sellerNameArray = ["Monu","Rao","Annu","Annu","Rao"]
//    var AmountArray1 = ["150","250","350","450","650"]
//
//    var AmountArray2 = ["150","250","350","450","650"]
//
//        var AmountArray3 = ["15","25","35","45","65"]
// var AmountArray4 = ["150","250","350","450","650"]
//
//    var AmountArray5 = ["15","25","35","45","65"]
//
//    var offerArray = ["1","2","3","4","6"]
//
//    var dayArray = ["1-2","1-2","1-2","1-2","1-2"]
//    var AmountArray6 = ["15","25","35","45","65"]
//
//
//    var QUTArray = ["1","2","3","4","5"]
//
//    var productImageArray = [UIImage (named:"01-4"),UIImage(named:"02-1"),UIImage(named:"03-1"),UIImage(named:"04-1"),UIImage(named:"05")]

    
    var counter = 0
       var timer = Timer()

    
    
    var seconds = 4 //This variable will hold a starting value of seconds. It could be any amount above 0.
  
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    

      var arrproduct_id = [String]()
      var arrStoreId = [String]()
      var arrcategory_id = [String]()
      var arrchild_category_id = [String]()
      var arrproduct_name = [String]()
      var arrbrand = [String]()
      var arrdescription = [String]()
      var arrselling_price = [String]()
      var arroriginal_price = [String]()
      var arrtotal_discount = [String]()
     
      var arrstock_quantity = [String]()
      var arrstore_name = [String]()
      var arrcategory_name = [String]()
      
      var arrsub_category_name = [String]()
         var arrimage = [String]()
        
      var arrrating = [String]()
    
    
      var arrCustomId = [String]()
    
      
     var arrProductTypeId = [String]()
    
    var arrdiscounted_amount = [String]()
        var arrseller_name = [String]()
        var arrservice_charge = [String]()
        
        var arrdelivery_expected_time = [String]()
           var arrdelivery_charge = [String]()
          
          var arrquantity = [String]()
        var arrId = [String]()
    
    var arrColor = [String]()
         var arrSize = [String]()
     
          var getCategory_Id = String()
          var getCustomer_Id = String()
           var getSub_Category_Id = String()
          var getChild_Category_Id = String()
          var getStore_Id = String()

    @IBOutlet weak var btnBack: UIButton!
    var eBookTabbarVc:EBookTabbarVc!
  
    
        var getUserId = String()
       var getAddress = String()
       var getPincode = String()
       var getTitle = String()
    
          override func viewDidLoad() {
              super.viewDidLoad()
              
             // self.configViews()
           getAddressDetailsData()
           
           if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }
           
           if getAddress.isEmpty
                 {
                     getAddress  = UserDefaults.standard.string(forKey: "getFullAddress") ?? "Indore,Vijay nagar"
                   
                   lblFullAddress.text = getAddress
                 }
           
           if getPincode.isEmpty
                 {
                     getPincode  = UserDefaults.standard.string(forKey: "getPincode") ?? "1"
                 }
        if getTitle.isEmpty
        {
            getTitle  = UserDefaults.standard.string(forKey: "getTitle") ?? "Home"
            
            btnHomeOffice.setTitle(getTitle, for: .normal)
        }
            
        
        hidesBottomBarWhenPushed = false
        
        
        tableView.delegate = self
          tableView.dataSource = self
          tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
          
          self.tableView.estimatedRowHeight = self.tableView.rowHeight
               self.tableView.rowHeight = UITableView.automaticDimension
          
          
         

    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
      
         getProductDetailsData()
     }
    
    
    override func viewDidLayoutSubviews()
            {
                super.viewDidLayoutSubviews()
                


    //            heightVariableWishlist.constant = collectionView3.contentSize.height
    //
    //             heightVariableCategory.constant = collectionView2.contentSize.height
                
            //    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                
                 let height = tableView.contentSize.height
                
              //  self.scrollView.contentSize = CGSize(width: view.frame.width, height:  height + 128 )
                     
                  
            }
    
    

    
    
    func getAddressDetailsData(){
        
    //    MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId
        ]
                
                print(parametersBal)

                //                // BasUrl.baseURLPOST + "customer_login"
                 //http://zaarmall.com/development/get_customer_address

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
                                                   let address_title = getInstallment["address_title"] as? String
                                                   let flat = getInstallment["flat"] as? String
                                                   let street = getInstallment["street"] as? String
                                                    
                                                    let pincode = getInstallment["pincode"] as? String
                                                    
                                                    let city = getInstallment["city"] as? String
                                                    let default_add = getInstallment["default_add"] as? String
                                                 
                                                    
                                                    self.lblFullAddress.text =  "\(String(describing: flat!))" + ", \(String(describing: street!))" + ", \(String(describing: city!))" + ", \(String(describing: pincode!))"
//                                                    self.lblAddressNumber.text = ", \(city ?? "")" + ", \(pincode ?? "")"
//                                                    self.lblAddressName.text = ", \(city ?? "")"
//                                                    self.addresslbl.text = flat
                                                 
                                                    
                                                }
                                                


                                                


                                            }
                                            else{
                                                DispatchQueue.main.async {
                                                      MBProgressHUD.hide(for: self.view, animated: true)
                                                  
                                                }

                                                
                                            }

                                        }
                                        else{
                                            DispatchQueue.main.async {
                                                  MBProgressHUD.hide(for: self.view, animated: true)
                                                
                                            }

                        }
                        


                }
                

        
    }
    
    
    func getProductDetailsData(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                                                    
                                              
        
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId
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
                                            

                                            
                                             self.arrId.removeAll()
                                             self.arrproduct_id.removeAll()
                                             self.arrquantity.removeAll()
                                             self.arrproduct_name.removeAll()
                                             self.arrselling_price.removeAll()
                                             self.arroriginal_price.removeAll()
                                             self.arrtotal_discount.removeAll()
                                             self.arrstock_quantity.removeAll()
                                             self.arrcategory_id.removeAll()
                                             self.arrdiscounted_amount.removeAll()
                                             
                                             self.arrProductTypeId.removeAll()
                                             
                                             self.arrseller_name.removeAll()
                                            self.arrservice_charge.removeAll()
                                             self.arrdelivery_expected_time.removeAll()
                                            self.arrdelivery_charge.removeAll()

                                            
                                            
                                             let total_amount = jsonData["total_amount"] as? Double
                                            
                                             let total_saving = jsonData["total_saving"] as? Double

                                            
                                            let formatter = NumberFormatter()
                                            formatter.numberStyle = NumberFormatter.Style.decimal
                                            formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
                                            formatter.maximumFractionDigits = 2
                                            formatter.minimumFractionDigits = 2
                                            
                                            let roundedValue1 = formatter.string(from: total_amount! as NSNumber) // 0.68
                                            let roundedValue2 = formatter.string(from: total_saving! as NSNumber) // 0.68
                                            
                                            self.lblTotalAmount.text = roundedValue1
                                            self.lblPrice.text = roundedValue1
                                            self.lblTotalPaidAmount.text = roundedValue1
                                            self.lblDeliveryFee.text = roundedValue2
                                            
                                            
                                            self.strFinalAmount = roundedValue1 ?? "0"
                                            self.strTotalAmount = roundedValue1 ?? "0"
                                            self.strSavingAmount = roundedValue2 ?? "0"
                                            
                                            
                                              MBProgressHUD.hide(for: self.view, animated: true)
                                            self.timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
                                                                                             
                                            
                                            
                                            if strStatus == 200
                                            {
                                                  
                                                for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                {
                                                    
                           let id = getInstallment["id"] as? String
                                                    let product_id = getInstallment["product_id"] as? String
                                                  
                                                    
                                                    let quantity = getInstallment["quantity"] as? String
                                                    let product_name = getInstallment["product_name"] as? String
                                                    
                                                    let custom_id = getInstallment["custom_id"] as? String
                                                 
                                                      let size = getInstallment["size"] as? String
                                                     let color = getInstallment["color"] as? String
                                                    
//                                                    let getselling_price = getInstallment["selling_price"] as? Any
                                                    
                                                    guard let getselling_price = getInstallment["selling_price"] else {
                                                        return
                                                    }
                                                    
                                               //     let selling_price = formatter.string(from: getselling_price! as! NSNumber) // 0.68
                                                    
                                                    guard let getoriginal_price = getInstallment["original_price"] else {
                                                                                                      return
                                                                                                  }
                                                                                                  
                                                    
                                                    guard let gettotaldiscount = getInstallment["total_discount"] else {
                                                        return
                                                    }
                                                    
                                                    
                                                   let total_discount = getInstallment["total_discount"] as? String
                                                   let stock_quantity = getInstallment["stock_quantity"] as? String
                                                    
                                                    let category_id = getInstallment["category_id"] as? String
                                                    
                                                    let discounted_amount = getInstallment["discounted_amount"] as? String
                                                    let seller_name = getInstallment["seller_name"] as? String
                                                    let service_charge = getInstallment["service_charge"] as? String
                                       
                                                  
                                                    let delivery_expected_time = getInstallment["delivery_expected_time"] as? String
                                                    let delivery_charge = getInstallment["delivery_charge"] as? String
                                                   
                                                    
                                                    var count : Int = 0
                                                    var count2 : Int = 0
                                                    
                                                    for case let getImage in ((getInstallment["images"] as? [AnyObject]))!{
                                                           let image = getImage["image"] as? String
                                                        
                                                          count += 1
                                                        
                                                        if count == 1{
                                                            self.arrimage.append(image ?? "")
                                                                                                                   
                                                        }
                                                        
                                                       
                                                        
                                                    }
                                                    
                                                    
//                                                    for case let getOfferdata in ((getInstallment["offer_data"] as? [AnyObject]))!{
//
//
//                                                      count2 += 1
//
//                                                        if count2 == 1{
//                                                            let categorytypeid = getOfferdata["category_type_id"] as? String
//                                                            self.arrProductTypeId.append(categorytypeid ?? "")
//                                                        }
//
//
//
//                                                    }
                                                    
                                                    
                                                    self.arrColor.append(color ?? "")
                                                    self.arrSize.append(size ?? "")
                                                    self.arrId.append(id ?? "")
                                                    self.arrproduct_id.append(product_id ?? "")
                                                    self.arrquantity.append(quantity ?? "0")
                                                    self.arrproduct_name.append(product_name ?? "")
                                                    self.arrselling_price.append("د.ع.\(getselling_price!)")
                                                    self.arroriginal_price.append("د.ع.\(getoriginal_price!)")
                                                    self.arrtotal_discount.append(total_discount ?? "")
                                                    self.arrstock_quantity.append(stock_quantity ?? "")
                                                    self.arrcategory_id.append(category_id ?? "")
                                                    self.arrdiscounted_amount.append("د.ع.\(gettotaldiscount!)" )
                                                    
                                                    self.arrCustomId.append(custom_id ?? "")
                                                    self.arrseller_name.append(seller_name  ?? "")
                                                   self.arrservice_charge.append(service_charge ?? "")
                                                    self.arrdelivery_expected_time.append(delivery_expected_time ?? "")
                                                   self.arrdelivery_charge.append(delivery_charge ?? "")
                                                    
                                              
                                                    
                                                }
                                          
                                                if self.arrproduct_name.isEmpty
                                                {
                                                    self.ViewCart.isHidden = true
                                                    self.viewCheckout.isHidden = true
                                                    self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:  self.view.frame.height - 200)
                                                }
                                                else{
                                                    self.ViewCart.isHidden = false
                                                    self.viewCheckout.isHidden = false
                                                }
                                                                                        

                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                               
                                               DispatchQueue.main.async {
                                                   self.tableView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                self.ViewCart.isHidden = true
                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:  self.view.frame.height)
                                                
                                              
                                                
                                                DispatchQueue.main.async {
                                                      MBProgressHUD.hide(for: self.view, animated: true)
                                                    self.tableView.reloadData()
                                                }
                                                
                                            }

                                        }
                                        else{
                                            self.ViewCart.isHidden = true
                                            self.viewCheckout.isHidden = true
                                            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:  self.view.frame.height - 200)
                                          
                                            
                                            DispatchQueue.main.async {
                                                  MBProgressHUD.hide(for: self.view, animated: true)
                                                self.tableView.reloadData()
                                            }
                                            
                                        }


                }
                

        
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrproduct_name.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCartTVC", for: indexPath) as! CustomerCartTVC
            
            cell.editData2 = self
                             
            cell.tag = indexPath.row
                   
            
    //          let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width  , height: tableView.contentSize.height))
    //
    //          whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.9])
    //          whiteRoundedView.layer.masksToBounds = false
    //          whiteRoundedView.layer.cornerRadius = 2.0
    //        //  whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
    //         // whiteRoundedView.layer.shadowOpacity = 0.2
    //
    //          cell.contentView.addSubview(whiteRoundedView)
    //          cell.contentView.sendSubviewToBack(whiteRoundedView)

    timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            

            //cell.sizelbl?.text = "XXL"
            
            cell.rockehardlbl.text = arrproduct_name[indexPath.row]
            
            cell.sellerNamelbl?.text = arrseller_name[indexPath.row]

            cell.amountlbl1?.text = arrselling_price[indexPath.row]

            cell.lbloriginalPrice?.text = arroriginal_price[indexPath.row]

            cell.amount3?.text = arrtotal_discount[indexPath.row]

         //   cell.amountlbl4?.text = arrtotal_discount[indexPath.row]

            
            cell.amountlbl5?.text = arrselling_price[indexPath.row]

         //   cell.offerlbl?.text = arrstock_quantity[indexPath.row]

            cell.dayslbl?.text = arrdelivery_expected_time[indexPath.row]

            cell.amountlbl6?.text = arrdiscounted_amount[indexPath.row]
            
              cell.sizelbl?.text = arrSize[indexPath.row]
            
          //   cell.sizelbl?.text = arrSize[indexPath.row]

         //   count = Int(arrquantity[indexPath.row]) ?? "0"
            
           // cell.bookImage.image = imag[indexPath.row]
        //    cell.Qtylbl.text = arrquantity[indexPath.row]

            let getString = arrimage[indexPath.row]
                  
                  let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                         
                   
                                                   print(getUrl)
            // BasUrl.baseURLPOST + "customer_login"

            cell.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)


            return cell

        }


    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//
        


    }
    
    @objc func timerAction() {
        counter += 1

     //  print(counter)
                     let height = tableView.contentSize.height
                                     // print("height",height)
                    heightVariable.constant = height
        
        self.scrollView.contentSize = CGSize(width: view.frame.width, height:  height + 389 )
        
        
       
    }
    
    @IBAction func btnAddCart(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
               let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
              self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnPaceOrderAction(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBPaymentVC") as! EBPaymentVC
        nextViewController.getFinalAmount = self.strFinalAmount
        nextViewController.getSavingAmount = self.strSavingAmount
        nextViewController.getTotalAmount = self.strTotalAmount
        
        nextViewController.getPaymentType = self.getNormalExpress
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    
    @IBAction func ChangeAddressAction(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAddAddressVC") as! EBAddAddressVC
        
        nextViewController.getAddress = "Emptycart"
                 self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
    
}
