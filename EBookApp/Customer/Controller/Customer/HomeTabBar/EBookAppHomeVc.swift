//
//  EBookAppHomeVc.swift
//  EBookApp
//
//  Created by apple on 20/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Segmentio
import Alamofire
import SDWebImage
import MBProgressHUD
import Kingfisher

struct UserCategory {
    var categoryId:String
    var name: String
    var isSelected: Bool
    
    init(withTitle title: String, isSelected selected: Bool,categoryId:String) {
        self.name = title
        self.isSelected = selected
        self.categoryId = categoryId
    }
}


struct TopProduct {
    var categoryId:String
    var name: String
    var isSelected: Bool
    var Subtitle:String
    var storeName: String
    var OriginalPrice: String
    var PercentPrice:String
    var CutPrice: String
    var imgUrl: String
    var rating: String
    var productid: String
    
    init(withTitle title: String, isSelected selected: Bool,categoryId:String,Subtitle:String,storeName:String,OriginalPrice:String,PercentPrice:String,CutPrice:String,imgUrl:String,rating:String,productid:String) {
        self.name = title
        self.isSelected = selected
        self.categoryId = categoryId
        
        self.Subtitle = Subtitle
        self.storeName = storeName
        self.OriginalPrice = "د.ع" + OriginalPrice
        self.PercentPrice = PercentPrice + "%"
        self.CutPrice = "د.ع" + CutPrice
        self.imgUrl = imgUrl
        self.rating = rating
         self.productid = productid

    }
}



struct TopFeaturedProduct {
    var categoryId:String
    var name: String
    var isSelected: Bool
    var Subtitle:String
    var storeName: String
    var OriginalPrice: String
    var PercentPrice:String
    var CutPrice: String
    var imgUrl: String
    var rating: String
     var productid: String
    
    init(withTitle title: String, isSelected selected: Bool,categoryId:String,Subtitle:String,storeName:String,OriginalPrice:String,PercentPrice:String,CutPrice:String,imgUrl:String,rating:String,productid:String) {
        self.name = title
        self.isSelected = selected
        self.categoryId = categoryId
        
        self.Subtitle = Subtitle
        self.storeName = storeName
        self.OriginalPrice = "د.ع" + OriginalPrice
        self.PercentPrice = PercentPrice + "%"
        self.CutPrice = "د.ع" + CutPrice
        self.imgUrl = imgUrl
        self.rating = rating
         self.productid = productid
    }
}



struct AllNewBookAdded {
    var categoryId:String
    var name: String
    var isSelected: Bool
    var Subtitle:String
    var storeName: String
    var OriginalPrice: String
    var PercentPrice:String
    var CutPrice: String
    var imgUrl: String
    var rating: String
    var productid: String
    
    init(withTitle title: String, isSelected selected: Bool,categoryId:String,Subtitle:String,storeName:String,OriginalPrice:String,PercentPrice:String,CutPrice:String,imgUrl:String,rating:String,productid:String) {
        self.name = title
        self.isSelected = selected
        self.categoryId = categoryId
        
        self.Subtitle = Subtitle
        self.storeName = storeName
        self.OriginalPrice = "د.ع" + OriginalPrice
        self.PercentPrice = PercentPrice + "%"
        self.CutPrice = "د.ع" + CutPrice
        self.imgUrl = imgUrl
        self.rating = rating
         self.productid = productid
    }
}




struct NewProductAdded {
    var categoryId:String
    var name: String
    var isSelected: Bool
    var Subtitle:String
    var storeName: String
    var OriginalPrice: String
    var PercentPrice:String
    var CutPrice: String
    var imgUrl: String
    var rating: String
    var productid: String
    
    init(withTitle title: String, isSelected selected: Bool,categoryId:String,Subtitle:String,storeName:String,OriginalPrice:String,PercentPrice:String,CutPrice:String,imgUrl:String,rating:String,productid:String) {
        self.name = title
        self.isSelected = selected
        self.categoryId = categoryId
        
        self.Subtitle = Subtitle
        self.storeName = storeName
        self.OriginalPrice = "د.ع" + OriginalPrice
        self.PercentPrice = PercentPrice + "%"
        self.CutPrice = "د.ع" + CutPrice
        self.imgUrl = imgUrl
        self.rating = rating
 self.productid = productid
    }
}


//EBFavurtiesttonsDelegetes

class EBookAppHomeVc: UIViewController,UITextFieldDelegate, EBFavurtiesttonsDelegetes {
    func FavurtiesButton(_ sender: EBFavouriteCVC) {
        
    }
    
//    func FavurtiesButton(_ sender: EBFavouriteCVC) {
//            var cel = EBFavouriteCVC()
//                               let cell = sender.tag
//                              let buttonPosition = sender.convert(CGPoint.zero, to: collectionView3)
//                                print(buttonPosition)
//                                 let indexPath = self.collectionView3.indexPathForItem(at: buttonPosition)
//          print(indexPath!.row)
//          let currentCell = collectionView3.cellForItem(at: indexPath!)
//
//          self.getAddFavorties(getProductId: arrproduct_id[indexPath!.row])
//    }
    

    
    
    
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
    
    //UserSubCategoryCvC
    @IBOutlet weak var heightVariable: NSLayoutConstraint!
    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPincode: UILabel!
    

    @IBOutlet weak var newCategoryStack: UIStackView!
    
    @IBOutlet weak var heightVariableNewProduct: NSLayoutConstraint!
    
    @IBOutlet weak var heightVariableWishlist: NSLayoutConstraint!
    @IBOutlet weak var getCartValue: UILabel!
    
    
    var arrTopProduct = [TopProduct]()
    var arrNewProductAdded = [NewProductAdded]()
    
    
    var arrAllNewBookAdded = [AllNewBookAdded]()
    var arrTopFeaturedProduct = [TopFeaturedProduct]()
    
    
    fileprivate var currentStyle = SegmentioStyle.onlyImage
    @IBOutlet weak var SearchText: UITextField!
    
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionView4: UICollectionView!
    @IBOutlet weak var collectionView5: UICollectionView!
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var heightVariableView: NSLayoutConstraint!

    @IBOutlet weak var heightVariableSubCategory: NSLayoutConstraint!
    
    var strCategoryName = String()
    var userArray: [UserCategory] = []
   // var menuList = ["Women","Male","Electornic","Books","Author","All"]
    var menuList = [String]()
    var userCategoryIdArray = [String]()

    var indicator: MaterialLoadingIndicator!
       

    @IBOutlet weak var scrollView: UIScrollView!
    
    //var ProductArray = [UserSubCategory]()
    var productNameArray = ["Sweatshirt","Shoe","T-Shirt","Dress","Perfume","Shirt"]
    //var productNameArray = [String]()
//    var productImageArray = [UIImage (named:"01-4"),UIImage(named:"02-1"),UIImage(named:"03-1"),UIImage(named:"04-1"),UIImage(named:"05"),UIImage(named:"03-1"),]
    
//    var offerImageArray = [UIImage (named:"06"),UIImage(named:"07"),UIImage(named:"08"),UIImage(named:"09"),UIImage(named:"10"),UIImage(named:"12"),UIImage(named:"13 "),UIImage (named:"06"),UIImage(named:"07"),UIImage(named:"08"),UIImage(named:"09"),UIImage(named:"10"),UIImage(named:"12"),UIImage(named:"13 ")]


    var currentIndex: Int = 0
    
