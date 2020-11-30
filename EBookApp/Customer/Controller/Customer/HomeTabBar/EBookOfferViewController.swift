//
//  EBookOfferViewController.swift
//  EBookApp
//
//  Created by apple on 03/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class User3{
    let name: String
    let Categoryid:String
    
    var isSelected: Bool
    
    init(withTitle title: String, isSelected selected: Bool,Categoryid Categoryid:String) {
        self.name = title
        self.isSelected = selected
        self.Categoryid = Categoryid
    }


}

class ResturentName3{
    var authorname: String

    var bookTitle: String


    var rating: String


    var amount: String

    var bookImage: String

    
    
    init(authorname: String,bookTitle: String,rating: String,amount: String,bookImage: String) {
        self.authorname = authorname

        self.bookTitle = bookTitle


        self.rating = rating


        self.amount = amount



        self.bookImage = bookImage
    }

}




class EBookOfferViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate {

  
    @IBOutlet weak var menuCollectionView: UICollectionView!

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    // var userArray = [User3]()
    
    var userArray: [User3] = []

    
    var restArray = [ResturentName3]()
    
    var currentRestArray = [ResturentName3]()
    
//    var estimateWidth = 160.0
//    var cellMarginSize = 16.0

 //var menuList = ["Women","Male","Electornic","Books","Author","All"]
    var menuList = [String]()

    var currentIndex: Int = 0
    
    var getStrCategoryId = String()
    var CategoryId = String()
    var Categoryname = String()

     var Categoryimage = String()

     var Categoryis_active = String()

     var Categoryis_delete = String()

     var Categorycreate_date = String()
     


    @IBOutlet weak var aaaaaa: UICollectionView!
    
    

     var arrId = [String]()
     var arrCategoryId = [String]()
     var arrCategoryimage = [String]()
     var arrCategoryname = [String]()
     var arrtype = [String]()
     var arrtitle = [String]()
     var arrcategory_type = [String]()
     var arrimage = [String]()
     var arrdiscount_percent = [String]()
     var arrdiscount_amount = [String]()
    
     var arrdescription = [String]()
     var arrsub_category_name = [String]()
    
    
    
    var getUserId = String()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }
        getCategory()
       // getCategory()
//             menuCollectionView.delegate = self
//             menuCollectionView.dataSource = self
        
//        self.setupDataSrource()
//        self.initialSetup()
        

        
        collectionView.delegate = self
        collectionView.dataSource = self
//        userArray.append(User3(name: "Deals of the day"))
//        userArray.append(User3(name: "Big deals of the week"))
//        userArray.append(User3(name: "Top Author Books"))
//        userArray.append(User3(name: "Author"))
        
        restArray.append(ResturentName3(authorname:"The Death",bookTitle:"Death",rating: "1.5",amount: "150",bookImage: "book_img02"))
        restArray.append(ResturentName3(authorname:"The Road",bookTitle:"Road",rating: "2.5",amount: "250",bookImage: "book_img03"))

        restArray.append(ResturentName3(authorname:"The Book",bookTitle:"Book",rating: "3.5",amount: "350", bookImage: "book_img04"))

        restArray.append(ResturentName3(authorname:"The Cloud",bookTitle:"Cloud",rating: "4.5",amount: "450",bookImage: "book_img10"))

        restArray.append(ResturentName3(authorname:"The Crown",bookTitle:"Crown",rating: "5.5",amount: "550",bookImage: "book_img02"))

        for str in restArray {
            currentRestArray.append(str)
        }

    //    self.setupGridView()


    }
    
    
    
    @IBAction func btnSideMenu(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }

    
    
//        override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//
//
////            if let layout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
////                    layout.minimumLineSpacing = 10
////                    layout.minimumInteritemSpacing = 6
////                    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 5)
////                    let size = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
////                    layout.itemSize = size
////            }
//
//
////            if let layout1 = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
////                    layout1.minimumLineSpacing = 10
////                    layout1.minimumInteritemSpacing = 6
////                    layout1.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
////                    let size1 = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
////                    layout1.itemSize = size1
////            }
//
//
//           // self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
//
//        }


