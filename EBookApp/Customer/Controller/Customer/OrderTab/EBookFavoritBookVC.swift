//
//  EBookFavoritBookVC.swift
//  EBookApp
//
//  Created by apple on 26/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Segmentio
import Alamofire
import MBProgressHUD

class EBookFavoritBookVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,CrossDelegate {
  func crossData(sender: MainCell) {
          var cel = MainCell()
                         let cell = sender.tag
                        let buttonPosition = sender.convert(CGPoint.zero, to: collectionView)
                          print(buttonPosition)
                           let indexPath = self.collectionView.indexPathForItem(at: buttonPosition)
    print(indexPath!.row)
    let currentCell = collectionView.cellForItem(at: indexPath!)
    
    self.getAddFavorties(getProductId: arrproduct_id[indexPath!.row])
                    
    }
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var currentStyle = SegmentioStyle.onlyImage

    
    var bookAuthorNameArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]





    
    var bookAuthorImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    

    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    
    var getId = String()
    var getcustomer_id = String()

    var getproduct_id = String()

    var getproduct_name = String()

    var getcategory_id = String()

    var getcreated_date = String()


  
    var getimage_1 = String()

    var getauthor_id = String()

    var getselling_price = String()

    var getoriginal_price = String()

    var gettotal_discount = String()

    var getstock_quantity = String()

    var getauthor_name = String()
    
    var product_nameArray = [String]()
    var author_nameArray = [String]()
    var imageArray = [String]()

    var arrProductIdType = [String]()
    var arrRating = [String]()
    var arrChildCategoryId = [String]()
    var arrselling_price = [String]()
    var arroriginal_price = [String]()
    var arrtotal_discount = [String]()
    var arid = [String]()
    var arrcustomer_id = [String]()
    var arrproduct_id = [String]()
    var arrproduct_name = [String]()
    var arrcategory_id = [String]()
    var arrdescription = [String]()
    var arrwishlist = [Int]()
    var arrStoreName = [String]()
    
    var arrimage = [String]()
   
    var getUserId = String()

    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           if getUserId.isEmpty
               {
                print(getUserId)
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
                
                
               }
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
      
        
        self.setupGridView()
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     
         getfavouriteProduct()
    }
    
    

    @IBAction func btnEdit(_ sender: Any)
    {
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
       // self.dismiss(animated: true, completion: nil)

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc

        self.present(nextViewController, animated:true, completion:nil)

            
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        

    }

    
    func setupGridView() {
//        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
//        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//
//        let numberofItem: CGFloat = 2
//
//        let collectionViewWidth = self.collectionView.bounds.width
//
//        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
//
//        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
//
//        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
//
//        print(width)
//
//        return CGSize(width: width, height: width)
//    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrproduct_name.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as? MainCell
        
        
        cell?.editData = self
        cell?.tag = indexPath.row

        cell?.bookTitles.text = arrproduct_name[indexPath.row]
        cell?.bookAuthorNamelbl.text = arrdescription[indexPath.row]
//        cell?.lblOriginalPrice.text = arroriginal_price[indexPath.row]
//        cell?.lblSellingPrice.text = arrselling_price[indexPath.row]
      //  cell?.lblStoreName.text = arrStoreName[indexPath.row]
 //       cell?.lblDiscountPrice.text = arrtotal_discount[indexPath.row]
        
        let getString = arrimage[indexPath.row]
        let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
               
         
        print(getUrl)
       // BasUrl.baseURLPOST + "customer_login"
        cell?.bookAuthorImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image_1"), options: .forceTransition, progress: nil, completed: nil)

        

        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
        nextViewController.getProductId = arrproduct_id[indexPath.row]
        self.present(nextViewController, animated:true, completion:nil)

    }
    
        func getfavouriteProduct(){
            
            let parametersBal: Parameters=[
                "customer_id":getUserId

                
            ]
            
            print(parametersBal)
            
            // BasUrl.baseURLPOST + "customer_login"
            //http://zaarmall.com/development/get_my_wishlist
                            Alamofire.request(BasUrl.baseURLPOST + "get_my_wishlist", method: .post, parameters: parametersBal).responseJSON
                                {
                                    response in
                                    
                                    print(response)
                                    
                                    //getting the json value from the server
                                    if let result = response.result.value {
                                        
                                        
                                        var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                      
                                        self.arrselling_price.removeAll()
                                        
                                           self.arroriginal_price.removeAll()
                                           self.arrtotal_discount.removeAll()
                                           self.arid.removeAll()
                                           self.arrcustomer_id.removeAll()
                                           self.arrproduct_id.removeAll()
                                           self.arrproduct_name.removeAll()
                                        self.arrimage.removeAll()
                                           self.arrdescription.removeAll()
                                           self.arrwishlist.removeAll()
                                        self.arrChildCategoryId.removeAll()
                                        self.arrStoreName.removeAll()
                                        
                                        
                                        if (status == 200 as CFBoolean )
                                        {
                                            
                                            var otpdata = (result as AnyObject).value(forKey: "data") as! NSArray

                                            
                                            print("book")
                                            for user in otpdata
                                            {
                                                self.getId = (user as AnyObject).value(forKey: "id") as! String

                                                self.getcustomer_id = (user as AnyObject).value(forKey: "customer_id") as! String

                                                self.getproduct_id = (user as AnyObject).value(forKey: "product_id") as! String

                                                self.getproduct_name = (user as AnyObject).value(forKey: "product_name") as! String

                                                self.getcreated_date = (user as AnyObject).value(forKey: "created_date") as! String

                                                let getproduct_name = (user as AnyObject).value(forKey: "product_name") as! String

                                                let description = (user as AnyObject).value(forKey: "description") as! String
 
                                                let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String

                                                let original_price = (user as AnyObject).value(forKey: "original_price") as! String

                                                let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                
                                                let id = (user as AnyObject).value(forKey: "id") as! String
                                                
                                                let child_category_id = (user as AnyObject).value(forKey: "child_category_id") as! String

                                                let wishlist = (user as AnyObject).value(forKey: "wishlist") as! Int
                                                
                                                  let rating = (user as AnyObject).value(forKey: "rating") as! Int

                                                   let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                
                                                
                                                let imgData = (user as AnyObject).value(forKey: "images") as! NSArray

                                                var getCount : Int = 0
                                                
                                                for getImage in imgData
                                                {
                                                      let image = (getImage as AnyObject).value(forKey: "image") as! String
                                                    
                                                    getCount += 1
                                                    
                                                    if getCount == 1{
                                                         self.arrimage.append(image)
                                                    }
                                                    
                                                   
                                                                                                        
                                                   
                                               }
                                                
                                            self.arrChildCategoryId.append(child_category_id)
                                                self.arrselling_price.append(selling_price)
                                                self.arroriginal_price.append(original_price)
                                                self.arrtotal_discount.append(total_discount)
                                                self.arid.append(self.getId)
                                                self.arrcustomer_id.append(self.getcustomer_id)
                                                self.arrproduct_id.append(self.getproduct_id)
                                                self.arrproduct_name.append(getproduct_name)
                                            //    self.arrStoreName.append(storename!)
                                             
                                                self.arrdescription.append(description)
                                                self.arrwishlist.append(wishlist)
                                                self.arrProductIdType.append(id)
                                                self.arrRating.append("\(rating)")
                                                
                                           
  
                                            }
                                            
//                                            if self.arrcategory_id.count == 1{
//
//                                                       if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                                                               layout.minimumLineSpacing = 10
//                                                               layout.minimumInteritemSpacing = 6
//                                                               layout.sectionInset = UIEdgeInsets(top: 10, left: -130, bottom: 0, right: 15)
//                                                               let size = CGSize(width:(self.collectionView!.bounds.width-30)/2, height: 250)
//                                                               layout.itemSize = size
//                                                       }
//                                                   }
//                                                   else{
//                                                       if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                                                                    layout.minimumLineSpacing = 10
//                                                                    layout.minimumInteritemSpacing = 6
//                                                                    layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 15)
//                                                                    let size = CGSize(width:(self.collectionView!.bounds.width-30)/2, height: 250)
//                                                                    layout.itemSize = size
//                                                            }
//                                                   }
                                            
                                            
                                                                                       DispatchQueue.main.async
                                                                                       {
                                                                                           self.collectionView.reloadData()
                                                                                       }

                                        }
                                        
                                        else{
                                            
                                        }
                                    }
            }

            
        }




}

extension EBookFavoritBookVC :  UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
     
                   let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 3.5
                   layout.minimumInteritemSpacing =  3.5
                         
                         let numberOfItemsPerRow: CGFloat = 2.0
                         let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
                         
                         return CGSize(width: itemWidth, height: 150)
                   
                   
        
        
    }
    
    
    
    
    
    func getAddFavorties(getProductId : String){
        
                let parametersBal: Parameters=[
                        "product_id":getProductId,
                        "customer_id":getUserId


                    ]
                
                print(parametersBal)
                
                    //         add_to_favourite
                   // BasUrl.baseURLPOST + "customer_login"
                   //http://zaarmall.com/development/add_to_wishlist
                Alamofire.request(BasUrl.baseURLPOST + "add_to_wishlist", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                            var data = (result as AnyObject).value(forKey: "data") as! NSDictionary
                                            


                                            
                                            if (status == 200 as CFBoolean )
                                            {

                                                self.getfavouriteProduct()



                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
}