    @IBOutlet weak var slideshow: ImageSlideshow!
//OfferCategoryTVC
    var localSource  = [ImageSource(imageString: "banner1")!, ImageSource(imageString: "banner2")!,
                        ImageSource(imageString: "banner3")!, ImageSource(imageString: "banner4")!,
                        ImageSource(imageString: "banner5")!]
    
    
    
    
    
    var getStrCategoryId = String()
    var CategoryId = String()
    var Categoryname = String()

     var Categoryimage = String()

     var Categoryis_active = String()

     var Categoryis_delete = String()

     var Categorycreate_date = String()
     
    
    var strSelectCategory = String()
    
    var getSubCategoryId = String()
    var strCategoryId = String()

    var SubCategoryname = String()

     var SubCategoryimage = String()

     var SubCategoryis_active = String()

     var SubCategoryis_delete = String()

     var SubCategorycreate_date = String()
    var SubCategoryNameArray = [String]()
    var SubCategoryImageArray = [String]()
   
    
     var arrsubcategoryid = [String]()
    var arrcategoryid = [String]()
    var arrchildcategoryid = [String]()
    var arrsellingprice = [String]()
    var arrtotaldiscount = [String]()
    var arrcategoryname = [String]()
    var arrsubcategoryname = [String]()
    var arrbrand = [String]()
    var arrdescription = [String]()
    var arroriginalprice = [String]()
    var arrstorename = [String]()
    
    var arrRating = [String]()
    
    
    var arrAllProductId = [String]()
       
       var arrchild_category_id = [String]()
    
    
     
 var arrStoreId = [String]()

    var kingfisherSource = [KingfisherSource]()
      
    var kingfisherSourcebanner = [KingfisherSource]()
    
    var kingfisherSource2 = [KingfisherSource]()
    
    var SubCategoryname2 = String()
     var SubCategoryimage2 = String()
     var SubCategoryis_active2 = String()
     var SubCategoryis_delete2 = String()
     var SubCategorycreate_date2 = String()
    var SubCategoryNameArray2 = [String]()
    var SubCategoryImageArray2 = [String]()
    var SubCategoryIdArray2 = [String]()
    var arrStoreId2 = [String]()
    
    
    var arrproduct_id = [String]()
    
    
    var arrwhislistchildcategoryid = [String]()
    
    
     var arrselling_price = [String]()
     var arroriginal_price = [String]()
     var arrtotal_discount = [String]()
     var arid = [String]()
     var arrcustomer_id = [String]()

     var arrproduct_name = [String]()
     var arrcategory_id = [String]()
     var arrFavdescription = [String]()
     var arrwishlist = [Int]()
     
     var arrimage = [String]()
    
     var getUserId = String()
    var getAddress = String()
    var getPincode = String()
    

    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           self.configViews()
       
        
//        self.collectionView2.isHidden = true
//        self.collectionView3.isHidden = true
        
        if getUserId.isEmpty
            {
                getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
            }
        
        if getAddress.isEmpty
              {
                  getAddress  = UserDefaults.standard.string(forKey: "getFullAddress") ?? "Indore,Vijay nagar"
                
                lblAddress.text = getAddress
              }
        
        if getPincode.isEmpty
              {
                  getPincode  = UserDefaults.standard.string(forKey: "getPincode") ?? "1"
              }

        
//        getSubCategory()
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
     
        collectionView2.delegate = self
        collectionView2.dataSource = self
            
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        collectionView3.delegate = self
//        collectionView3.dataSource = self
        
      
        self.setupDataSrource()
        self.initialSetup()
        
               slideshow.slideshowInterval = 5.0
               slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIView.ContentMode.scaleToFill

               let pageControl = UIPageControl()
               pageControl.currentPageIndicatorTintColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
               pageControl.pageIndicatorTintColor = UIColor.lightGray
                //UIColor(red: 15/255.0, green: 110/255.0, blue: 170/255.0, alpha: 1.0)
               slideshow.pageIndicator = pageControl

               // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
               slideshow.activityIndicator = DefaultActivityIndicator()
               slideshow.currentPageChanged = { page in
                   //print("current page:", page)
               }

        slideshow.setImageInputs(localSource)
           
           let recognizer = UITapGestureRecognizer(target: self, action: #selector(EBookAppHomeVc.didTap))
           slideshow.addGestureRecognizer(recognizer)

        
        
        
            getCategory()
        
        getSubCategory(getId: "1")

        get_All_Offer_BannerCategories()
        
        getSubCategoryDetails2(getId: "")
        gettop_featured_productsDetails2(getId: "")
        get_all_new_books_addedDetails2(getId: "")
        get_all_productDetails2(getId : "")
        getfavouriteProduct()
    }
    
    
    @IBAction func searchAction(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBSearchVC") as! EBSearchVC
                        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    
    func configViews() {
           
           indicator = MaterialLoadingIndicator(frame: CGRect(x:0, y:0, width: 30, height: 30))
           indicator.indicatorColor = [UIColor.red.cgColor, UIColor.blue.cgColor]
           indicator.center = self.view.center
           self.view.addSubview(indicator)
           indicator.startAnimating()
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
    
          getProductDetailsData()
      }
    
    

    func getProductDetailsData(){
        
                let parametersBal: Parameters=[
                    "customer_id":getUserId
        ]
                
                print(parametersBal)

                // BasUrl.baseURLPOST + "customer_login"
                 //"http://zaarmall.com/development/get_my_cart"

                Alamofire.request(BasUrl.baseURLPOST + "get_my_cart", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            let jsonData = result as! NSDictionary

                                                                           
                                           let strMessage = jsonData["message"] as? String
                                           
                                           let strStatus = jsonData["status"] as? Int
                                            

                                            
                                       
                                            var getCount : Int = 0
                                       
                                            
                                     
                                            
                                            if strStatus == 200
                                            {
                                                  
                                                for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                {
                                                    
                                                    getCount += 1
                                                    
                                                    self.getCartValue.text = "\(getCount)"
                                                    
                                                }
                                          
                                              


                                            }
                                            else{
                                             
                                                self.getCartValue.text = "0"
                                                
                                            }

                                        }
                                        else{
                                         
                                            
                                        }


                }
                

        
    }
    
    
    
    @IBAction func unwindToHomeView(toCreateOrder segue: UIStoryboardSegue) {
            
//         if let EBAddAddressVC = segue.source as?
//                    EBAddAddressVC
//                {
//                    if let SortOrder = EBAddAddressVC.getAddress {
//
//                        print(SortOrder)
//                    }
//        }
        
        

        
        
        }
    
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

//    @IBAction func searchAction(_ sender: Any)
//    {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//         
//                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBRequestVC") as! EBRequestVC
//                 self.present(nextViewController, animated:true, completion:nil)
//    }
    

    
    
//        override func viewDidLayoutSubviews()
//        {
//            super.viewDidLayoutSubviews()
//
//            if(collectionView == self.menuCollectionView){
//
//
//                if let layout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                        layout.minimumLineSpacing = 3
//                        layout.minimumInteritemSpacing = 3
//                        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 5)
//                        let size = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
//                        layout.itemSize = size
//                }
//
//            }
//
//
//           else if(collectionView == self.collectionView){
//
//            if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
//                    layout.minimumLineSpacing = -15
//                    layout.minimumInteritemSpacing = -10
//                    layout.sectionInset = UIEdgeInsets(top: -5, left: 1, bottom: 0, right: 5)
//                    let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
//                    layout.itemSize = size
//
//
//
//            }
//            }
//
//            self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
//
//            self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//
//
//
////            heightVariableWishlist.constant = collectionView3.contentSize.height
////
////             heightVariableCategory.constant = collectionView2.contentSize.height
//
//        //    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//
//        }
    
    
    

