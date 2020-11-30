
import UIKit
import MBProgressHUD
import Alamofire

class EBookCustomerAddCarrtVc: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   
    @IBOutlet weak var EBookCustomerAddCarrtVc: UILabel!
    
    
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
      
    
    var arrdiscounted_amount = [String]()
        var arrseller_name = [String]()
        var arrservice_charge = [String]()
        
        var arrdelivery_expected_time = [String]()
           var arrdelivery_charge = [String]()
          
          var arrquantity = [String]()
        var arrId = [String]()
     
          var getCategory_Id = String()
          var getCustomer_Id = String()
           var getSub_Category_Id = String()
          var getChild_Category_Id = String()
          var getStore_Id = String()
    
    
    
        var getUserId = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if getUserId.isEmpty
            {
                getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
                
            }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
             self.tableView.rowHeight = UITableView.automaticDimension
        
        
         getAddressDetailsData()
        getProductDetailsData()
    }
    
    @IBAction func changeAction(_ sender: Any)
    {
        
    }
    
    
    func getAddressDetailsData(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId
        ]
                
                print(parametersBal)

                // BasUrl.baseURLPOST + "customer_login"
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
                                                 
                                                    
                                                    self.lblFullAddress.text = "\(flat ?? "")\(street ?? "")\(city ?? "")"
                                                    self.lblAddressNumber.text = mobile
                                                  self.lblAddressName.text = name
                                                 
                                                    
                                                }
                                                


                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
    
    
    
    func getProductDetailsData(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
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
        
        
        self.arrseller_name.removeAll()
       self.arrservice_charge.removeAll()
        self.arrdelivery_expected_time.removeAll()
       self.arrdelivery_charge.removeAll()
                                                    
                                              
        
        
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
                                            

                                             let total_amount = jsonData["total_amount"] as? Int
                                            
                                             let total_saving = jsonData["total_saving"] as? Int

                                            
                                            self.lblTotalAmount.text = "\(total_amount ?? 0)"
                                            self.lblPrice.text = "\(total_saving ?? 0)"
                                            

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
                                                    
                                                    
                                                    let selling_price = getInstallment["selling_price"] as? String
                                                   let original_price = getInstallment["original_price"] as? String
                                                   let total_discount = getInstallment["total_discount"] as? String
                                                   let stock_quantity = getInstallment["stock_quantity"] as? String
                                                    
                                                    let category_id = getInstallment["category_id"] as? String
                                                    
                                                    let discounted_amount = getInstallment["discounted_amount"] as? String
                                                    let seller_name = getInstallment["seller_name"] as? String
                                                    let service_charge = getInstallment["service_charge"] as? String
                                       
                                                  
                                                    let delivery_expected_time = getInstallment["delivery_expected_time"] as? String
                                                    let delivery_charge = getInstallment["delivery_charge"] as? String
                                                   
                                                    
                                                    
                                                    for case let getImage in ((getInstallment["images"] as? [AnyObject]))!{
                                                           let image = getImage["image"] as? String
                                                        
                                                          
                                                        
                                                        self.arrimage.append(image ?? "")
                                                        
                                                        
                                                    }
                                                    
                                                    self.arrId.append(id ?? "")
                                                    self.arrproduct_id.append(product_id ?? "")
                                                    self.arrquantity.append(quantity ?? "")
                                                    self.arrproduct_name.append(product_name ?? "")
                                                    self.arrselling_price.append(selling_price ?? "")
                                                    self.arroriginal_price.append(original_price ?? "")
                                                    self.arrtotal_discount.append(total_discount ?? "")
                                                    self.arrstock_quantity.append(stock_quantity ?? "")
                                                    self.arrcategory_id.append(category_id ?? "")
                                                    self.arrdiscounted_amount.append(discounted_amount ?? "")
                                                    
                                                    
                                                    self.arrseller_name.append(seller_name  ?? "")
                                                   self.arrservice_charge.append(service_charge ?? "")
                                                    self.arrdelivery_expected_time.append(delivery_expected_time ?? "")
                                                   self.arrdelivery_charge.append(delivery_charge ?? "")
                                                    
                                              
                                                    
                                                }
                                                

                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                                                               
                                               DispatchQueue.main.async {
                                                   self.tableView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
    

    
    
    
  
//            override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//
//
//
//
//             let height = tableView.contentSize.height
//                             // print("height",height)
//                              heightVariable.constant = height
//
//
//
//
//    //
//                   self.view.layoutIfNeeded()
//
//
//
//            }
    
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }

    @IBAction func btnHome(_ sender: Any) {
    }
    
    @IBAction func btnChage(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrproduct_name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCartTVC", for: indexPath) as!CustomerCartTVC
        
        
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
        

        cell.sizelbl?.text = "XXL"
        
        cell.rockehardlbl.text = arrproduct_name[indexPath.row]
        
        cell.sellerNamelbl?.text = arrseller_name[indexPath.row]

        cell.amountlbl2?.text = arroriginal_price[indexPath.row]

        cell.amountlbl1?.text = arrselling_price[indexPath.row]

        cell.amount3?.text = arrtotal_discount[indexPath.row]

     //   cell.amountlbl4?.text = arrtotal_discount[indexPath.row]

        
        cell.amountlbl5?.text = arrselling_price[indexPath.row]

        cell.offerlbl?.text = arrstock_quantity[indexPath.row]

        cell.dayslbl?.text = arrdelivery_expected_time[indexPath.row]

        cell.amountlbl6?.text = arrtotal_discount[indexPath.row]

        
       // cell.bookImage.image = imag[indexPath.row]
        cell.Qtylbl.text = arrquantity[indexPath.row]
          //                // BasUrl.baseURLPOST + "customer_login"

        cell.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + arrimage[indexPath.row]), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)


        return cell

    }


    @objc func timerAction() {
        counter += 1

       print(counter)
                     let height = tableView.contentSize.height
                                     // print("height",height)
                    heightVariable.constant = height
        
    }
    
    
}
