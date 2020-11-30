//
//  ChildViewController1.swift
//  EBookApp
//
//  Created by Zanjo iOS Dev on 25/11/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire

class ChildViewController1: UIViewController  , IndicatorInfoProvider,UITableViewDataSource,UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrAllOrders.count
}

    
    @IBOutlet weak var tblView: UITableView!
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EBMyOrderTVC", for: indexPath) as! EBMyOrderTVC
    
    cell.lblName.text = arrAllOrders[indexPath.row].customer_name
    cell.lblTotalAmount.text = arrAllOrders[indexPath.row].product_amount
    cell.lblNo.text = arrAllOrders[indexPath.row].product_qty
    cell.lblOrderStatus.text = "Status\(arrAllOrders[indexPath.row].order_status)"
    cell.lblOrderId.text = arrAllOrders[indexPath.row].shipment_id

    
    let getUrl = arrAllOrders[indexPath.row].imgUrl.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
    // BasUrl.baseURLPOST + "customer_login"
    
    cell.imgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)


    
    return cell
}


func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookAppOrderStatusVc") as! EBookAppOrderStatusVc
    self.present(nextViewController, animated:true, completion:nil)
}

var arrAllOrders = [AllOrders]()
    
    
   func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
       return IndicatorInfo(title: "Order")
   }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
                gettop_featured_productsDetails2()
                // Do any additional setup after loading the view.
            }
            


                       func gettop_featured_productsDetails2(){
                         
                           
                                       let parametersBal: Parameters=[
           
                                               "customer_id":"1"
                                           ]
           
                                       print(parametersBal)
                                       
                                       // BasUrl.baseURLPOST + "customer_login"
                                       //http://zaarmall.com/development/get_all_product
                                       
                                       Alamofire.request(BasUrl.baseURLPOST + "get_all_orders_by_customer", method: .post, parameters: parametersBal).responseJSON
                                           {
                                                               response in
                                                               
                                                               print(response)
                                                               
                                                               //getting the json value from the server
                                                               if let result = response.result.value {
                                                                   
                                                                   let jsonData = result as! NSDictionary

                                                                
                                                                      let strMessage = jsonData["message"] as? String
                                                                                                        
                                                                                                        let strStatus = jsonData["status"] as? Int
                                                                                                       
                                                                 
                                                                       

                                                                       self.arrAllOrders.removeAll()


                                                                   
                                                                 
                                                                   
                                                                   
                                                                   if strStatus == 200
                                                                   {
                                                                    
                                                                    for case let getInstallment in ((jsonData["Orders"] as? [AnyObject]))!{
                                                                        
                                                                       let stroriginalprice = getInstallment["original_price"] as? String
                                                                       
                                                                        let strshipmentid = getInstallment["shipment_id"] as? String
                                                                        
                                                                        let strorderid = getInstallment["order_id"] as? String
                                                                        
                                                                        let strproductamount = getInstallment["product_amount"] as? String
                                                                        
                                                                        let strtotalamount = getInstallment["total_amount"] as? String
                                                                        
                                                                        let strorderstatus = getInstallment["order_status"] as? String
                                                                        
                                                                        let strcustomername = getInstallment["customer_name"] as? String
                                                                        
                                                                        let strproduct_qty = getInstallment["product_qty"] as? String
                                                                        
                                                                        
                                                                                                                                let caption = (getInstallment as AnyObject).value(forKey: "image") as! NSArray

                                                                                                                                
                                                                                                                                var count : Int = 0

                                                                                                            for imagearray in caption
                                                                                                            {
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                count += 1
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                if count == 1{
                                                                                                                    
                                                                                            
                                                                                                                    
                                                                                                                    let getData = AllOrders(originalprice: stroriginalprice ?? "", shipment_id: strshipmentid ?? "", order_id: strorderid ?? "", product_amount: strproductamount ?? "", total_amount: strtotalamount ?? "", order_status: strorderstatus ?? "", customer_name: strcustomername ?? "", product_qty: strproduct_qty ?? "", imgUrl: imagearray as! String)
                                                                                                                                                                                   
                                                                                                                                                                                   self.arrAllOrders.append(getData)
                                                                                                                    
                                                                                                                    
                                                                                                                }
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                        }
                                                                                        
                                                                       
                                                                        
                                                                      
        //                                                                for case let getImages in ((getInstallment["image"] as? [AnyObject]))!{
        //
        //                                                                    let strimgUrl = getImages["imgUrl"] as? String
        //
        //
        //                                                                }
                                                                       
                                                                        
                                                                    }
                                                                    
                                                                    DispatchQueue.main.async
                                                                                                                         {
                                                                                                                             
                                                                                                                             self.tblView.reloadData()
                                                                                                                         
                                                                                                                     }
                                                                    
                                                                    
                                                                   }
                                                                   else{
                                                                    
                                                                }

                                                               }
                                                               else{
                                                                DispatchQueue.main.async
                                                                    {
                                                                        
                                                                        self.tblView.reloadData()
                                                                    
                                                                }
                                                               }


                                       }
                                       

                               
                           }

}



//struct AllOrders {
//    var originalprice:String
//    var shipment_id: String
//    var order_id: String
//    var product_amount:String
//    var total_amount: String
//    var order_status: String
//    var customer_name:String
//    var product_qty: String
//    var imgUrl: String
//    
//    
//    init( originalprice: String,  shipment_id: String,order_id:String,product_amount:String,total_amount:String,order_status:String,customer_name:String,product_qty:String,imgUrl:String) {
//        self.originalprice = originalprice
//        self.shipment_id = shipment_id
//        self.order_id = order_id
//        
//        self.product_amount = product_amount
//        self.total_amount = "د.ع" + total_amount
//        self.order_status = order_status
//        self.customer_name = customer_name
//        self.product_qty = product_qty
//        self.imgUrl = imgUrl
//
//
//    }
//}