        func get_All_Offer_BannerCategories(){
           // MBProgressHUD.showAdded(to: self.view, animated: true)
            
            self.kingfisherSourcebanner.removeAll()
            // BasUrl.baseURLPOST + "customer_login"
            //http://zaarmall.com/development/get_all_offer_banner
            Alamofire.request(BasUrl.baseURLPOST + "get_all_offer_banner", method: .post, parameters: nil, headers: nil).responseJSON { (response) in
                print(response)
                                                   
                                                   //getting the json value from the server
                                                   if let result = response.result.value
                                                       {
                       //                                       response in
                       //                                       print("Response is:",response)
                                                           
                                                           let response = result as! NSDictionary
                                                        
                                                        guard let getStatus = response["status"] as? Int else {
                                                            // Value requirements not met, do something
                                                            
                                                            return
                                                        }
                                                        
                                                        MBProgressHUD.hide(for: self.view, animated: true)
                                                                                                                 
            
                                                        if getStatus == 200{
                                                            
                                                            for getData in ((response["data"] as? [AnyObject]))!
                                                            {
                                                                let getBanner_Image = getData["image"] as? String
                                                                
                                                                let getString = getBanner_Image

                                                                let getUrl = getString?.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)

                                                                
                                                                 
                                                                
                                                                let geturl = NSURL(string: "http://116.75.243.44:8080/development/uploads/offer/" + getUrl!)
                                                                
                                                          if geturl != nil
                                                          {
                    
                                                        
                                                            
                                                                self.kingfisherSourcebanner.append(KingfisherSource(url: geturl! as URL))
                                                                                       
                                                            }
                                                               
                                                                
                                                            }
                                                            
                                                            DispatchQueue.main.async{
                                                                self.slideshow.setImageInputs(self.kingfisherSourcebanner)
                                                                
                                                            }
                                                          
                                                        }
                                                        
                                                        
            }
            }
    //        MBProgressHUD.showAdded(to: self.view, animated: true)
    //
    //        AuthService.instance.getAllbannerImages(completion: { (success) in
    //                   if success {
    //                         MBProgressHUD.hide(for: self.view, animated: true)
    //                         //  self.tblView.reloadData()
    //               //     slideshow.setImageInputs(kingfisherSource)
    //
    //
    //
    //                       }
    //                       else{
    //                           MBProgressHUD.hide(for: self.view, animated: true)
    //
    //
    //                       }
    //        })
        }
    

    
    @IBAction func btnNotification(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookNotificatsionVc") as! EBookNotificatsionVc
        self.present(nextViewController, animated:true, completion:nil)

    }

    
    @IBAction func goToAddress(_ sender: Any)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBAddAddressVC") as! EBAddAddressVC
          self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func btnFilterCart(_ sender: Any) {
        //EBookCartVC
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnRequest(_ sender: Any) {
        
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBRequestVC") as! EBRequestVC
                self.present(nextViewController, animated:true, completion:nil)

    }
    
    
    @IBAction func btnSideMenu(_ sender: Any) {
        
       EBookSideMenuVc.create().showSideMenu(
           viewController: self,
            currentStyle: currentStyle,
            sideMenuDidHide: { [weak self] style in
                self?.dismiss(
                   animated: false,
                   completion: {
                       if self?.currentStyle != style {
                            self?.currentStyle = style
                           // self?.containerViewController?.swapViewControllers(style)
                        }
                   }
                )
           }
        )

    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return offerImageArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCategoryTVC", for: indexPath) as!OfferCategoryTVC
//
//
//
//       // heightVariable.constant = tableView.contentSize.height
//
//
//        cell.OfferImage.image = offerImageArray[indexPath.row]
//
//
//
//
//
//         return cell
//
//    }
    
    
    

        func getSubCategoryDetails2(getId : String){
          
            
                        let parametersBal: Parameters=[
                            
                                "type":"6"
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
                                                            self.arrAllProductId.append(product_id)
                                                            
                                                            let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                            self.arrcategoryid.append(category_id)
                                                        
                                                            
//                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
//
//                                                                self.arrcategoryid.append(strproduct_name)
//
//
                                                          
                                                            
                                                            let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                       
                                                             self.arrsellingprice.append(selling_price)
                                                            
                                                            let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                            
                                                            self.arrtotaldiscount.append(total_discount)
                                                           
                                                            let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                           // print(seSubCategoryname)
                                                            self.arrcategoryname.append(product_name)
                                                            
//                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
//                                                            // print(seSubCategoryname)
//                                                             self.arrsubcategoryname.append(sub_category_name)
                                                            
                                                            let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                            self.arrbrand.append(brand)

                                                            let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                            self.arrdescription.append(tags ?? "")
                                                            
                                                            let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                            
                                                            
                                                            let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                            self.arroriginalprice.append(original_price)
                                                      
//                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
//                                                            self.arrstorename.append(store_name)
                                                            
                                                            let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                            self.arrRating.append(rating)
                                                            
                                                            
                                                        
                                                            
                                                
                                                            let caption = (user as AnyObject).value(forKey: "image") as! NSArray

                                                            
                                                            var count : Int = 0

                                        for imagearray in caption
                                        {


                                            
                                            count += 1
                                            
                                        
                                            
                                                
                                            
                                            if count == 1{
                                                
                                                let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                
                                                self.SubCategoryImageArray2.append(strProductImage)
                                                
                                                
                                                let getData = TopProduct(withTitle: brand, isSelected: false, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: rating, productid: product_id)
                                                
                                                
                                                self.arrTopProduct.append(getData)
                                                
                                                
                                            }
                                         
                                            
                                            
                                            
                                            }

                                                            
                                                            if self.arrdescription.isEmpty{
                                                                self.heightVariableNewProduct.constant = 0
                                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height)
                                                                
                                                            }
                                                            else{
                                           //                     self.heightVariableNewProduct.constant = self.collectionView2.contentSize.height
                                                                
                                                                
                                                            }
                                                            
                                                            
                                                        }
                                                        
                                                        DispatchQueue.main.async {
                                                            self.collectionView2.reloadData()
//                                                            self.collectionView3.reloadData()
//                                                            self.collectionView4.reloadData()
//                                                                                                                     self.collectionView5.reloadData()
                                                            
                                                        }

                                                        


                                                    }
                                                    else{
                                                        DispatchQueue.main.async {
                                                            
                                                            self.heightVariableNewProduct.constant = 0
                                                            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                            
                                                                                                              self.collectionView2.reloadData()
//                                                               self.collectionView3.reloadData()
//                                                              self.collectionView4.reloadData()
//                                                              self.collectionView5.reloadData()
                                                                                                           
                                                                                                          }
                                                    }

                                                }
                                                else{
                                                    DispatchQueue.main.async {
                                                        
                                                      
                                                 //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                        
                                                                                                          self.collectionView2.reloadData()
//                                                           self.collectionView3.reloadData()
//                                                                                                       self.collectionView4.reloadData()
//                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                      }
                                                }


                        }
                        

                
            }
    
    
    
    

            func gettop_featured_productsDetails2(getId : String){
              
                
//                            let parametersBal: Parameters=[
//
//                                    "type":"6"
//                                ]
//
//                            print(parametersBal)
                            
                            // BasUrl.baseURLPOST + "customer_login"
                            //http://zaarmall.com/development/get_all_product
                            
                            Alamofire.request(BasUrl.baseURLPOST + "get_top_featured_products", method: .get, parameters: nil).responseJSON
                                {
                                                    response in
                                                    
                                                    print(response)
                                                    
                                                    //getting the json value from the server
                                                    if let result = response.result.value {
                                                        
                                                        
                                                        let status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                         let message = (result as AnyObject).value(forKey: "message") as! NSString
                                                      
                                                            

                                                            self.arrTopFeaturedProduct.removeAll()


                                                        
                                                      
                                                        
                                                        
                                                        if (status == 200 as CFBoolean )
                                                        {

                                                            let data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                                                                          
                                                            
                                                            print("hiiii")
                                                              for user in data
                                                              {
                                                                
                                                                let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                                                self.arrAllProductId.append(product_id)
                                                                
                                                                let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                                self.arrcategoryid.append(category_id)
                                                            
                                                                
    //                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
    //
    //                                                                self.arrcategoryid.append(strproduct_name)
    //
    //
                                                              
                                                                
                                                                let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                           
                                                                 self.arrsellingprice.append(selling_price)
                                                                
                                                                let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                                
                                                                self.arrtotaldiscount.append(total_discount)
                                                               
                                                                let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                               // print(seSubCategoryname)
                                                                self.arrcategoryname.append(product_name)
                                                                
    //                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
    //                                                            // print(seSubCategoryname)
    //                                                             self.arrsubcategoryname.append(sub_category_name)
                                                                
                                                                let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                                self.arrbrand.append(brand)

                                                                let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                                self.arrdescription.append(tags ?? "")
                                                                
                                                                let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                                
                                                                
                                                                let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                                self.arroriginalprice.append(original_price)
                                                          
    //                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
    //                                                            self.arrstorename.append(store_name)
                                                                
                                                                let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                                self.arrRating.append(rating)
                                                                
                                                                
                                                            
                                                                
                                                    
                                                                let caption = (user as AnyObject).value(forKey: "images") as! NSArray

                                                                
                                                                var count : Int = 0

                                            for imagearray in caption
                                            {


                                                
                                                count += 1
                                                
                                            
                                                
                                                    
                                                
                                                if count == 1{
                                                    
                                                    let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                    
                                                    self.SubCategoryImageArray2.append(strProductImage)
                                                    
                                                    
                                                    let getData = TopFeaturedProduct(withTitle: brand, isSelected: false, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: rating, productid: product_id)
                                                    
                                                    
                                                    self.arrTopFeaturedProduct.append(getData)
                                                    
                                                    
                                                }
                                             
                                                
                                                
                                                
                                                }

                                                                
                                                                if self.arrdescription.isEmpty{
                                                                    self.heightVariableNewProduct.constant = 0
                                                                    self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height)
                                                                    
                                                                }
                                                                else{
                                               //                     self.heightVariableNewProduct.constant = self.collectionView2.contentSize.height
                                                                    
                                                                    
                                                                }
                                                                
                                                                
                                                            }
                                                            
                                                            DispatchQueue.main.async {
                                                                self.collectionView3.reloadData()
    //                                                            self.collectionView3.reloadData()
    //                                                            self.collectionView4.reloadData()
    //                                                                                                                     self.collectionView5.reloadData()
                                                                
                                                            }

                                                            


                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                
                                                                self.heightVariableNewProduct.constant = 0
                                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                                
                                                                                                                  self.collectionView3.reloadData()
    //                                                               self.collectionView3.reloadData()
    //                                                              self.collectionView4.reloadData()
    //                                                              self.collectionView5.reloadData()
                                                                                                               
                                                                                                              }
                                                        }

                                                    }
                                                    else{
                                                        DispatchQueue.main.async {
                                                            
                                                          
                                                     //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                            
                                                                                                              self.collectionView3.reloadData()
    //                                                           self.collectionView3.reloadData()
    //                                                                                                       self.collectionView4.reloadData()
    //                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                          }
                                                    }


                            }
                            

                    
                }
    
    
    

                func get_all_new_books_addedDetails2(getId : String){
                  
                    
    //                            let parametersBal: Parameters=[
    //
    //                                    "type":"6"
    //                                ]
    //
    //                            print(parametersBal)
                                
                                // BasUrl.baseURLPOST + "customer_login"
                                //http://zaarmall.com/development/get_all_product
                                
                                Alamofire.request(BasUrl.baseURLPOST + "get_all_new_books_added", method: .get, parameters: nil).responseJSON
                                    {
                                                        response in
                                                        
                                                        print(response)
                                                        
                                                        //getting the json value from the server
                                                        if let result = response.result.value {
                                                            
                                                            
                                                            let status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                             let message = (result as AnyObject).value(forKey: "message") as! NSString
                                                          
                                                                

                                                                self.arrAllNewBookAdded.removeAll()


                                                            
                                                          
                                                            
                                                            
                                                            if (status == 200 as CFBoolean )
                                                            {

                                                                let data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                                                                              
                                                                
                                                                print("hiiii")
                                                                  for user in data
                                                                  {
                                                                    
                                                                    let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                                                    self.arrAllProductId.append(product_id)
                                                                    
                                                                    let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                                    self.arrcategoryid.append(category_id)
                                                                
                                                                    
        //                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
        //
        //                                                                self.arrcategoryid.append(strproduct_name)
        //
        //
                                                                  
                                                                    
                                                                    let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                               
                                                                     self.arrsellingprice.append(selling_price)
                                                                    
                                                                    let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                                    
                                                                    self.arrtotaldiscount.append(total_discount)
                                                                   
                                                                    let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                                   // print(seSubCategoryname)
                                                                    self.arrcategoryname.append(product_name)
                                                                    
        //                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
        //                                                            // print(seSubCategoryname)
        //                                                             self.arrsubcategoryname.append(sub_category_name)
                                                                    
                                                                    let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                                    self.arrbrand.append(brand)

                                                                    let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                                    self.arrdescription.append(tags ?? "")
                                                                    
                                                                    let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                                    
                                                                    
                                                                    let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                                    self.arroriginalprice.append(original_price)
                                                              
        //                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
        //                                                            self.arrstorename.append(store_name)
                                                                    
//                                                                    let rating = (user as AnyObject).value(forKey: "rating") as! String
//                                                                    self.arrRating.append(rating)
                                                                    
                                                                    
                                                                
                                                                    
                                                        
                                                                    let caption = (user as AnyObject).value(forKey: "images") as! NSArray

                                                                    
                                                                    var count : Int = 0

                                                for imagearray in caption
                                                {


                                                    
                                                    count += 1
                                                    
                                                
                                                    
                                                        
                                                    
                                                    if count == 1{
                                                        
                                                        let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                        
                                                        self.SubCategoryImageArray2.append(strProductImage)
                                                        
                                                        
                                                        let getData = AllNewBookAdded(withTitle: brand, isSelected: false, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: "0.0", productid: product_id)
                                                        
                                                        
                                                        self.arrAllNewBookAdded.append(getData)
                                                        
                                                        
                                                    }
                                                 
                                                    
                                                    
                                                    
                                                    }

                                                                    
                                                                    if self.arrdescription.isEmpty{
                                                                        self.heightVariableNewProduct.constant = 0
                                                                        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height)
                                                                        
                                                                    }
                                                                    else{
                                                   //                     self.heightVariableNewProduct.constant = self.collectionView2.contentSize.height
                                                                        
                                                                        
                                                                    }
                                                                    
                                                                    
                                                                }
                                                                
                                                                DispatchQueue.main.async {
                                                                    self.collectionView4.reloadData()
        //                                                            self.collectionView3.reloadData()
        //                                                            self.collectionView4.reloadData()
        //                                                                                                                     self.collectionView5.reloadData()
                                                                    
                                                                }

                                                                


                                                            }
                                                            else{
                                                                DispatchQueue.main.async {
                                                                    
                                                                    self.heightVariableNewProduct.constant = 0
                                                                    self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                                    
                                                                                                                      self.collectionView4.reloadData()
        //                                                               self.collectionView3.reloadData()
        //                                                              self.collectionView4.reloadData()
        //                                                              self.collectionView5.reloadData()
                                                                                                                   
                                                                                                                  }
                                                            }

                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                
                                                              
                                                         //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                                
                                                            self.collectionView4.reloadData()
        //                                                           self.collectionView3.reloadData()
        //                                                                                                       self.collectionView4.reloadData()
        //                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                              }
                                                        }


                                }
                                

                        
                    }
    
    
    

            func get_all_productDetails2(getId : String){
              
                
                            let parametersBal: Parameters=[
                                
                                    "type":"new_products"
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
                                                        
                                                        
                                                        let status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                                         let message = (result as AnyObject).value(forKey: "message") as! NSString
                                                      
                                                            

                                                            self.arrNewProductAdded.removeAll()


                                                        
                                                      
                                                        
                                                        
                                                        if (status == 200 as CFBoolean )
                                                        {

                                                            let data = (result as AnyObject).value(forKey: "getProductsData") as! NSArray
                                                                                                          
                                                            
                                                            print("hiiii")
                                                              for user in data
                                                              {
                                                                
                                                                let product_id = (user as AnyObject).value(forKey: "product_id") as! String
                                                                self.arrAllProductId.append(product_id)
                                                                
                                                                let category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                                self.arrcategoryid.append(category_id)
                                                            
                                                                
    //                                                            let strproduct_name = (user as AnyObject).value(forKey: "product_name") as! String
    //
    //                                                                self.arrcategoryid.append(strproduct_name)
    //
    //
                                                              
                                                                
                                                                let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                           
                                                                 self.arrsellingprice.append(selling_price)
                                                                
                                                                let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                                
                                                                self.arrtotaldiscount.append(total_discount)
                                                               
                                                                let product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                               // print(seSubCategoryname)
                                                                self.arrcategoryname.append(product_name)
                                                                
    //                                                            let sub_category_name = (user as AnyObject).value(forKey: "sub_category_name") as! String
    //                                                            // print(seSubCategoryname)
    //                                                             self.arrsubcategoryname.append(sub_category_name)
                                                                
                                                                let brand = (user as AnyObject).value(forKey: "brand") as! String
                                                                self.arrbrand.append(brand)

                                                                let tags = (user as AnyObject).value(forKey: "tags") as? String
                                                                self.arrdescription.append(tags ?? "")
                                                                
                                                                let storename = (user as AnyObject).value(forKey: "store_name") as? String
                                                                
                                                                
                                                                let original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                                self.arroriginalprice.append(original_price)
                                                          
    //                                                            let store_name = (user as AnyObject).value(forKey: "store_name") as! String
    //                                                            self.arrstorename.append(store_name)
                                                                
                                                                let rating = (user as AnyObject).value(forKey: "rating") as! String
                                                                self.arrRating.append(rating)
                                                                
                                                                
                                                            
                                                                
                                                    
                                                                let caption = (user as AnyObject).value(forKey: "image") as! NSArray

                                                                
                                                                var count : Int = 0

                                            for imagearray in caption
                                            {


                                                
                                                count += 1
                                                
                                            
                                                
                                                    
                                                
                                                if count == 1{
                                                    
                                                    let strProductImage = (imagearray as AnyObject).value(forKey: "image") as! String
                                                    
                                                    self.SubCategoryImageArray2.append(strProductImage)
                                                    
                                                    
                                                    let getData = NewProductAdded(withTitle: brand, isSelected: false, categoryId: category_id, Subtitle: product_name, storeName: storename!, OriginalPrice: selling_price, PercentPrice: total_discount, CutPrice: original_price, imgUrl: strProductImage, rating: rating, productid: product_id)
                                                    
                                                    
                                                    self.arrNewProductAdded.append(getData)
                                                    
                                                    
                                                }
                                             
                                                
                                                
                                                
                                                }

                                                                
                                                                if self.arrdescription.isEmpty{
                                                                    self.heightVariableNewProduct.constant = 0
                                                                    self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height)
                                                                    
                                                                }
                                                                else{
                                               //                     self.heightVariableNewProduct.constant = self.collectionView2.contentSize.height
                                                                    
                                                                    
                                                                }
                                                                
                                                                
                                                            }
                                                            
                                                            DispatchQueue.main.async {
                                                                self.collectionView5.reloadData()
    //                                                            self.collectionView3.reloadData()
    //                                                            self.collectionView4.reloadData()
    //                                                                                                                     self.collectionView5.reloadData()
                                                                
                                                            }

                                                            


                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                
                                                                self.heightVariableNewProduct.constant = 0
                                                                self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height  - 200)
                                                                
                                                                                                                  self.collectionView5.reloadData()
    //                                                               self.collectionView3.reloadData()
    //                                                              self.collectionView4.reloadData()
    //                                                              self.collectionView5.reloadData()
                                                                                                               
                                                                                                              }
                                                        }

                                                    }
                                                    else{
                                                        DispatchQueue.main.async {
                                                            
                                                          
                                                     //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
                                                            
                                                                                                              self.collectionView5.reloadData()
    //                                                           self.collectionView3.reloadData()
    //                                                                                                       self.collectionView4.reloadData()
    //                                                                                                                                                                self.collectionView5.reloadData()
                                                                                                          }
                                                    }


                            }
                            

                    
                }
    
    
    
    func getSubCategory(getId : String){
            
         
            
         
        
           
                    let parametersBal: Parameters=[
                        "category_id":getId
                        ]
                    
                    print(parametersBal)
                    
                    
                    //                        // BasUrl.baseURLPOST + "customer_login"
                    //http://zaarmall.com/development/get_all_sub_categories

                    Alamofire.request(BasUrl.baseURLPOST + "get_all_sub_categories", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                              //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                              
                                                self.arrsubcategoryid.removeAll()
                                                         self.SubCategoryNameArray.removeAll()
                                                         self.arrsubcategoryid.removeAll()
                                                         self.SubCategoryImageArray.removeAll()
                                                         

                                                
                                                if (status == 200 as CFBoolean )
                                                {

                                                    let data = (result as AnyObject).value(forKey: "data") as! NSArray
                                                                                                  
                                                    
                                                    print("hiiii")
                                                      for user in data
                                                      {
                                                        
                                                        let getSubCategoryId = (user as AnyObject).value(forKey: "sub_category_id") as? String
                                                        self.arrsubcategoryid.append(getSubCategoryId ?? "")
                                                      
                                                        let strCategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                      self.arrcategoryid.append(strCategoryId)
                                                        
                                                        let SubCategoryname = (user as AnyObject).value(forKey: "name") as! String
                                                        self.SubCategoryNameArray.append(SubCategoryname)
                                                        


                                                         if let subCategoryImage = (user as AnyObject).value(forKey: "image") as? String
                                                         {
                                                            self.SubCategoryImageArray.append(subCategoryImage)
                                                         }
                                                         else
                                                         {
                                                             print("JSON is returning nil")
                                                            self.SubCategoryImageArray.append("Null")
                                                         }


                                                        self.SubCategoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                

                                                        self.SubCategoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                        
                                                        self.SubCategorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                        

                                                        
                                                      }
                                                    
                                                    
//                                                    if self.SubCategoryNameArray.count == 0{
//                                                        self.heightVariableSubCategory.constant = 0
//                                                    }
//                                                    else{
                                    //self.heightVariableSubCategory.constant = 0
                                              //      }
                                                    
                                                   DispatchQueue.main.async
                                                    {
                                                       self.collectionView.reloadData()
                                                    
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                    if self.SubCategoryNameArray.count == 0{
                                                                        //                                self.heightVariableSubCategory.constant = 0
                                                                                                    }
                                                                                                    else{
                                                                 //                                       self.heightVariableSubCategory.constant = 140
                                                                                                    }
                                                    
                                                    
                                                    DispatchQueue.main.async {
                                                          self.collectionView.reloadData()
                                                      }
                                                }

                                            }


                    }
                    

            
        }
        

    
