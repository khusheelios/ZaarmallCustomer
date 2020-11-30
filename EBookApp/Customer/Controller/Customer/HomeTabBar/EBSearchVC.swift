//
//  EBSearchVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 24/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import Alamofire



struct SearchProduct {
    var categoryId:String
    var name: String
 
    var Subtitle:String
    var storeName: String
    var OriginalPrice: String
    var PercentPrice:String
    var CutPrice: String
    var imgUrl: String
    var rating: String
    
    
    init(withTitle title: String,categoryId:String,Subtitle:String,storeName:String,OriginalPrice:String,PercentPrice:String,CutPrice:String,imgUrl:String,rating:String) {
        self.name = title
   
        self.categoryId = categoryId
        
        self.Subtitle = Subtitle
        self.storeName = storeName
        self.OriginalPrice = "د.ع" + OriginalPrice
        self.PercentPrice = PercentPrice + "%"
        self.CutPrice = "د.ع" + CutPrice
        self.imgUrl = imgUrl
        self.rating = rating

    }
}

class EBSearchVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTopProduct.count
    }
    
    var arrTopProduct = [SearchProduct]()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookCVC", for: indexPath) as? EBookCVC
                           
        
   
        
                    cell?.bookTitles.text = arrTopProduct[indexPath.row].name
                    cell?.Authornamelbl.text = arrTopProduct[indexPath.row].Subtitle
                    cell?.lblStoreName.text = arrTopProduct[indexPath.row].storeName
                    cell?.lblOriginalPrice.text = arrTopProduct[indexPath.row].OriginalPrice
        cell?.lblSellingPrice.text = arrTopProduct[indexPath.row].CutPrice
        cell?.lblDiscount.text = arrTopProduct[indexPath.row].PercentPrice
                    cell?.ratingslbl.text = arrTopProduct[indexPath.row].rating
                    
                    
                    let getString = arrTopProduct[indexPath.row].imgUrl
                                                    
                                                          let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                         
                                                         print(getUrl)
                    
                    //               // BasUrl.baseURLPOST + "customer_login"

                           cell?.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

            //                cell?.productImage.layer.cornerRadius = 40
            //                    cell?.productImage.layer.borderWidth = 1
            //                    var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
            //                    cell?.productImage.layer.borderColor = red1.cgColor

                            
                            cell?.clipsToBounds = true
                    
                         
                    //             heightVariableCategory.constant = collectionView2.contentSize.height


    //                self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
    //
    //                    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

        return cell!


                        }
    
    var getSearch: String = ""

    @IBOutlet weak var txtSearch: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getDeafaultSubCategoryDetails2(getId: getSearch)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backAcion(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
     }

                func getDeafaultSubCategoryDetails2(getId : String){
                  
                    
                                let parametersBal: Parameters=[
                                    
                                    "value":txtSearch.text!
                                    ]
                                
                                print(parametersBal)
                                
                                // BasUrl.baseURLPOST + "customer_login"
                                //http://zaarmall.com/development/get_all_product
                                
                                Alamofire.request(BasUrl.baseURLPOST + "search_products", method: .post, parameters: parametersBal).responseJSON
                                    {
                                                        response in
                                                        
                                                        print(response)
                                                        
                                                        //getting the json value from the server
                                                        if let result = response.result.value {
                                                            
                                                            
                                                            let status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                             let message = (result as AnyObject).value(forKey: "message") as! NSString
                                                          
                                                                

                                                                self.arrTopProduct.removeAll()


                                                            
                                                          
                                                            
                                                            
                                                            if (status == 200 as CFBoolean )
                                                            {

                                                                let data = (result as AnyObject).value(forKey: "getProductsData") as! NSArray
                                                                                                              
                                                                
                                                                print("hiiii")
                                                                  for user in data
                                                                  {
                                                                    
                                                                    let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                                                   
                                                                    let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                                   
        //                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
        //
        //                                                                self.arrcategoryid.append(strproduct_name)
        //
        //
                                                                  
                                                                    
                                                                    let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                                 
                                                                    let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                                    
                                                              
                                                                    let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                                   // print(seSubCategoryname)
                                                                  
        //                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
        //                                                            // print(seSubCategoryname)
        //                                                             self.arrsubcategoryname.append(sub_category_name)
                                                                    
                                                                    let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                                
                                                                    let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                                    
                                                                    let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                                    
                                                                    
                                                                    let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                                  
        //                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
        //                                                            self.arrstorename.append(store_name)
                                                                    
                                                                    let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                                  
                                                                    
                                                                
                                                                    
                                                        
                                                                    let caption = (user as AnyObject).value(forKey: "image") as! NSArray

                                                                    
                                                                    var count : Int = 0

                                                for imagearray in caption
                                                {


                                                    
                                                    count += 1
                                                    
                                                
                                                    
                                                        
                                                    
                                                    if count == 1{
                                                        
                                                        let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                        
                                                      
                                                        
                                                        let getData = SearchProduct(withTitle: brand, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: rating)
                                                        
                                                        
                                                        self.arrTopProduct.append(getData)
                                                        
                                                        
                                                    }
                                                 
                                                    
                                                    
                                                    
                                                    }

                                                                    
                                                         
                                                                    
                                                                    
                                                                }
                                                                
                                                                DispatchQueue.main.async {
                                                                    self.collectionView.reloadData()
        //                                                            self.collectionView3.reloadData()
        //                                                            self.collectionView4.reloadData()
        //                                                                                                                     self.collectionView5.reloadData()
                                                                    
                                                                }

                                                                


                                                            }
                                                            else{
                                                                DispatchQueue.main.async {
                                                                    
    //                                                                self.heightVariableNewProduct.constant = 0
    //                                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                                    
                                                                                                                      self.collectionView.reloadData()
        //                                                               self.collectionView3.reloadData()
        //                                                              self.collectionView4.reloadData()
        //                                                              self.collectionView5.reloadData()
                                                                                                                   
                                                                                                                  }
                                                            }

                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                
                                                              
                                                         //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                                
                                                                                                                  self.collectionView.reloadData()
        //                                                           self.collectionView3.reloadData()
        //                                                                                                       self.collectionView4.reloadData()
        //                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                              }
                                                        }


                                }
                                

                        
                    }
    
    
    
    @IBAction func searchAction(_ sender: Any) {
   getSubCategoryDetails2(getId: "")
    }
    

            func getSubCategoryDetails2(getId : String){
              
                
                            let parametersBal: Parameters=[
                                
                                "value":txtSearch.text!
                                ]
                            
                            print(parametersBal)
                            
                            // BasUrl.baseURLPOST + "customer_login"
                            //http://zaarmall.com/development/get_all_product
                            
                            Alamofire.request(BasUrl.baseURLPOST + "search_products", method: .post, parameters: parametersBal).responseJSON
                                {
                                                    response in
                                                    
                                                    print(response)
                                                    
                                                    //getting the json value from the server
                                                    if let result = response.result.value {
                                                        
                                                        
                                                        let status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                         let message = (result as AnyObject).value(forKey: "message") as! NSString
                                                      
                                                            

                                                            self.arrTopProduct.removeAll()


                                                        
                                                      
                                                        
                                                        
                                                        if (status == 200 as CFBoolean )
                                                        {

                                                            let data = (result as AnyObject).value(forKey: "getProductsData") as! NSArray
                                                                                                          
                                                            
                                                            print("hiiii")
                                                              for user in data
                                                              {
                                                                
                                                                let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                                               
                                                                let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                               
    //                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
    //
    //                                                                self.arrcategoryid.append(strproduct_name)
    //
    //
                                                              
                                                                
                                                                let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                             
                                                                let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                                
                                                          
                                                                let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                               // print(seSubCategoryname)
                                                              
    //                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
    //                                                            // print(seSubCategoryname)
    //                                                             self.arrsubcategoryname.append(sub_category_name)
                                                                
                                                                let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                            
                                                                let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                                
                                                                let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                                
                                                                
                                                                let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                              
    //                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
    //                                                            self.arrstorename.append(store_name)
                                                                
                                                                let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                              
                                                                
                                                            
                                                                
                                                    
                                                                let caption = (user as AnyObject).value(forKey: "image") as! NSArray

                                                                
                                                                var count : Int = 0

                                            for imagearray in caption
                                            {


                                                
                                                count += 1
                                                
                                            
                                                
                                                    
                                                
                                                if count == 1{
                                                    
                                                    let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                    
                                                  
                                                    
                                                    let getData = SearchProduct(withTitle: brand, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: rating)
                                                    
                                                    
                                                    self.arrTopProduct.append(getData)
                                                    
                                                    
                                                }
                                             
                                                
                                                
                                                
                                                }

                                                                
                                                     
                                                                
                                                                
                                                            }
                                                            
                                                            DispatchQueue.main.async {
                                                                self.collectionView.reloadData()
    //                                                            self.collectionView3.reloadData()
    //                                                            self.collectionView4.reloadData()
    //                                                                                                                     self.collectionView5.reloadData()
                                                                
                                                            }

                                                            


                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                
//                                                                self.heightVariableNewProduct.constant = 0
//                                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                                
                                                                                                                  self.collectionView.reloadData()
    //                                                               self.collectionView3.reloadData()
    //                                                              self.collectionView4.reloadData()
    //                                                              self.collectionView5.reloadData()
                                                                                                               
                                                                                                              }
                                                        }

                                                    }
                                                    else{
                                                        DispatchQueue.main.async {
                                                            
                                                          
                                                     //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                            
                                                                                                              self.collectionView.reloadData()
    //                                                           self.collectionView3.reloadData()
    //                                                                                                       self.collectionView4.reloadData()
    //                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                          }
                                                    }


                            }
                            

                    
                }
    
    
   
    
  
}
