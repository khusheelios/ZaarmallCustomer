//
//  EBookSelectSubCategoryProductVc.swift
//  EBookApp
//
//  Created by apple on 21/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import MBProgressHUD


class ResturentName5{
    var authorname: String

    var bookTitle: String


    var rating: String


    var amount: String


    var bookImage: String
    var amount1:String
    var perstage:String

    
    
    init(authorname: String,bookTitle: String,rating: String,amount: String,bookImage: String,amount1 amount1:String,perstage perstage:String) {
        self.authorname = authorname

        self.bookTitle = bookTitle


        self.rating = rating


        self.amount = amount



        self.bookImage = bookImage
        self.perstage = perstage
        self.amount1 = amount1
    }

}


class EBookSelectSubCategoryProductVc: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionView1: UICollectionView!

    @IBOutlet weak var viewHeightVariable: NSLayoutConstraint!
    
    @IBOutlet weak var womenlbl: UILabel!
    @IBOutlet weak var SearchText: UITextField!

    
    
    @IBOutlet weak var heightVariable: NSLayoutConstraint!
    
//    var productNameArray = ["Sweatshirt","Shoe","T-Shirt","Dress","Perfume","Shirt"]
//    var productImageArray = [UIImage (named:"01-4"),UIImage(named:"02-1"),UIImage(named:"03-1"),UIImage(named:"04-1"),UIImage(named:"05"),UIImage(named:"03-1"),]
   
    var productNameArray = [String]()
    var productImageArray = [String]()

    
    var restArray = [ResturentName5]()
    
    var currentRestArray = [ResturentName5]()
    
    var currentIndex: Int = 0

    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    var strCategoryName1 = String()
    
    var getChildCategoryId = String()
    var getCategoryId = String()
     var getSubCategoryId = String()
    

    var getChildSubCategoryId = String()


    var ChildCategoryname = String()

     var ChildCategoryimage = String()

     var ChildCategoryis_active = String()

     var ChildCategoryis_delete = String()

     var ChildCategorycreate_date = String()
     
     var ChildcategoryArray = [String]()
    var ChildcategoryIdArray = [String]()
    var SelectedChildCategoryId = String()

    var arrCategoryId = [String]()
      var arrSubCategoryId = [String]()
    
    
    var getSelectedSubCategoryId = String()
    var getSelectSubCategoryName = String()
    
    var getUserId = String()
    var getStoreId = String()
    
     var strChildCategoryId = String()
    
    var strProductName = String()
    var strProductDesceription = String()
    var strProductRating = String()
    var strProductImage = String()
    var strProductOrornalPrice = String()
    var strProductSellingPrice = String()
    var strProductTotaldiscount = String()



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
    
  
    

    
        var getCategory_Id = String()
        var getCustomer_Id = String()
         var getSub_Category_Id = String()
        var getChild_Category_Id = String()
        var getStore_Id = String()
   

    override func viewDidLoad() {
        super.viewDidLoad()
 
        //getProductByChildCategory()

    

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView1.delegate = self
        collectionView1.dataSource = self
        print(strCategoryName1)
        womenlbl.text = getSelectSubCategoryName

        

        self.setupGridView()
        
        
        getChildCategory(getSubCategoryId: getSubCategoryId)
        getProductDetailsData(getCategoryId: getCategoryId, getSubCategoryId: getSubCategoryId, getChildCategoryId: self.strChildCategoryId, getStoreId: "")


    }
    
        override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
            


            if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                    layout.minimumLineSpacing = -15
                    layout.minimumInteritemSpacing = -10
                    layout.sectionInset = UIEdgeInsets(top: -5, left: 1, bottom: 0, right: 5)
                    let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
                    layout.itemSize = size
                
            }
            
            
                if let layout1 = collectionView1?.collectionViewLayout as? UICollectionViewFlowLayout{
                    
                    layout1.minimumLineSpacing = 10
                                         layout1.minimumInteritemSpacing = 6
                                         layout1.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
                                         let size1 = CGSize(width:(collectionView1!.bounds.width-30)/2, height: 300)
                                         layout1.itemSize = size1
                    
                               let height = collectionView1.collectionViewLayout.collectionViewContentSize.height
                                            print(height)
                    
                                     //   heightVariable.constant = height
                }
            
            