func getCategory(){
    
    indicator.isHidden = false
          indicator.startAnimating()

    // BasUrl.baseURLPOST + "customer_login"
    //http://zaarmall.com/development/get_all_categories

            Alamofire.request(BasUrl.baseURLPOST + "get_all_categories", method: .get).responseJSON
                                {
                                    response in
                                    
                                    print(response)
                                    
                                    //getting the json value from the server
                                    if let result = response.result.value {
                                        
                                        
                                        var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                      //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                        var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                        
                                        self.indicator.isHidden = true
                                        self.indicator.stopAnimating()


                                        
                                        if (status == 200 as CFBoolean )
                                        {

                                            self.menuList.removeAll()
                                            self.userCategoryIdArray.removeAll()
                                            print("hiiii")
                                              for user in data
                                              {
                                                
                                                self.CategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                self.userCategoryIdArray.append(self.CategoryId)
                                                
                                                print("id ye he",self.CategoryId)
                                             
                                                
                                                self.Categoryname = (user as AnyObject).value(forKey: "name") as! String
                                                print(self.Categoryname)
                                                self.menuList.append(self.Categoryname)
                                                
                                              //  self.userArray.append(UserCategory(withTitle: self.Categoryname, isSelected: false, categoryId: self.CategoryId))
                                       
                                                self.Categoryimage = (user as AnyObject).value(forKey: "image") as! String
                                                print(self.Categoryimage)
                                         
                                                self.Categoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                print(self.Categoryis_active)
                                            
                                                
                                                self.Categoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                      
                                                self.Categorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                
                                              }
                                            
                                            self.setupDataSrource()
                                                self.initialSetup()
                                            
                                           DispatchQueue.main.async {
                                               self.menuCollectionView.reloadData()
                                            
                                          //   self.collectionView.reloadData()
                                           }

                                            


                                        }
                                        else{
                                            
                                        }

                                    }
                                    else{
                                        self.indicator.isHidden = true
                                                                self.indicator.stopAnimating()

                                    }


            }
            

    
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
                                        
                                        self.arrFavdescription.removeAll()
                                        self.arrwishlist.removeAll()
                                        self.arrwhislistchildcategoryid.removeAll()
                                        self.arrimage.removeAll()
                                           
                                           if (status == 200 as CFBoolean )
                                           {
                                               
                                               var otpdata = (result as AnyObject).value(forKey: "data") as! NSArray

                                               
                                               print("book")
                                               for user in otpdata
                                               {
                                                   let getId = (user as AnyObject).value(forKey: "id") as! String

                                                   let getcustomer_id = (user as AnyObject).value(forKey: "customer_id") as! String

                                                   let getproduct_id = (user as AnyObject).value(forKey: "product_id") as! String

                                                   let getproduct_name = (user as AnyObject).value(forKey: "product_name") as! String

                                                   let getcreated_date = (user as AnyObject).value(forKey: "created_date") as! String
                                                
                                                let getchildcategory_id = (user as AnyObject).value(forKey: "child_category_id") as! String

                                                 //  let getproduct_name = (user as AnyObject).value(forKey: "product_name") as! String

                                                   let description = (user as AnyObject).value(forKey: "description") as! String
    
                                                   let selling_price = (user as AnyObject).value(forKey: "selling_price") as! String

                                                   let original_price = (user as AnyObject).value(forKey: "original_price") as! String

                                                   let total_discount = (user as AnyObject).value(forKey: "total_discount") as! String

                                                   let wishlist = (user as AnyObject).value(forKey: "wishlist") as! Int

                                                   var imgData = (user as AnyObject).value(forKey: "images") as! NSArray

                                                                                          
                                                var getCount : Int = 0
                                                
                                                
                                                   for getImage in imgData
                                                   {
                                                         let image = (getImage as AnyObject).value(forKey: "image") as! String
                                                       
                                                    getCount += 1
                                                    
                                                    if getCount == 1
                                                    {
                                                          self.arrimage.append(image)
                                                    }
                                                    
                                                     
                                                                                                           
                                                      
                                                  }
                                                   
                                               
                                                   self.arrselling_price.append(selling_price)
                                                   self.arroriginal_price.append(original_price)
                                                   self.arrtotal_discount.append(total_discount)
                                                   self.arid.append(getId)
                                                   self.arrcustomer_id.append(getcustomer_id)
                                                   self.arrproduct_id.append(getproduct_id)
                                                   self.arrproduct_name.append(getproduct_name)
                                                
                                                   self.arrFavdescription.append(description)
                                                   self.arrwishlist.append(wishlist)
                                              self.arrwhislistchildcategoryid.append(getchildcategory_id)
                                                
                                                
                                                
                                      

                                                   
                                                   
                                               }

                                            
                                            
                                            if self.arrproduct_name.isEmpty{
                                                                               //       self.heightVariableWishlist.constant = 0
                                                                              //        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView3.frame.height)
                                                                                      
                                                                                  }
                                                                                  else{
                                                                                      //self.heightVariableWishlist.constant = self.collectionView3.contentSize.height
                                                                                      
                                                                                      
                                                                                  }
                                                                                     
                                                                                     DispatchQueue.main.async {
                                                                                    self.collectionView3.reloadData()
                                                                                     }
                                           


                                           }
                                           
                                           else{
                                               
                                           }
                                       }
               }

               
           }



    }



