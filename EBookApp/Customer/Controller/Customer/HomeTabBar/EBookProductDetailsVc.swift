//
//  EBookProductDetailsVc.swift
//  EBookApp
//
//  Created by apple on 22/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
//ProductDetailsTVC
import Alamofire
import SDWebImage
import Kingfisher
 import MBProgressHUD
import SwiftSoup
import Loaf

class ColorType{
    let customid:String
    let Color:Any

    var isSelected: Bool

init(customid customid: String,Color Color: Any,isSelected selected: Bool) {
        self.customid = customid
        self.Color = Color
        self.isSelected = selected

        
    }

}


class EBookProductDetailsVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,FavurtiesttonsDelegetes {
  
 @IBOutlet weak var viewBack1: UIView!
    @IBOutlet weak var viewBack2: UIView!
    @IBOutlet weak var viewBack3: UIView!
    
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnAddtocart: CustomizableButton!
    @IBOutlet weak var btnByNow: CustomizableButton!
    @IBOutlet weak var perstagelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    @IBOutlet weak var authorNamelbl: UILabel!
    @IBOutlet weak var productNamelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var heightHigghlight: NSLayoutConstraint!
    @IBOutlet weak var heightDescription: NSLayoutConstraint!
    
    @IBOutlet weak var lblHighlights: UILabel!
    
    @IBOutlet weak var lblSize: UILabel!
    
     var kingfisherSource = [KingfisherSource]()
    
    @IBOutlet weak var ColorcollectionView: UICollectionView!
    
    var kingfisherSourceProduct = [KingfisherSource]()
    
    @IBOutlet weak var strickethoughtlbl1: UILabel!
    @IBOutlet weak var strickethoughtlbl: UILabel!
   var localSource  = [ImageSource(imageString: "01-4")!, ImageSource(imageString: "02-1")!,ImageSource(imageString: "03-1")!]
   // var localSource: [String] = []
    
    var sliderLabel: UILabel?
    

    var colorArray = [ColorType]()
    var menuList = [String]()
    var colorImageArray = [String]()
    
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnFavrtioes: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
      var bookAuthorImageArray1 = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]

    
    var currentIndex : Int = 0
    
        var estimateWidth = 160.0
        var cellMarginSize = 16.0
        var productIdArray = [String]()
        var productNameArray = [String]()
        var productDescrptionArray = [String]()
        var productSellingPriceArray = [String]()
        var productOriginalPriceArray = [String]()
        var productTotaldiscountArray = [String]()
        var productRatingArray = [String]()
        var productImageArray = [String]()
    
    
    @IBOutlet weak var heightVariable: NSLayoutConstraint!
    
    
        var NameArray = ["Deepak","Jittu","Annu","Ojas"]
        var dayArray = ["1","2","3","4"]
        var ratingArray = ["1.1","2.1","3.1","4.1"]
    
    var strFavouritesChk : String = "true"

    var descriptionArray = ["Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]
    
    var strProductId = String()
    var strProductName = String()
    var strProductDesceription = String()
    var strProductRating = String()
    var strProductImage = String()
    var strProductOrornalPrice = String()
    var strProductSellingPrice = String()
    var strProductTotaldiscount = String()
    
    var getStrproductid = String()
    
  //  var getproductId = String()
    var getproductDetailsByProductId = String()

    
    var getCategoryId = String()
    
   var getProductId = String()
    var getChildId = String()

   var getUserId = String()
  
  

  override func viewDidLoad() {
      super.viewDidLoad()
      
      if getUserId.isEmpty
          {
              getUserId  = UserDefaults.standard.string(forKey: "customer_id")!
          }
        
        collectionView.delegate = self
        collectionView.dataSource = self

    
    ColorcollectionView.delegate = self
             ColorcollectionView.dataSource = self
       // self.setupGridView()

     //   tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

               slideshow.slideshowInterval = 5.0
               slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
            slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
               
               let pageControl = UIPageControl()
               pageControl.currentPageIndicatorTintColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

               pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.pageIndicator = pageControl
        
               slideshow.activityIndicator = DefaultActivityIndicator()
               slideshow.currentPageChanged = { page in
                //   print("current page:", page)
               }
        
//         slideshow.sd_setImage(with:URL(string: "http://zaarmall.com/development/" + localSource), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

        //     slideshow.setImageInputs(localSource)
           
//           let recognizer = UITapGestureRecognizer(target: self, action: #selector(EBookProductDetailsVc.didTap))
//           slideshow.addGestureRecognizer(recognizer)
        

        
            let attributedString = NSMutableAttributedString(string: "$55")

        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))

        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        
        attributedString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.lightGray, range: NSMakeRange(0, attributedString.length))

            strickethoughtlbl1.attributedText = attributedString

           getAllProduct()
            getProductDetails()
    
    
   
    }
    
    func updateMenuObjects() {
        let indexPath = IndexPath(row: currentIndex, section: 0)
        for (index, _) in self.colorArray.enumerated() {
            if index == indexPath.row {
                self.colorArray[index].isSelected = true
            } else {
                self.colorArray[index].isSelected = false
            }
        }
        self.ColorcollectionView.reloadData()
    }
    
        override func viewDidLayoutSubviews()
                {
                    super.viewDidLayoutSubviews()
                    
                    if let layout = ColorcollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                                 layout.minimumLineSpacing = 10
                                 layout.minimumInteritemSpacing = -10
                                 layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                                 let size = CGSize(width:(ColorcollectionView!.bounds.width-10)/3, height: 100)
                                 layout.itemSize = size
                         }
                    
