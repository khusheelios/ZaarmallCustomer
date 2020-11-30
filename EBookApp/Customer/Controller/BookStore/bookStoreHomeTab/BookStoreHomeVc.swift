//
//  BookStoreHomeVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

import Segmentio
import Alamofire
import SDWebImage

class User21{
    let name: String
    
    var isSelected: Bool
    
    init(withTitle title: String, isSelected selected: Bool) {
        self.name = title
        self.isSelected = selected
    }

}

class ResturentName21{
    var authorname: String

    var bookTitle: String


    var rating: String


    var amount: String


    var bookImage: String
    var amount1: String
    var perstage: String

    
    
    init(authorname: String,bookTitle: String,rating: String,amount: String,bookImage: String,amount1: String,perstage: String) {
        self.authorname = authorname

        self.bookTitle = bookTitle


        self.rating = rating


        self.amount = amount



        self.bookImage = bookImage
        self.amount1 = amount1

        
        self.perstage = perstage
    }

}



class BookStoreHomeVc: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout,FavurtiesttonDelegetes {

    @IBOutlet weak var menuCollectionView: UICollectionView!

    @IBOutlet weak var collectionView: UICollectionView!
    
   // var userArray = [User21]()
    
    var userArray: [User21] = []

    
    var restArray = [ResturentName21]()
    
    var currentRestArray = [ResturentName21]()
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0

    fileprivate var currentStyle = SegmentioStyle.onlyImage
     @IBOutlet weak var SearchText: UITextField!
    //var menuList = ["Women","Male","Electornic","Books","Author","Audio"]
    var menuList = [String]()

       var currentIndex: Int = 0
    
    var productId = String()
    var child_category_id = String()
    var category_id = String()
    var subcategory_id = String()
    var author_id = String()
    
    var product_name = String()
    var description1 = String()
    var image_1 = String()

    var selling_price = String()

    var original_price = String()

    var total_discount = String()

    var stock_quantity = String()

    var is_delete = String()

    var created_date = String()
    var rating = String()
    var author_name = String()



    var product_nameArray = String()
    var image_1Array = String()
    var authorNameArray = String()

    

    var selling_priceArray = String()

    var original_priceArray = String()

    var total_discountArray = String()



    var ratingArray = String()


    
    
    
   var CategoryId = String()
   var Categoryname = String()

    var Categoryimage = String()

    var Categoryis_active = String()

    var Categoryis_delete = String()

    var Categorycreate_date = String()
    
    var categoryArray = [String]()