extension EBookAppHomeVc {
    
    //Creates a data source array for Horizontal Menu with tapped state.
    func setupDataSrource() {
        for (index, menuItem) in self.menuList.enumerated() {
            if index == 0 {
                let menuObject = UserCategory(withTitle: menuItem, isSelected: true, categoryId: menuItem)
                self.userArray.append(menuObject)
            } else {
                let menuObject = UserCategory(withTitle: menuItem, isSelected: false, categoryId: menuItem)
                self.userArray.append(menuObject)
            }
        }
    }
    
    //Controls Initial Navigation upon App Launch.
    func initialSetup() {
       // masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[0])
    }
    
    //Updates Menu List Objects upon - Tap on Menu or Scroll using swipe Gestures
    func updateMenuObjects() {
        let indexPath = IndexPath(row: currentIndex, section: 0)
        for (index, _) in self.userArray.enumerated() {
            if index == indexPath.row {
                self.userArray[index].isSelected = true
            } else {
                self.userArray[index].isSelected = false
            }
        }
        self.menuCollectionView.reloadData()
    }
}

//MARK:- Collection View Data Source Methods:
extension EBookAppHomeVc: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
                          var count:Int?

                           if collectionView == self.menuCollectionView
                           {
                            count = self.userArray.count
                           }
                           else if collectionView == self.collectionView{
                            count = self.SubCategoryNameArray.count
                           }
                            else if collectionView == self.collectionView2
                           {
                                        count = self.arrTopProduct.count
                            }
                            else if collectionView == self.collectionView3
                          {
                                
                            count = self.arrTopFeaturedProduct.count
                           }
                              else if collectionView == self.collectionView4
                            {
                                     //    count = self.arrproduct_name.count
                                 count = self.arrAllProductId.count
                             }

                              else if collectionView == self.collectionView5
                            {
                                     //    count = self.arrproduct_name.count
                              count = self.arrNewProductAdded.count
                             }

                           else{
                            count = 2
                        }
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView == self.menuCollectionView{
 

            

          //    if collectionView == self.menuCollectionView {

              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCategoryCVC", for: indexPath) as? UserCategoryCVC
                  
              //    let menuObject1 = self.userArray[indexPath.row].categoryId
                  


              let menuObject = self.userArray[indexPath.row]
//              cell?.firstlbl.text = menuObject.name
//
//                  //print(strCategoryName)
//                  cell?.layer.cornerRadius = 20
//
//
//
//              cell?.clipsToBounds = true
//              cell?.layer.borderWidth = 2
//              //UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//            //       var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//              cell?.layer.borderColor = red.cgColor
              if indexPath.row == 1{
                
                var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                cell?.layer.cornerRadius = 20
                                     
                                     
                cell?.clipsToBounds = true
                cell?.layer.borderWidth = 2
                
                  
                  self.getStrCategoryId = self.userArray[indexPath.row].categoryId
                  print("category id ye he",self.getStrCategoryId)
            //      getSubCategory(getId: self.getStrCategoryId)



                  
                                              cell?.firstlbl.textColor = UIColor.black
                                              cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                  
                                              cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                                  cell?.layer.cornerRadius = 20
                  
                  
                                              cell?.clipsToBounds = true
                                              cell?.layer.borderWidth = 2
                                     //         var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                              cell?.layer.borderColor = red.cgColor
                  



              }

              if menuObject.isSelected {

                  

                  


                                              cell?.firstlbl.textColor = UIColor.black
                                              cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                  
                                              cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                                  cell?.layer.cornerRadius = 20
                  
                  
                                              cell?.clipsToBounds = true
                                              cell?.layer.borderWidth = 2
                                              var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                              cell?.layer.borderColor = red.cgColor
                  
                                               
                  
                                           
                  




                  
                  

                  

              } else {
                  cell?.firstlbl.textColor = UIColor.black
                  cell?.firstlbl.backgroundColor = UIColor.clear
                      cell?.layer.cornerRadius = 20


                  cell?.clipsToBounds = true
                  cell?.layer.borderWidth = 2
                  var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                  cell?.layer.borderColor = red.cgColor
                  var clear = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

               //   cell?.layer.backgroundColor = clear.cgColor

              }
           //       cellToReturn = cell!

           //   }
            
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
          var cellToReturn = UICollectionViewCell()
            if collectionView == self.menuCollectionView {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCategoryCVC", for: indexPath) as? UserCategoryCVC
                
                let menuObject1 = self.userArray[indexPath.row].categoryId
                


            let menuObject = self.userArray[indexPath.row]
            cell?.firstlbl.text = menuObject.name
                
                //print(strCategoryName)
                cell?.layer.cornerRadius = 20

                

            cell?.clipsToBounds = true
            cell?.layer.borderWidth = 2
            //UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            cell?.layer.borderColor = red.cgColor
            if indexPath.row == 0{
                
                self.getStrCategoryId = self.userArray[indexPath.row].categoryId
                print("category id ye he",self.getStrCategoryId)
          //      getSubCategory(getId: self.getStrCategoryId)



                
                                            cell?.firstlbl.textColor = UIColor.black
                                            cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                
                                            cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                                cell?.layer.cornerRadius = 20
                
                
                                            cell?.clipsToBounds = true
                                            cell?.layer.borderWidth = 2
                                            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                            cell?.layer.borderColor = red.cgColor
                



            }

            if menuObject.isSelected {

                

                


                                            cell?.firstlbl.textColor = UIColor.black
                                            cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                
                                            cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                                cell?.layer.cornerRadius = 20
                
                
                                            cell?.clipsToBounds = true
                                            cell?.layer.borderWidth = 2
                                            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                                            cell?.layer.borderColor = red.cgColor
                
                                             
                
                                         
                




                
                

                

            } else {
                cell?.firstlbl.textColor = UIColor.black
                cell?.firstlbl.backgroundColor = UIColor.clear
                    cell?.layer.cornerRadius = 20


                cell?.clipsToBounds = true
                cell?.layer.borderWidth = 2
                var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                cell?.layer.borderColor = red.cgColor
                var clear = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

                cell?.layer.backgroundColor = clear.cgColor

            }
                cellToReturn = cell!

            }
        else if(collectionView == self.collectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserSubCategoryCvC", for: indexPath) as? UserSubCategoryCvC
            
            cell?.productName.text = SubCategoryNameArray[indexPath.row]
            //cell?.productImage.image = productImageArray[indexPath.row]
                
                let getString = SubCategoryImageArray[indexPath.row]
                                  
                                        let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                       
                                       print(getUrl)
                //               // BasUrl.baseURLPOST + "customer_login"

           cell?.productImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

           // cell?.productImage.layer.cornerRadius = 40
//                cell?.productImage.layer.borderWidth = 1
//                var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
//                cell?.productImage.layer.borderColor = red1.cgColor

            
            cell?.clipsToBounds = true



            cellToReturn = cell!


        }

                    else if(collectionView == self.collectionView2){
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBTopProductCVC", for: indexPath) as? EBTopProductCVC
                        
                cell?.lblTitle.text = arrTopProduct[indexPath.row].name
                cell?.lblSubTitle.text = arrTopProduct[indexPath.row].Subtitle
                cell?.lblStoreName.text = arrTopProduct[indexPath.row].storeName
                cell?.lblOriginalPrice.text = arrTopProduct[indexPath.row].OriginalPrice
                cell?.lblOffPercent.text = arrTopProduct[indexPath.row].PercentPrice
                cell?.lblCutPrice.text = arrTopProduct[indexPath.row].CutPrice
                cell?.lblRating.text = arrTopProduct[indexPath.row].rating
                
                
                let getString = arrTopProduct[indexPath.row].imgUrl
                                                
                                                      let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                     
                                                     print(getUrl)
                
                //               // BasUrl.baseURLPOST + "customer_login"

                       cell?.lblImgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

        //                cell?.productImage.layer.cornerRadius = 40
        //                    cell?.productImage.layer.borderWidth = 1
        //                    var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
        //                    cell?.productImage.layer.borderColor = red1.cgColor

                        
                        cell?.clipsToBounds = true
                
                     
                //             heightVariableCategory.constant = collectionView2.contentSize.height


//                self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
//
//                    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

                        cellToReturn = cell!


                    }

                        else if(collectionView == self.collectionView3){
                                                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBFeaturedProductsCVC", for: indexPath) as? EBFeaturedProductsCVC
                                                
                                        cell?.lblTitle.text = arrTopFeaturedProduct[indexPath.row].name
                                        cell?.lblSubTitle.text = arrTopFeaturedProduct[indexPath.row].Subtitle
                                        cell?.lblStoreName.text = arrTopFeaturedProduct[indexPath.row].storeName
                                        cell?.lblOriginalPrice.text = arrTopFeaturedProduct[indexPath.row].OriginalPrice
                                        cell?.lblOffPercent.text = arrTopFeaturedProduct[indexPath.row].PercentPrice
                                        cell?.lblCutPrice.text = arrTopFeaturedProduct[indexPath.row].CutPrice
                                        cell?.lblRating.text = arrTopFeaturedProduct[indexPath.row].rating
                                        
                                        
                                        let getString = arrTopFeaturedProduct[indexPath.row].imgUrl
                                                                        
                                                                              let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                                             
                                                                             print(getUrl)
                                        
                                        //               // BasUrl.baseURLPOST + "customer_login"

                                               cell?.lblImgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

                                //                cell?.productImage.layer.cornerRadius = 40
                                //                    cell?.productImage.layer.borderWidth = 1
                                //                    var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
                                //                    cell?.productImage.layer.borderColor = red1.cgColor

                                                
                                                cell?.clipsToBounds = true
                                        
                                             
                                        //             heightVariableCategory.constant = collectionView2.contentSize.height


                        //                self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
                        //
                        //                    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

                                                cellToReturn = cell!


                                            }

        else if(collectionView == self.collectionView4){
                                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBAllBrandsCVC", for: indexPath) as? EBAllBrandsCVC
                                
                        cell?.lblTitle.text = arrAllNewBookAdded[indexPath.row].name
                        cell?.lblSubTitle.text = arrAllNewBookAdded[indexPath.row].Subtitle
                        cell?.lblStoreName.text = arrAllNewBookAdded[indexPath.row].storeName
                        cell?.lblOriginalPrice.text = arrAllNewBookAdded[indexPath.row].OriginalPrice
                        cell?.lblOffPercent.text = arrAllNewBookAdded[indexPath.row].PercentPrice
                        cell?.lblCutPrice.text = arrAllNewBookAdded[indexPath.row].CutPrice
                        cell?.lblRating.text = arrAllNewBookAdded[indexPath.row].rating
                        
                        
                        let getString = arrAllNewBookAdded[indexPath.row].imgUrl
                                                        
                                                              let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                             
                                                             print(getUrl)
                        
                        //               // BasUrl.baseURLPOST + "customer_login"

                               cell?.lblImgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

                //                cell?.productImage.layer.cornerRadius = 40
                //                    cell?.productImage.layer.borderWidth = 1
                //                    var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
                //                    cell?.productImage.layer.borderColor = red1.cgColor

                                
                                cell?.clipsToBounds = true
                        
                             
                        //             heightVariableCategory.constant = collectionView2.contentSize.height


        //                self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        //
        //                    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

                                cellToReturn = cell!


                            }

        else if(collectionView == self.collectionView5){
                                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBNewArrivalsCVC", for: indexPath) as? EBNewArrivalsCVC
                                
                        cell?.lblTitle.text = arrNewProductAdded[indexPath.row].name
                        cell?.lblSubTitle.text = arrNewProductAdded[indexPath.row].Subtitle
                        cell?.lblStoreName.text = arrNewProductAdded[indexPath.row].storeName
                        cell?.lblOriginalPrice.text = arrNewProductAdded[indexPath.row].OriginalPrice
                        cell?.lblOffPercent.text = arrNewProductAdded[indexPath.row].PercentPrice
                        cell?.lblCutPrice.text = arrNewProductAdded[indexPath.row].CutPrice
                        cell?.lblRating.text = arrNewProductAdded[indexPath.row].rating
                        
                        
                        let getString = arrNewProductAdded[indexPath.row].imgUrl
                                                        
                                                              let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                             
                                                             print(getUrl)
                        
                        //               // BasUrl.baseURLPOST + "customer_login"

                               cell?.lblImgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

                //                cell?.productImage.layer.cornerRadius = 40
                //                    cell?.productImage.layer.borderWidth = 1
                //                    var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
                //                    cell?.productImage.layer.borderColor = red1.cgColor

                                
                                cell?.clipsToBounds = true
                        
                             
                        //             heightVariableCategory.constant = collectionView2.contentSize.height


        //                self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        //
        //                    self.viewBackground.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

                                cellToReturn = cell!


                            }
        
            
        return cellToReturn
    }
    
    

    
}