//                    if(collectionView == self.menuCollectionView){
//
//
//                        if let layout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                                layout.minimumLineSpacing = 3
//                                layout.minimumInteritemSpacing = 3
//                                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 5)
//                                let size = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
//                                layout.itemSize = size
//                        }
//
//                    }
//
//
//                   else if(collectionView == self.collectionView){
//
//                    if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                            layout.minimumLineSpacing = -15
//                            layout.minimumInteritemSpacing = -10
//                            layout.sectionInset = UIEdgeInsets(top: -5, left: 1, bottom: 0, right: 5)
//                            let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
//                            layout.itemSize = size
//
//
//
//                    }
//                    }

        //            heightVariableWishlist.constant = collectionView3.contentSize.height
        //
        //             heightVariableCategory.constant = collectionView2.contentSize.height
                    
                //    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                   
                    
                 //   self.scrollView.contentSize = CGSize(width: view.frame.width, height: 1300)
                }
    
    
    
    @IBAction func btnShare(_ sender: Any) {
       // btnShare.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)

    }
    @IBAction func btnFavrtioes(_ sender: Any) {
        getAddFavorties()
        
        
    }
    
    
    func getAddToCartProductDetailsData(){
        
                let parametersBal: Parameters=[
                  "product_id":getProductId,
                  "customer_id":getUserId,
                    "custom_id":"1",
                    "quantity":"1",
                    "type":"Add"
        ]
                
        
//        product_id:2
//        customer_id:2
//        custom_id:2
//        quantity:2
//        type:Add/Remove
        
                print(parametersBal)

                // BasUrl.baseURLPOST + "customer_login"
                //"http://zaarmall.com/development/add_to_cart"

                Alamofire.request(BasUrl.baseURLPOST + "add_to_cart", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                     //   print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            

                                            print(jsonData)

                                            
                                            if strStatus == 200
                                            {
                                                
                                                
                                                
                                                
//                                                for case let getInstallment in ((jsonData["getProductsData"] as? [AnyObject]))!
//                                                {
//
//                                                    let product_id = getInstallment["product_id"] as? String
//                                                    let store_id = getInstallment["store_id"] as? String
//                                                    let category_id = getInstallment["category_id"] as? String
//                                                    let child_category_id = getInstallment["child_category_id"] as? String
//                                                    let product_name = getInstallment["product_name"] as? String
//                                                    let brand = getInstallment["brand"] as? String
//                                                    let description = getInstallment["description"] as? String
//                                                    let selling_price = getInstallment["selling_price"] as? String
//                                                    let original_price = getInstallment["original_price"] as? String
//                                                    let total_discount = getInstallment["total_discount"] as? String
//                                                    let stock_quantity = getInstallment["stock_quantity"] as? String
//
//                                                    let store_name = getInstallment["store_name"] as? String
//                                                    let category_name = getInstallment["category_name"] as? String
//                                                    let sub_category_name = getInstallment["sub_category_name"] as? String
//                                                    let rating = getInstallment["rating"] as? String
//
//
//
//                                                    for case let getImage in ((getInstallment["image"] as? [AnyObject]))!{
//                                                           let image = getImage["image"] as? String
//
//                                                            self.arrimage.append(image!)
//
//                                                    }
//
//                                                    self.arrproduct_id.append(product_id!)
//                                                    self.arrStoreId.append(store_id!)
//                                                    self.arrcategory_id.append(category_id!)
//                                                    self.arrchild_category_id.append(child_category_id!)
//                                                    self.arrproduct_name.append(product_name!)
//                                                    self.arrbrand.append(brand!)
//                                                    self.arrdescription.append(description!)
//                                                    self.arrselling_price.append(selling_price!)
//                                                    self.arroriginal_price.append(original_price!)
//
//
//                                                    self.arrtotal_discount.append(total_discount!)
//                                                   self.arrstock_quantity.append(stock_quantity!)
//                                                   self.arrstore_name.append(store_name!)
//                                                   self.arrcategory_name.append(category_name!)
//
//                                                    self.arrsub_category_name.append(sub_category_name!)
//
//                                                    self.arrrating.append(rating!)
//
//
//
//                                                }
                                                
                                                  Loaf("Successfully added in cart", state: .success, location: .bottom, sender: self).show()

//                                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                                                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
//                                                self.present(nextViewController, animated:true, completion:nil)
                                             

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
    
    
    
    @IBAction func btnCart(_ sender: Any) {
        
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
         self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
//            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//                return 3
//            }
//
//            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTVC", for: indexPath) as!ProductDetailsTVC
//
//
//
//
//
//                cell.namelbl.text = NameArray[indexPath.row]
//                cell.daylbl.text = dayArray[indexPath.row]
//                cell.ratinglbl.text = ratingArray[indexPath.row]
//
//                cell.descrptionlbl.text = descriptionArray[indexPath.row]
//
//
//
//
//
//
//
//
//
//                return cell
//
//    }
    
//        override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//
//
////            if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
////                    layout.minimumLineSpacing = 10
////                    layout.minimumInteritemSpacing = 5
////                    layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
////                    let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 250)
////                    layout.itemSize = size
////            }
//
//        }
    
    
    @IBAction func btnRateThisProduct(_ sender: Any) {
    }
    
    
    @IBAction func btnViewAll(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSelectSubCategoryProductVc") as! EBookSelectSubCategoryProductVc
        
        nextViewController.getCategoryId = getCategoryId
        nextViewController.getChildCategoryId = getChildId
      
      
        
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnViewAllRatings(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookReViewsAllVc") as! EBookReViewsAllVc
        nextViewController.getProductId = getProductId
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnBuyNow(_ sender: Any) {
        
        
                    btnAddtocart.backgroundColor = .clear
                    btnByNow.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

        
                    btnByNow.setTitleColor(UIColor.white, for: .normal)
                    btnAddtocart.setTitleColor(UIColor.black, for: .normal)


        
        
        
        btnByNow.layer.cornerRadius = 18
        btnByNow.layer.borderWidth = 1
        var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnByNow.layer.borderColor = red.cgColor



        btnAddtocart.layer.cornerRadius = 18
        btnAddtocart.layer.borderWidth = 1
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnAddtocart.layer.borderColor = red1.cgColor

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPatmentVc") as! EBookPatmentVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnAddtoCart(_ sender: Any) {
        //EBookCustomerAddCarrtVc
        
                    btnByNow.backgroundColor = .clear
                    btnAddtocart.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

        
                    btnAddtocart.setTitleColor(UIColor.white, for: .normal)
                    btnByNow.setTitleColor(UIColor.black, for: .normal)


        
        
        
        btnAddtocart.layer.cornerRadius = 18
        btnAddtocart.layer.borderWidth = 1
        var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnAddtocart.layer.borderColor = red.cgColor



        btnByNow.layer.cornerRadius = 18
        btnByNow.layer.borderWidth = 1
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnByNow.layer.borderColor = red1.cgColor

getAddToCartProductDetailsData()
        


    }
    
//        func setupGridView() {
//            let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//            flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
//            flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
//        }

//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
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
//        }

    
    func FavurtiesButton(_ sender:EBookCVC)
        {
            var cel = EBookCVC()
                       let cell = sender.tag
                      let buttonPosition = sender.convert(CGPoint.zero, to: collectionView)
                        print(buttonPosition)
            guard let indexPath = self.collectionView.indexPathForItem(at: buttonPosition) else {
                            return
                        }
                        print(indexPath.row)
                       let currentCell = collectionView.cellForItem(at: indexPath) as! EBookCVC
            
            let parametersBal: Parameters=[
                "product_id":productIdArray[indexPath.row],
                "customer_id":getUserId

                ]
    
            
            print(parametersBal)
            
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

                                            print("sucess")
                                            sender.btnFavuties.setImage(UIImage(named: "favorite-(1)-1"), for: .normal)
                                             
                                            DispatchQueue.main.async {
                                                self.collectionView.reloadData()
                                                
                                            }



                                        }
                                        else{
                                            
                                        }

                                    }


            }
            

            


    }


        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            var count : Int = 0
            if collectionView == self.collectionView{
               count =  productNameArray.count
            }
            else{
                count = colorArray.count
            }
            return  count
            
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            var cellToReturn = UICollectionViewCell()
            
            if collectionView == self.collectionView{
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookCVC", for: indexPath) as? EBookCVC
                         
                         cell?.editData = self as  FavurtiesttonsDelegetes
                         //cell?.tag = indexPath.row

                         cell?.bookTitles.text = productNameArray[indexPath.row]
                         cell?.Authornamelbl.text = productDescrptionArray[indexPath.row]
                         cell?.amountlbl.text = productSellingPriceArray[indexPath.row]
                         //cell?.bookImage.image = pro
                         cell?.ratingslbl.text = productRatingArray[indexPath.row]
                     //    cell?.amountlbl1.text = productOriginalPriceArray[indexPath.row]
                         
                         
                         let getUrl = productImageArray[indexPath.row].replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                         // BasUrl.baseURLPOST + "customer_login"

                         cell?.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)


                         
                             let attributedString = NSMutableAttributedString(string: "$55")

                         attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))

                         attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
                         
                        cellToReturn = cell!
                 }
            else{

                  let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCellVC", for: indexPath) as? ColorCellVC
                                 let menuObject = colorArray[indexPath.row]
                                 firstcell?.colorView.backgroundColor = colorArray[indexPath.row].Color as! UIColor
                                 if indexPath.row == 0{
                                 firstcell?.layer.borderWidth = 1
                                     var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1)
                                     firstcell?.layer.borderColor = red1.cgColor
                                 }
                                 
                                 if menuObject.isSelected {
                                     firstcell?.layer.borderWidth = 1
                                         var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1)
                                         firstcell?.layer.borderColor = red1.cgColor


                                 }
                                 else{
                                     firstcell?.layer.borderWidth = 1
                                         var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1)
                                         firstcell?.layer.borderColor = red1.cgColor


                                     
                                 }
                cellToReturn = firstcell!
            }
        //        cell?.amountlbl1.attributedText = attributedString


      //      cell?.perstagelbl.text = productTotaldiscountArray[indexPath.row]
      //      cell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)


            return cellToReturn
        }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookCVC", for: indexPath) as? EBookCVC