    override func viewDidLoad() {
        super.viewDidLoad()
        getAllProduct()
        getCategory()
        let defaults = UserDefaults.standard


             menuCollectionView.delegate = self
             menuCollectionView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.setupDataSrource()
        self.initialSetup()
        
        var customView = UIView(frame: CGRect(x: 19, y: 280, width: 376, height: 1))
        customView.backgroundColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
        view.addSubview(customView)


        
//        restArray.append(ResturentName21(authorname:"The Death",bookTitle:"Death",rating: "1.5",amount: "150",bookImage: "book_img02",amount1: "150",perstage: "15"))
//        restArray.append(ResturentName21(authorname:"The Road",bookTitle:"Road",rating: "2.5",amount: "250",bookImage: "book_img03",amount1: "250",perstage: "25"))
//
//        restArray.append(ResturentName21(authorname:"The Book",bookTitle:"Book",rating: "3.5",amount: "350", bookImage: "book_img04",amount1: "350",perstage: "35"))
//
//        restArray.append(ResturentName21(authorname:"The Cloud",bookTitle:"Cloud",rating: "4.5",amount: "450",bookImage: "book_img10",amount1: "450",perstage: "45"))
//
//        restArray.append(ResturentName21(authorname:"The Crown",bookTitle:"Crown",rating: "5.5",amount: "550",bookImage: "book_img02",amount1: "550",perstage: "55"))
//
        for str in restArray {
            currentRestArray.append(str)
        }

        self.setupGridView()


    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        SearchText.resignFirstResponder()
        SearchText.text = ""
        self.currentRestArray.removeAll()
        for str in restArray {
            currentRestArray.append(str)
        }
       // collectionView.reloadData()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (SearchText.text?.count)! != 0 {
            self.currentRestArray.removeAll()
            for str in restArray {
                let range = str.authorname.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
                
                if range != nil {
                    self.currentRestArray.append(str)
                }
            }
        }
       // collectionView.reloadData()
        return true
    }
    @IBAction func btnNotification(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreNotificastionVc") as! BookStoreNotificastionVc
        self.present(nextViewController, animated:true, completion:nil)

    }

    
    
    
    @IBAction func btnSideMenu(_ sender: Any) {
        
        BookStoreSideMenuVc.create().showSideMenu(
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

    
    
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
    //        self.setupGridView()
    //        DispatchQueue.main.async {
    //            self.collectionView.reloadData()
    //        }
            
            if let layout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                    layout.minimumLineSpacing = 10
                    layout.minimumInteritemSpacing = 6
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 5)
                    let size = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
                    layout.itemSize = size
            }

            
            
            
            if let layout1 = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                    layout1.minimumLineSpacing = 10
                    layout1.minimumInteritemSpacing = 6
                    layout1.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
                    let size1 = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
                    layout1.itemSize = size1
            }

        }


    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == menuCollectionView {
            return CGSize(width: 100, height: 35) // Collection View size right?
        }

        else{
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let numberofItem: CGFloat = 2

        let collectionViewWidth = self.collectionView.bounds.width

        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing

        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left

        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)

        print(width)

        return CGSize(width: width, height: width)
            
        }
    }

    func setupDataSrource() {
        for (index, menuItem) in self.menuList.enumerated() {
            if index == 0 {
                let menuObject = User21(withTitle: menuItem, isSelected: true)
                self.userArray.append(menuObject)
            } else {
                let menuObject = User21(withTitle: menuItem, isSelected: false)
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

    

    
    
    
    
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                var count:Int?
                if collectionView == menuCollectionView{
                    count = self.userArray.count
                    
                }
                else if collectionView == collectionView{
                    count = currentRestArray.count
                }
                else{
                    count = 10

                }
                return count!

            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                  var cellToReturn = UICollectionViewCell()
                if collectionView == self.menuCollectionView {
                    
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreHomeSellerCell", for: indexPath) as? BookStoreHomeSellerCell
                   // if cell!.isSelected {


                      let menuObject = self.userArray[indexPath.row]
                      cell?.firstlbl.text = menuObject.name
                     cell?.firstlbl.numberOfLines = 0
//                    cell?.firstlbl.adjustsFontSizeToFitWidth = true
//                    cell?.firstlbl.minimumScaleFactor = 0.15
                     
                // cell?.firstlbl.text = userArray[indexPath.row].name
                         cell?.layer.cornerRadius = 20


                     cell?.clipsToBounds = true
                     cell?.layer.borderWidth = 2
                     //UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                     var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                     cell?.layer.borderColor = red.cgColor
                     if indexPath.row == 0{
                         //var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)


                         
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
                else if collectionView == self.collectionView{
                    
                    //reloadInputViews()
                    


                    let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreHomeCVC", for: indexPath) as? BookStoreHomeCVC
                    
                    firstcell?.editData = self as  FavurtiesttonDelegetes
                    firstcell?.tag = indexPath.row


                    firstcell?.bookTitles.text = currentRestArray[indexPath.row].authorname
                    firstcell?.Authornamelbl.text = currentRestArray[indexPath.row].bookTitle
                    firstcell?.amountlbl.text = currentRestArray[indexPath.row].amount
                    


                //  firstcell?.bookImage.sd_setImage(with: URL(string: currentRestArray[indexPath.row].bookImage), placeholderImage: UIImage(named: "image_1"), options: .forceTransition, progress: nil, completed: nil)

                    
                    firstcell?.bookImage.sd_setImage(with:URL(string: "http://zaarmall.com/development/uploads/products/" + currentRestArray[indexPath.row].bookImage), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

                        // let strRating = currentRestArray[indexPath.row].rating

                   firstcell?.ratingslbl.text = currentRestArray[indexPath.row].rating
//                    let doubleStr = String(format: "%.2f",strRating)
//                    firstcell?.ratingslbl.text = doubleStr


                    firstcell?.amountlbl1.text = currentRestArray[indexPath.row].amount1
                    

                    firstcell?.perstagelbl.text = currentRestArray[indexPath.row].perstage
                    

                    
                    let btnCart = UIButton(type: .custom)
                    btnCart.frame = CGRect(x: 265, y: 738, width: 140, height: 40)
                    btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                    btnCart.clipsToBounds = true
                    btnCart.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                        //UIColor.systemOrange
                    //
                    btnCart.layer.cornerRadius = 20
                    btnCart.setTitle("Add Product", for: .normal)
                    btnCart.setTitleColor(UIColor.white, for: .normal)
                    btnCart.titleLabel?.font = .systemFont(ofSize: 15)

                    btnCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
                    view.addSubview(btnCart)





                    cellToReturn = firstcell!



                }

                
                
                
                return cellToReturn
            }
    

    
        func FavurtiesButton(_ cell:BookStoreHomeCVC)
        {
            
            cell.btnFavorites.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)
            
            //cell.btnFavorites.setImage(UIImage(named:"Layer-24-copy"), for: .normal)


    }
    
    @objc func thumbsUpButtonPressed() {
        
          let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreproductCategoryTypeVc") as! BookStoreproductCategoryTypeVc
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.modalPresentationStyle = .overCurrentContext
        nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

          self.present(nextViewController, animated:true, completion:nil)

        
    }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            
            if collectionView == self.menuCollectionView {
                
                
                                        self.currentIndex = indexPath.row
                                        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                                        for (index, _) in self.userArray.enumerated() {
                                            if index == indexPath.row {
                                                self.userArray[index].isSelected = true



                                            } else {
                                                self.userArray[index].isSelected = false
                                            }
                                        }
                                        menuCollectionView.reloadData()
                                            
                                        }else{
                
                
                                              let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreHomeCVC", for: indexPath) as? BookStoreHomeCVC

                                                firstcell?.btnFavorites.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)
                
                
                                             let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
                                              let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreProductDetailsVc") as! BookStoreProductDetailsVc
                                            // nextViewController.strCategoryName1 = strCategoryName
                                             self.present(nextViewController, animated:true, completion:nil)

                                        }
                                    }
    
    
    
    func getCategory(){
        
                Alamofire.request("http://zaarmall.com/development/get_all_categories", method: .get).responseJSON
                                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                            var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                            


                                            
                                            if (status == 200 as CFBoolean )
                                            {

                                                print("hiiii")
                                                  for user in data
                                                  {
                                                    
                                                    self.category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                    print(self.category_id)
                                                    
                                                    UserDefaults.standard.set(self.category_id, forKey: "category_id")
                                                    UserDefaults.standard.synchronize()

                                                    

                                                    self.Categoryname = (user as AnyObject).value(forKey: "name") as! String
                                                    print(self.Categoryname)
                                                    self.userArray.append(User21(withTitle: self.Categoryname, isSelected: false))
                                                    
                                                    //self.restArray.append(ResturentName21(authorname:self.author_name,bookTitle:self.product_name,rating: self.rating,amount: self.original_price,bookImage: self.image_1,amount1: self.selling_price,perstage: self.total_discount))

                                                    
                                                    UserDefaults.standard.set(self.Categoryname, forKey: "name")
                                                    UserDefaults.standard.synchronize()

                                                    
                                                    self.Categoryimage = (user as AnyObject).value(forKey: "image") as! String
                                                    print(self.Categoryimage)
                                                    
                                                    UserDefaults.standard.set(self.category_id, forKey: "image")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                    print(self.Categoryis_active)
                                                    
                                                    UserDefaults.standard.set(self.Categoryis_active, forKey: "is_active")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                    print(self.author_id)
                                                    
                                                    UserDefaults.standard.set(self.Categoryis_delete, forKey: "is_delete")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                    print(self.product_name)
                                                    
                                                    UserDefaults.standard.set(self.Categorycreate_date, forKey: "create_date")
                                                    UserDefaults.standard.synchronize()







                                                    
                                                  }
                                                
                                               DispatchQueue.main.async {
                                                   self.menuCollectionView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    

    
    

    
    func getAllProduct(){
        
                Alamofire.request("http://zaarmall.com/development/get_all_product", method: .get).responseJSON
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
                                                    
                                                    self.productId = (user as AnyObject).value(forKey: "product_id") as! String
                                                    print(self.productId)
                                                    
                                                    UserDefaults.standard.set(self.productId, forKey: "product_id")
                                                    UserDefaults.standard.synchronize()

                                        
                                                    self.category_id = (user as AnyObject).value(forKey: "category_id") as! String
                                                    print(self.category_id)
                                                    
                                                    UserDefaults.standard.set(self.category_id, forKey: "category_id")
                                                    UserDefaults.standard.synchronize()


                                                    self.subcategory_id = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                    print(self.subcategory_id)
                                                    
                                                    UserDefaults.standard.set(self.subcategory_id, forKey: "sub_category_id")
                                                    UserDefaults.standard.synchronize()
                                                    
                                                    self.child_category_id = (user as AnyObject).value(forKey: "child_category_id") as! String
                                                    print(self.child_category_id)
                                                    
                                                    UserDefaults.standard.set(self.child_category_id, forKey: "child_category_id")
                                                    UserDefaults.standard.synchronize()



//                                                    self.author_id = (user as AnyObject).value(forKey: "author_id") as! String
//                                                    print(self.author_id)
//
//                                                    UserDefaults.standard.set(self.author_id, forKey: "author_id")
//                                                    UserDefaults.standard.synchronize()
//

                                                    self.product_name = (user as AnyObject).value(forKey: "product_name") as! String
                                                    print(self.product_name)
                                                    
                                                    UserDefaults.standard.set(self.product_name, forKey: "product_name")
                                                    UserDefaults.standard.synchronize()


                                                    self.description1 = (user as AnyObject).value(forKey: "description") as! String
                                                    print(self.description1)
                                                    
                                                    UserDefaults.standard.set(self.description1, forKey: "description")
                                                    UserDefaults.standard.synchronize()


                                                   


                                                    self.selling_price = (user as AnyObject).value(forKey: "selling_price") as! String
                                                    print(self.selling_price)
                                                    
                                                    UserDefaults.standard.set(self.selling_price, forKey: "selling_price")
                                                    UserDefaults.standard.synchronize()


                                                    self.original_price = (user as AnyObject).value(forKey: "original_price") as! String
                                                    print(self.original_price)
                                                    
                                                    UserDefaults.standard.set(self.original_price, forKey: "original_price")
                                                    UserDefaults.standard.synchronize()


                                                    self.total_discount = (user as AnyObject).value(forKey: "total_discount") as! String
                                                    print(self.total_discount)
                                                    
                                                    UserDefaults.standard.set(self.total_discount, forKey: "total_discount")
                                                    UserDefaults.standard.synchronize()


                                                    self.stock_quantity = (user as AnyObject).value(forKey: "stock_quantity") as! String
                                                    print(self.stock_quantity)
                                                    
                                                    UserDefaults.standard.set(self.stock_quantity, forKey: "stock_quantity")
                                                    UserDefaults.standard.synchronize()


                                                    self.is_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                    print(self.is_delete)
                                                    
                                                    UserDefaults.standard.set(self.is_delete, forKey: "is_delete")
                                                    UserDefaults.standard.synchronize()


                                                    self.created_date = (user as AnyObject).value(forKey: "created_date") as! String
                                                    print(self.created_date)
                                                    
                                                    UserDefaults.standard.set(self.created_date, forKey: "created_date")
                                                    UserDefaults.standard.synchronize()


                                                    self.rating = (user as AnyObject).value(forKey: "rating") as! String
                                                    print(self.rating)
                                                    
                                                    UserDefaults.standard.set(self.rating, forKey: "rating")
                                                    UserDefaults.standard.synchronize()


//                                                    self.author_name = (user as AnyObject).value(forKey: "store_name") as! String
//                                                    print(self.author_name)
                                                    
//                                                    UserDefaults.standard.set(self.author_name, forKey: "author_name")
//                                                    UserDefaults.standard.synchronize()
                                                    
                                                    var caption = (user as AnyObject).value(forKey: "image") as! NSArray

                                                    
                                                    
                                                                    for imagearray in caption
                                                                    {
                                                                        self.image_1 = (imagearray as AnyObject).value(forKey: "image") as! String
                                                                        print(self.image_1)

                                                                        
                                                                       }

                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        

                                                    self.currentRestArray.append(ResturentName21(authorname:self.author_name,bookTitle:self.product_name,rating: self.rating,amount: self.original_price,bookImage: self.image_1,amount1: self.selling_price,perstage: self.total_discount))






                                                    
                                                  }
                                                
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