//MARK:- Collection View Delegate Source Methods:
extension EBookAppHomeVc: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == self.menuCollectionView){
        self.currentIndex = indexPath.row
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        for (index, _) in self.userArray.enumerated() {
            if index == indexPath.row {
                self.userArray[index].isSelected = true
//               let menuobject = userArray[index]
//
//               print(strCategoryName)

                self.getStrCategoryId = userCategoryIdArray[indexPath.row]

                print("category id ye he",self.getStrCategoryId)
                      getSubCategory(getId: self.getStrCategoryId)



            } else {
                self.userArray[index].isSelected = false
            }
        }
        menuCollectionView.reloadData()
        }
        else if(collectionView == self.collectionView){
            
     //     print(SubCategoryIdArray[indexPath.row])
            
            
            let SelectSubCategoryName = SubCategoryNameArray[indexPath.row]
             let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSelectSubCategoryProductVc") as! EBookSelectSubCategoryProductVc
           // nextViewController.getSelectedSubCategoryId = arrsubcategoryid[indexPath.row]
            nextViewController.getSelectSubCategoryName = SelectSubCategoryName
            nextViewController.getUserId = getUserId
             nextViewController.getSubCategoryId = arrsubcategoryid[indexPath.row]

             self.present(nextViewController, animated:true, completion:nil)

        }
        
        else if(collectionView == self.collectionView2){
            
             
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc


            nextViewController.getProductId = arrTopProduct[indexPath.row].productid
            nextViewController.getChildId =  arrTopProduct[indexPath.row].categoryId
                     nextViewController.getUserId = getUserId



                    self.present(nextViewController, animated:true, completion:nil)

        }

          else if(collectionView == self.collectionView3){
              
     
                   
                      let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
            nextViewController.getProductId = arrTopProduct[indexPath.row].productid
                   nextViewController.getChildId =  arrTopProduct[indexPath.row].categoryId

                //      nextViewController.getProductId = arrproduct_id[indexPath.row]

                 //     nextViewController.getChildId = arrwhislistchildcategoryid[indexPath.row]
                       nextViewController.getUserId = getUserId



                      self.present(nextViewController, animated:true, completion:nil)

          }

             else if(collectionView == self.collectionView4){
                 
        
                      
                         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
            nextViewController.getProductId = arrTopProduct[indexPath.row].productid
                   nextViewController.getChildId =  arrTopProduct[indexPath.row].categoryId

                   //      nextViewController.getProductId = arrproduct_id[indexPath.row]

                    //     nextViewController.getChildId = arrwhislistchildcategoryid[indexPath.row]
                          nextViewController.getUserId = getUserId



                         self.present(nextViewController, animated:true, completion:nil)

             }
        
        }
    }


extension EBookAppHomeVc: UICollectionViewDelegateFlowLayout {
   
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView == menuCollectionView {
//
//            return CGSize(width: 110, height: 135)
//        }
//        else {
//         //   return CGSize(width: 105, height: 131)
//
//
//        }
//
//
//
//    }
}