//    func setupGridView() {
//        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
//        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
////        if collectionView == menuCollectionView {
////            return CGSize(width: 150, height: 35) // Collection View size right?
////        }
//
//        //else{
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
//
//       // }
//    }

    
    
//    func setupDataSrource() {
//        for (index, menuItem) in self.menuList.enumerated() {
//            if index == 0 {
//                let menuObject = User3(withTitle: menuItem, isSelected: true, Categoryid: menuItem)
//                self.userArray.append(menuObject)
//            } else {
//                let menuObject = User3(withTitle: menuItem, isSelected: false, Categoryid: menuItem)
//                self.userArray.append(menuObject)
//            }
//        }
//    }
    
    //Controls Initial Navigation upon App Launch.
    func initialSetup() {
       // masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[0])
    }
    
    //Updates Menu List Objects upon - Tap on Menu or Scroll using swipe Gestures
    func updateMenuObjects()
    {
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
//                if collectionView == menuCollectionView{
//                    count = self.userArray.count
//
//                }
//                else
                    
                    return arrtitle.count
           
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                  var cellToReturn = UICollectionViewCell()
//                if collectionView == self.menuCollectionView {
//
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionCVC", for: indexPath) as? OfferCollectionCVC
//                   // if cell!.isSelected {
//
//
//                     let menuObject = self.userArray[indexPath.row]
//                     cell?.firstlbl.text = menuObject.name
//
//
//               // cell?.firstlbl.text = userArray[indexPath.row].name
//                        cell?.layer.cornerRadius = 20
//
//
//                    cell?.clipsToBounds = true
//                    cell?.layer.borderWidth = 2
//                    //UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//                    var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//                    cell?.layer.borderColor = red.cgColor
//                    if indexPath.row == 0{
//                        //var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//
//
//
//                                                    cell?.firstlbl.textColor = UIColor.black
//                                                    cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//
//                                                    cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//                                                        cell?.layer.cornerRadius = 20
//
//
//                                                    cell?.clipsToBounds = true
//                                                    cell?.layer.borderWidth = 2
//                                                    var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//                                                    cell?.layer.borderColor = red.cgColor
//
//
//
//
//                    }
//
//                    if menuObject.isSelected {
//
//                                                    cell?.firstlbl.textColor = UIColor.black
//                                                    cell?.firstlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//
//                                                    cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//                                                        cell?.layer.cornerRadius = 20
//
//
//                                                    cell?.clipsToBounds = true
//                                                    cell?.layer.borderWidth = 2
//                                                    var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
//                                                    cell?.layer.borderColor = red.cgColor
//
//
//
//
//
//
//
//
//
//
//
//
//                    } else {
//                        cell?.firstlbl.textColor = UIColor.black
//                        cell?.firstlbl.backgroundColor = UIColor.clear
//                            cell?.layer.cornerRadius = 20
//
//
//                        cell?.clipsToBounds = true
//                        cell?.layer.borderWidth = 2
//                        var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
//                        cell?.layer.borderColor = red.cgColor
//                        var clear = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
//
//                        cell?.layer.backgroundColor = clear.cgColor
//
//                    }
//
//
//                    cellToReturn = cell!
//
//                }
//                else
                    if collectionView == self.collectionView{
                    let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionTVC", for: indexPath) as? OfferCollectionTVC

                    firstcell?.bookTitles.text = arrtitle[indexPath.row]
                    firstcell?.Authornamelbl.text = arrsub_category_name[indexPath.row]
                    firstcell?.amountlbl.text = "\(arrdiscount_percent[indexPath.row])"
                    
                    
                 //   firstcell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)

                    let getString = arrCategoryimage[indexPath.row]
                                                     
                                                           let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
                                                          
                                                          print(getUrl)
                    
                    // BasUrl.baseURLPOST + "customer_login"

                    firstcell?.bookImage.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "tiger"), options: .forceTransition, progress: nil, completed: nil)

                    

                    firstcell?.btnBuyNow.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)


                    cellToReturn = firstcell!



                }

                
                
                
                return cellToReturn
            }
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPatmentVc") as! EBookPatmentVc
        self.present(nextViewController, animated:true, completion:nil)



    }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            if collectionView == self.menuCollectionView