//
               self.view.layoutIfNeeded()

            

        }
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

    
    @IBAction func btnNotification(_ sender: Any) {
        
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)


    }

    
    @IBAction func btnFilterCart(_ sender: Any) {
        //EBookCartVC
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCustomerAddCarrtVc") as! EBookCustomerAddCarrtVc
//        self.present(nextViewController, animated:true, completion:nil)

    }
    
    
    
    @IBAction func btnBack(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)


    }

    
    
    
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
                              var count:Int?

                               if collectionView == self.collectionView {

                                count = self.productNameArray.count
                         }
                               else if collectionView == self.collectionView1{
                                count = self.arrstore_name.count


                       }
                               else{
                                count = 2
                            }
            return count!
        }
    
    
 

    
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
              var cellToReturn = UICollectionViewCell()
            if collectionView == self.collectionView {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoryWomenCVC", for: indexPath) as? SubCategoryWomenCVC
                self.SelectedChildCategoryId = ChildcategoryIdArray[indexPath.row]

                    let getString = productImageArray[indexPath.row]
               
                     let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                    
                    print(getUrl)
               // BasUrl.baseURLPOST + "customer_login"

                cell?.productName.text = productNameArray[indexPath.row]
                cell?.productImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

//                cell?.productImage.layer.cornerRadius = 40
//                cell?.productImage.layer.borderWidth = 1
//                var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
//                cell?.productImage.layer.borderColor = red1.cgColor

                
                cell?.clipsToBounds = true
//                if indexPath.row == 0{
//
//                    print(self.SelectedChildCategoryId)
//                    getProductByChildCategory()
//                }

                cellToReturn = cell!


            }
            else if collectionView == self.collectionView1{
                let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomerHomeCVC", for: indexPath) as? CustomerHomeCVC

                firstcell?.bookTitles.text = arrcategory_name[indexPath.row]
                firstcell?.Authornamelbl.text = arrsub_category_name[indexPath.row]
                firstcell?.amountlbl.text = arroriginal_price[indexPath.row]
                firstcell?.amountlbl1.text = arrselling_price[indexPath.row]
               // firstcell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)
                
                
                let getString = arrimage[indexPath.row]
                           
                                 let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                
                                print(getUrl)
                
               // BasUrl.baseURLPOST + "customer_login"
                firstcell?.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image_1"), options: .forceTransition, progress: nil, completed: nil)

              

                firstcell?.ratingslbl.text = arrrating[indexPath.row]
          //      firstcell?.amountlbl1.text = currentRestArray[indexPath.row].amount1
                firstcell?.perstagelbl.text = arrtotal_discount[indexPath.row]



          //      firstcell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)

           
              
                
                cellToReturn = firstcell!



            }


                
                
                
            return cellToReturn
        }
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCustomerAddCarrtVc") as! EBookCustomerAddCarrtVc
        
        
        self.present(nextViewController, animated:true, completion:nil)



    }

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        if collectionView == collectionView {
//
//            return CGSize(width: 105, height: 131)
//        }
//        else {
//                    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//
//            let numberofItem: CGFloat = 2
//
//            let collectionViewWidth = self.collectionView.bounds.width
//
//            let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
//
//            let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
//
//            let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
//
//            print(width)
//
//            return CGSize(width: width, height: width)
//
//            }
//
//
//
//        }
    
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
                
                if collectionView == self.collectionView {
                    
                    let getCategory = arrCategoryId[indexPath.row]
                    let getSubCategory = arrSubCategoryId[indexPath.row]
                    let getChildId = ChildcategoryIdArray[indexPath.row]
                    
                    print(getCategory,getSubCategory,getChildId)
                 
                    self.getProductDetailsData(getCategoryId: getCategory, getSubCategoryId: getSubCategory, getChildCategoryId: getChildId, getStoreId: "")
                    
                }
                else if collectionView == self.collectionView1 {
                //ChildcategoryIdArray
                
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
                    
                    
                nextViewController.getProductId = arrproduct_id[indexPath.row]
                nextViewController.getCategoryId = arrcategory_id[indexPath.row]
                nextViewController.getChildId = arrchild_category_id[indexPath.row]
                 nextViewController.getUserId = getUserId
                        
                self.present(nextViewController, animated:true, completion:nil)

                }
                
            }


            func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
                
                


            }
    
    
    
    
    func getProductDetailsData(getCategoryId: String,getSubCategoryId:String,getChildCategoryId:String,getStoreId:String){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
 
               
        
                let parametersBal: Parameters=[
                    "category_id":getCategoryId,
                    "sub_category_id":getSubCategoryId,
                    "child_category_id":getChildCategoryId,
                    "store_id":"",
                    "customer_id":getUserId
        ]
                
                print(parametersBal)

                // BasUrl.baseURLPOST + "customer_login"
                //http://zaarmall.com/development/get_all_product

                Alamofire.request(BasUrl.baseURLPOST + "get_all_product", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            
                                            
                                            self.arrimage.removeAll()
                                            
                                            self.arrproduct_id.removeAll()
                                            self.arrStoreId.removeAll()
                                            self.arrcategory_id.removeAll()
                                            self.arrchild_category_id.removeAll()
                                            self.arrproduct_name.removeAll()
                                            self.arrbrand.removeAll()
                                            self.arrdescription.removeAll()
                                            self.arrselling_price.removeAll()
                                            self.arroriginal_price.removeAll()
                                            
                                            
                                            self.arrtotal_discount.removeAll()
                                            self.arrstock_quantity.removeAll()
                                            self.arrstore_name.removeAll()
                                            self.arrcategory_name.removeAll()
                                            
                                            self.arrsub_category_name.removeAll()
                                            
                                            self.arrrating.removeAll()
                                            


                                            
                                            if strStatus == 200
                                            {
                                                   MBProgressHUD.hide(for: self.view, animated: true)
                                                
                                                for case let getInstallment in ((jsonData["getProductsData"] as? [AnyObject]))!
                                                {
                                                    
                                                    let product_id = getInstallment["product_id"] as? String
                                                    let store_id = getInstallment["store_id"] as? String
                                                    let category_id = getInstallment["category_id"] as? String
                                                    let child_category_id = getInstallment["child_category_id"] as? String
                                                    let product_name = getInstallment["product_name"] as? String
                                                    let brand = getInstallment["brand"] as? String
                                                    let description = getInstallment["description"] as? String
                                                    let selling_price = getInstallment["selling_price"] as? String
                                                    let original_price = getInstallment["original_price"] as? String
                                                    let total_discount = getInstallment["total_discount"] as? String
                                                    let stock_quantity = getInstallment["stock_quantity"] as? String
                                                  
                                                    let store_name = getInstallment["store_name"] as? String
                                                    let category_name = getInstallment["category_name"] as? String
                                                    let sub_category_name = getInstallment["sub_category_name"] as? String
                                                    let rating = getInstallment["rating"] as? String
                                                    
                                                    
                                                    
                                                    for case let getImage in ((getInstallment["image"] as? [AnyObject]))!{
                                                           let image = getImage["image"] as? String
                                                        
                                                            self.arrimage.append(image!)
                                                        
                                                    }
                                                    
                                                    self.arrproduct_id.append(product_id ?? "")
                                                    self.arrStoreId.append(store_id ?? "")
                                                    self.arrcategory_id.append(category_id ?? "")
                                                    self.arrchild_category_id.append(child_category_id ?? "")
                                                    self.arrproduct_name.append(product_name ?? "")
                                                    self.arrbrand.append(brand ?? "")
                                                    self.arrdescription.append(description ?? "")
                                                    self.arrselling_price.append("د.ع" + selling_price! )
                                                    self.arroriginal_price.append("د.ع" + original_price! )
                                                    
                                                    
                                                    self.arrtotal_discount.append(total_discount  ?? "")
                                                   self.arrstock_quantity.append(stock_quantity ?? "")
                                                    self.arrstore_name.append(store_name ?? "")
                                                   self.arrcategory_name.append(category_name ?? "")
                                                    
                                                    self.arrsub_category_name.append(sub_category_name ?? "")
                                                
                                                    self.arrrating.append(rating ?? "")
                                                    
                                              
                                                    
                                                }
                                                

                                                
                                               DispatchQueue.main.async {
                                                   self.collectionView1.reloadData()
                                               }

                                                


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
    
    
    

    func getProductByChildCategory(getChildId : String){
        
                let parametersBal: Parameters=[
                    "child_category_id":getChildId
                    ]
                
                print(parametersBal)
                
                
                // BasUrl.baseURLPOST + "customer_login"
                //http://zaarmall.com/development/get_product_by_childcategoryId

                Alamofire.request(BasUrl.baseURLPOST + "get_product_by_childcategoryId", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                           

                                            
                                            if (status == 200 as CFBoolean )
                                            {

                                                var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                                                           

                                                
                                                print("hiiii")
                                                  for user in data
                                                  {
                                                    
                                                    let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                               
                                                    let add_by = (user as AnyObject).value(forKey: "add_by") as! String
                                                 
                                                    let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                  
                                                    let sub_category_id = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                
                                                    self.strChildCategoryId = (user as AnyObject).value(forKey: "child_category_id") as! String
                                              
                                                    self.strProductName = (user as AnyObject).value(forKey: "product_name") as! String
                                                  
                                                    self.strProductDesceription = (user as AnyObject).value(forKey: "description") as! String
                                                 
                                                    self.strProductImage = (user as AnyObject).value(forKey: "image_1") as! String
                                                   
                                                   let  image_2 = (user as AnyObject).value(forKey: "image_2") as! String
                                                  
                                                    self.strProductSellingPrice = (user as AnyObject).value(forKey: "selling_price") as! String
                                                
                                                    self.strProductOrornalPrice = (user as AnyObject).value(forKey: "original_price") as! String
                                                 
                                                    self.strProductTotaldiscount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                   
                                                    let stock_quantity = (user as AnyObject).value(forKey: "stock_quantity") as! String
                                                  
                                                    let is_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                  
                                                    let created_date = (user as AnyObject).value(forKey: "created_date") as! String
                                                   
                                                    let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                   
                                                    let wishlist = (user as AnyObject).value(forKey: "wishlist") as! String
                                                  
                                                  }
                                                
                                                self.currentRestArray.append(ResturentName5(authorname:self.strProductName,bookTitle:self.strProductDesceription,rating: self.strProductRating,amount: self.strProductOrornalPrice,bookImage: self.strProductImage, amount1: self.strProductSellingPrice,perstage: self.strProductTotaldiscount))

                                                
                                               DispatchQueue.main.async {
                                                   self.collectionView1.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }


    
    
    
    


    func getChildCategory(getSubCategoryId: String){
        
                let parametersBal: Parameters=[
                    "sub_category_id":self.getSubCategoryId
                    ]
                
                print(parametersBal)
                
                
                // BasUrl.baseURLPOST + "customer_login"
                //http://zaarmall.com/development/get_all_child_categories
                Alamofire.request(BasUrl.baseURLPOST + "get_all_child_categories", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                            
                                            
                                            self.arrCategoryId.removeAll()
                                      self.ChildcategoryIdArray.removeAll()
                                            self.arrSubCategoryId.removeAll()
                                            self.productNameArray.removeAll()
                                            self.productImageArray.removeAll()

                                          

                                            if (status == 200 as CFBoolean )
                                            {
                                                
                                                let data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                                                          

                                                print("hiiii")
                                                  for user in data
                                                  {
                                                    
                                                    let getChild_category_id = (user as AnyObject).value(forKey: "child_category_id") as! String
                                                    
                                                    self.ChildcategoryIdArray.append(getChild_category_id)
                                               
                                                    let getCategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                 self.arrCategoryId.append(getCategoryId)
                                                    
                                                let getChildSubCategoryId = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                self.arrSubCategoryId.append(getChildSubCategoryId)
                                                    
                                                    self.ChildCategoryname = (user as AnyObject).value(forKey: "name") as! String
                                                    print(self.ChildCategoryname)
                                                    self.productNameArray.append(self.ChildCategoryname)
                                                 
                                                    self.ChildCategoryimage = (user as AnyObject).value(forKey: "image") as! String
                                                    print(self.ChildCategoryimage)
                                                    
                                                    self.productImageArray.append(self.ChildCategoryimage)

                                                    self.ChildCategoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                
                                                    self.ChildCategoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                               
                                                    self.ChildCategorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                    
                                                    
                                               
                                               
                                                                                                 
                                                    
                                                  }
                                                
                                                
                                            //    self.getProductDetailsData(getCategoryId: self.arrCategoryId[0], getSubCategoryId: self.arrSubCategoryId[0], getChildCategoryId: self.ChildcategoryIdArray[0], getStoreId: "")
                                                
                                               DispatchQueue.main.async {
                                             
                                              
                                                   self.collectionView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }

    

    }





extension EBookSelectSubCategoryProductVc :  UICollectionViewDelegateFlowLayout
{
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
     
                   let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 8.5
                   layout.minimumInteritemSpacing =  8.5
                         
                         let numberOfItemsPerRow: CGFloat = 2.0
                         let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
                         
                         return CGSize(width: itemWidth, height: 150)
                   
                   
        
        
    }
}