//
//        let get = productNameArray[indexPath.row]
//        cell?.Authornamelbl.text = productDescrptionArray[indexPath.row]
//
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.ColorcollectionView{
            self.currentIndex = indexPath.row
            ColorcollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            for (index, _) in self.colorArray.enumerated() {
                if index == indexPath.row {
                    self.colorArray[index].isSelected = true



                } else {
                    self.colorArray[index].isSelected = false
                }
            }

             self.kingfisherSource.removeAll()
            
            for colorImag in colorImageArray{
             //   let  image = colorImag[indexPath.row]
                   //       print(image)
                // BasUrl.baseURLPOST + "customer_login"

                          let geturl1 = NSURL(string:BasUrl.baseURLPOST + colorImag)
                          print(geturl1)

                          if geturl1 != nil{


                              self.kingfisherSource.append(KingfisherSource(url: geturl1! as! URL))

                              print(self.kingfisherSource)

                          }



                          self.slideshow.setImageInputs(self.kingfisherSource)
                          print(self.slideshow)

                          ColorcollectionView.reloadData()
            }

          
        }
      


    }
    
    
        @objc func thumbsUpButtonPressed() {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
            self.present(nextViewController, animated:true, completion:nil)


            
        }


    func getAddFavorties(){
        
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
               
        
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
                                                MBProgressHUD.hide(for: self.view, animated: true)
                                         //       Layer-24-copy
                                                if self.strFavouritesChk == "true"
                                                {
                                                    self.strFavouritesChk = "false"
                                                    self.btnFavrtioes.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)

                                                }
                                                else{
                                                    self.strFavouritesChk = "true"
                                                    self.btnFavrtioes.setImage(UIImage(named:"Layer-24-copy"), for: .normal)
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
    
    
        func getAllProduct(){

                    let parametersBal: Parameters=[
                        "customer_id":getUserId,
                        "child_category_id":getChildId
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


                                                var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                              //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                                var data = (result as AnyObject).value(forKey: "getProductsData") as! NSArray


                                                
                                                


                                                if (status == 200 as CFBoolean )
                                                {

                                                    print("hiiii")
                                                      for user in data
                                                      {

                                                        self.strProductId = (user as AnyObject).value(forKey: "product_id") as! String
                                                        self.productIdArray.append(self.strProductId)
                                                        

                                                        let strBrandName = (user as AnyObject).value(forKey: "brand") as! String
                                                        
                                                        UserDefaults.standard.set(self.strProductId, forKey: "product_id")
                                                        UserDefaults.standard.synchronize()



                                                        let category_id = (user as AnyObject).value(forKey: "category_id") as! String

                                                        UserDefaults.standard.set(category_id, forKey: "category_id")
                                                        UserDefaults.standard.synchronize()







                                                        let sub_category_id = (user as AnyObject).value(forKey: "sub_category_id") as! String



                                                        UserDefaults.standard.set(sub_category_id, forKey: "sub_category_id")
                                                        UserDefaults.standard.synchronize()


                                                        let child_category_id = (user as AnyObject).value(forKey: "child_category_id") as! String



                                                        UserDefaults.standard.set(child_category_id, forKey: "child_category_id")
                                                        UserDefaults.standard.synchronize()


                                                        self.strProductName = (user as AnyObject).value(forKey: "product_name") as! String
                                                        self.productNameArray.append(self.strProductName)


                                                        UserDefaults.standard.set(self.strProductName, forKey: "product_name")
                                                        UserDefaults.standard.synchronize()


                                                        self.strProductDesceription = (user as AnyObject).value(forKey: "description") as! String

                                                        let str = self.strProductDesceription.replacingOccurrences(of: "<p>dsfdsf</p>\r\n", with: "", options: .regularExpression, range: nil)
                                                        print(str)
                                                        self.productDescrptionArray.append(self.strProductDesceription)



                                                        UserDefaults.standard.set(self.strProductDesceription, forKey: "description")
                                                        UserDefaults.standard.synchronize()




                                                        self.strProductSellingPrice = (user as AnyObject).value(forKey: "selling_price") as! String

                                                        self.productSellingPriceArray.append(self.strProductSellingPrice)

                                                        UserDefaults.standard.set(self.strProductSellingPrice, forKey: "selling_price")
                                                        UserDefaults.standard.synchronize()


                                                        self.strProductOrornalPrice = (user as AnyObject).value(forKey: "original_price") as! String

                                                        self.productOriginalPriceArray.append(self.strProductOrornalPrice)

                                                        UserDefaults.standard.set(self.strProductOrornalPrice, forKey: "original_price")
                                                        UserDefaults.standard.synchronize()

                                                        self.strProductTotaldiscount = (user as AnyObject).value(forKey: "total_discount") as! String

                                                        
                                                        self.productTotaldiscountArray.append(self.strProductTotaldiscount)

                                                        UserDefaults.standard.set(self.strProductTotaldiscount, forKey: "total_discount")
                                                        UserDefaults.standard.synchronize()

                                                        let stock_quantity = (user as AnyObject).value(forKey: "stock_quantity") as! String

                                                        UserDefaults.standard.set(stock_quantity, forKey: "stock_quantity")
                                                        UserDefaults.standard.synchronize()

                                                        let is_delete = (user as AnyObject).value(forKey: "is_delete") as! String

                                                        UserDefaults.standard.set(is_delete, forKey: "is_delete")
                                                        UserDefaults.standard.synchronize()


                                                        let created_date = (user as AnyObject).value(forKey: "created_date") as! String

                                                        UserDefaults.standard.set(created_date, forKey: "created_date")
                                                        UserDefaults.standard.synchronize()

                                                        let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                        self.productRatingArray.append(rating)


                                                        UserDefaults.standard.set(rating, forKey: "rating")
                                                        UserDefaults.standard.synchronize()

                                                        let wishlist = (user as AnyObject).value(forKey: "wishlist") as? String

                                                        UserDefaults.standard.set(wishlist, forKey: "wishlist")
                                                        UserDefaults.standard.synchronize()



                                                        let caption = (user as AnyObject).value(forKey: "image") as! NSArray


                                                        for imagearray in caption
                                                        {
                                                            
                                                            
                                                            self.strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                            
                                                            self.productImageArray.append(self.strProductImage)
                                                            
                                                            // BasUrl.baseURLPOST + "customer_login"

                                                            let geturl = NSURL(string: BasUrl.baseURLPOST + self.strProductImage)
                                                            
                                                            if geturl != nil{
                                                                
                                                                self.kingfisherSource.append(KingfisherSource(url: geturl! as URL))
                                                                
                                                            }

                                                        

                                                    }
                                                        
                                            


                                                }
                                                   
                                                    DispatchQueue.main.async{
                                                        if self.productNameArray.isEmpty{
                                                                                                         
                                                                                                         
                                                            self.heightVariable.constant = 0
                                                            let getHeight = self.collectionView.contentSize.height
                                                            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300 - getHeight)
                                                            
                                                        }
                                                        else{
                                                            self.heightVariable.constant = self.collectionView.contentSize.height
                                    
                                                        }
                                                    }
                                                    
                                             
                                                    

                                                   DispatchQueue.main.async {
                                                      self.collectionView.reloadData()
                                                    self.ColorcollectionView.reloadData()
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

    func getProductDetails(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
              
        
        let parametersBal: Parameters=[
                "product_id":getProductId,
                "customer_id":getUserId


            ]
        
        print(parametersBal)
        
        // BasUrl.baseURLPOST + "customer_login"
        //http://zaarmall.com/development/product_details

        
        Alamofire.request(BasUrl.baseURLPOST + "product_details"
, method: .post, parameters: parametersBal).responseJSON
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
                                      
                                                                                      
                                        
                                         if let getInstallment = jsonData["getProductsData"] as? [String: Any]
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
                                                   //  let custom_id = getInstallment["custom_id"] as? String
                                            
                                            
                                                       let store_name = getInstallment["store_name"] as? String
                                                       let category_name = getInstallment["category_name"] as? String
                                                       let sub_category_name = getInstallment["sub_category_name"] as? String
                                                       let rating = getInstallment["rating"] as? String
                                                     
                                            let highlight = getInstallment["highlight"] as? String
                                            
                                            self.lblHighlights.attributedText = highlight?.htmlToAttributedString
                                            
                                            self.lblDescription.attributedText = description?.htmlToAttributedString
                                            
                                            
                                            let font = UIFont(name: "Helvetica", size: 14.0)
                                            
                                            

                                            
//                                            let getHeightHighlight = highlight?.htmlToAttributedString
//
//                                            let getHeightDescription = description?.htmlToAttributedString
                                            
                                            guard let doc: Document = try? SwiftSoup.parse(highlight!) else { return } // parse html
                                            guard let txt = try? doc.text() else { return }
                                            print(txt)
                                          
                                            let getHeightDescription = self.heightForView(text: txt, font: font!, width: 165.0)


                                            guard let docDescription: Document = try? SwiftSoup.parse(description!) else { return } // parse html
                                            guard let txt2 = try? docDescription.text() else { return }
                                            print(txt)
                                             let getHeightHighlight = self.heightForView(text: txt2, font: font!, width: 165.0)
                                            
                                         
                                            
                                              
                                            print(getHeightDescription,getHeightHighlight)
                                            //    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                                            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300 + getHeightDescription + getHeightHighlight)
                                                                                       
                                            
                                         //      self.authorNamelbl.text = brand
                                                                                           
                                               self.productNamelbl.text = product_name
                                               
                                            self.pricelbl.text = "$ \(selling_price ?? "10")"
                                               
                                               self.strickethoughtlbl1.text = original_price
                                              
                                            self.perstagelbl.text = "\(total_discount ?? "10")%"

                                            if original_price != nil && selling_price != nil
                                            {
                                                let getOffValue = Float(original_price!)! - Float(selling_price!)!
                                                
                                             //   self.strickethoughtlbl.text = String(getOffValue)
                                                
                                            }
                                            
                                            
                                             
                                             
                                                       
                                                       
                                                       for case let getImage in ((getInstallment["images"] as? [AnyObject]))!{
                                                              let image = getImage["image"] as? String
                                                           

                                                        let getUrl = image?.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                         
                                                        // BasUrl.baseURLPOST + "customer_login"

                                                        let geturl = NSURL(string: BasUrl.baseURLPOST + getUrl!)
                                                          
                                                        
                                                          if geturl != nil
                                                          {
                                                            
                                                            self.kingfisherSourceProduct.append(KingfisherSource(url: geturl! as URL))
                                                                                                                                                                                                   
                                                          }
                                                      
                                            }
                                                       
                                       
                                                       self.slideshow.setImageInputs(self.kingfisherSourceProduct)
                                                
                                            
                                            var count : Int = 0
                                            
                                                       for case let getCustomizable in ((getInstallment["Customizable"] as? [AnyObject]))!{
                                                              let size = getCustomizable["size"] as? String
                                                        
                                                        let color = getCustomizable["color"] as? String
                                                           
                                                        let custom_id = getCustomizable["custom_id"] as? String
                                                     let strColor = self.hexStringToUIColor(hex: color ?? "#ffffff")
                                                        
                                                        self.colorArray.append(ColorType(customid: custom_id!, Color: strColor, isSelected: false))
                                                        
                                                        count += 1
                                                        
                                                        print(color,size)
                                                        
                                                        self.lblSize.text = size
                                                        
                                                    //    self.viewBack.backgroundColor = UIColor(named: color)
                                                        
                                                        let Strcustomizeimage = getCustomizable["customize_image"] as? String

                                                        
                                                        let array = Strcustomizeimage!.components(separatedBy: ",")
                                                        for ImageArray in array
                                                        {
                                                            
                                                            self.colorImageArray.append(ImageArray)
                                                        }
                                                        
                                                        print(self.colorImageArray)
                                                        
                                                        
                                                        
                                                        
                                                        
                                            
                                                        
                                                        
                                                        
                                                     //   self.viewBack.backgroundColor = UIColor.color1
                                                        
                                                      
                                            }
                                            
                                            
                                                   
                                            
                                        }
                                        
                                        self.colorArray.append(ColorType(customid: "", Color: UIColor.white, isSelected: false))



                                            
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
    
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }

        
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
        
    }




extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