//            {
//            self.currentIndex = indexPath.row
//            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
//            for (index, _) in self.userArray.enumerated() {
//                if index == indexPath.row {
//                    self.userArray[index].isSelected = true
//
////                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
////                     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSelectSubCategoryProductVc") as! EBookSelectSubCategoryProductVc
////                   // nextViewController.strCategoryName1 = strCategoryName
////                    self.present(nextViewController, animated:true, completion:nil)
//
//
//                } else {
//                    self.userArray[index].isSelected = false
//                }
//            }
//            menuCollectionView.reloadData()
//
//            }else{
//                 let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                  let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
//                          //  nextViewController.getProductId = arrproduct_id[indexPath.row]
//                            nextViewController.getCustomerId = arrCategoryId[indexPath.row]
//                          //  nextViewController.getChildId = arrchild_category_id[indexPath.row]
//                            nextViewController.getUserId = getUserId
//                 self.present(nextViewController, animated:true, completion:nil)

         //   }
        }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView == menuCollectionView {
//
//            return CGSize(width: 110, height: 135)
//        }
//        else {
//            return CGSize(width: 105, height: 131)
//
//
//        }
//
//    }

    
    func getCategory(){
        // BasUrl.baseURLPOST + "customer_login"
        //http://zaarmall.com/development/get_all_active_offer

        
                Alamofire.request(BasUrl.baseURLPOST + "get_all_active_offer"
, method: .get).responseJSON
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

                                                print("hiiii")
                                                   for case let getInstallment in ((jsonData["offers"] as? [AnyObject]))!
                                                  {
                                                    let Id = getInstallment["id"] as? String ?? ""
                                                    self.CategoryId = getInstallment["category_id"] as? String ?? ""
                                                    self.Categoryimage = getInstallment["image"] as? String ?? ""
                                                    self.Categoryname = getInstallment["name"] as? String ?? ""
                                                    let type = getInstallment["type"] as? String
                                                    let title = getInstallment["title"] as? String
                                                    
                                                    let category_type = getInstallment["category_type"] as? String
                                                    let image = getInstallment["image"] as? String
                                                    let discount_percent = getInstallment["discount_percent"] as? String
                                                    let discount_amount = getInstallment["discount_amount"] as? String
                                                    let description = getInstallment["description"] as? String
                                                    let sub_category_name = getInstallment["sub_category_name"] as? String
                                                    
                                             
                                                    
                                                    self.arrId.append(Id)
                                                    self.arrCategoryId.append(self.CategoryId)
                                                    self.arrCategoryimage.append(self.Categoryimage)
                                                    self.arrCategoryname.append(self.Categoryname)
                                                    self.arrtype.append(type ?? "")
                                                    self.arrtitle.append(title ?? "")
                                                    self.arrcategory_type.append(category_type ?? "")
                                                    self.arrimage.append(image ?? "")
                                                    self.arrdiscount_percent.append(discount_percent ?? "")
                                                    self.arrdiscount_amount.append(discount_amount ?? "")
                                                    self.arrdescription.append(description ?? "")
                                                    self.arrsub_category_name.append(sub_category_name ?? "")
                                                       

                                                    
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

extension EBookOfferViewController :  UICollectionViewDelegateFlowLayout
{
    /*
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 4.5
        let itemWidth = (collectionView.bounds.width - 5.0) / 4.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    */
}
