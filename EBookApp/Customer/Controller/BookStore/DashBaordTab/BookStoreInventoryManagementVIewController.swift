//
//  BookStoreInventoryManagementVIewController.swift
//  EBookApp
//
//  Created by apple on 02/09/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import  Alamofire
import SDWebImage

class ProductTypeInventroy{
    let catetgoryId:String
    let name: String
    let is_active: String

    let is_delete: String

    let create_date: String

    
    
    var bookImage: String
    
    var isSelected: Bool


    
    init(withTitle title: String,id categoryId: String,is_active is_active:String,is_delete is_delete:String,create_date create_date:String,image bookImage:String,isSelected selected: Bool) {
        self.catetgoryId = categoryId
        self.name = title
        self.is_active = is_active

        self.is_delete = is_delete

        self.create_date  = create_date
        self.bookImage = bookImage
        self.isSelected = selected


        
    }

}


class BookStoreInventoryManagementVIewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
    //ProductInventroryCVCCollectionViewCell
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var estimateWidth = 100.0
    var cellMarginSize = 16.0
    var currentIndex: Int = 0
    var menuList = [String]()

    
    //var UserProductArray:[UserProductCategory] = []
    var userArray: [ProductTypeInventroy] = []
    
    var productCategoryId = String()
    var productCategoryName = String()
    var productimageCategory = String()
    var productisisactiveCategory = String()

    var productisdeleteCategory = String()
    var productcreateddateCategory = String()
    var getStrproductCategoryId = String()
    
    
    @IBOutlet weak var btnChildCategory: UIButton!
    @IBOutlet weak var selectchildSubCategoryText: UITextField!
    @IBOutlet weak var selectSubCategoryText: UITextField!
    @IBOutlet weak var childCategoryPopup: CustomizableView!
    @IBOutlet weak var productChildCategoryTableView: UITableView!
    @IBOutlet weak var ProductView: CustomizableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productTypePopUpView: CustomizableView!
    @IBOutlet weak var selectCategorylbl: UILabel!
    @IBOutlet weak var SubCategoryPopupView: UIView!
    @IBOutlet weak var btnDropDown: UIButton!
    
    @IBOutlet weak var CategoryPopUp: CustomizableView!
    
    var getChildCategoryId = String()
    var getCategoryId = String()

    var getChildSubCategoryId = String()


    var ChildCategoryname = String()

     var ChildCategoryimage = String()

     var ChildCategoryis_active = String()

     var ChildCategoryis_delete = String()

     var ChildCategorycreate_date = String()
     
     var ChildcategoryArray = [String]()
    
    
    
    var getSubCategoryId = String()
    var strCategoryId = String()

    var SubCategoryname = String()

     var SubCategoryimage = String()

     var SubCategoryis_active = String()

     var SubCategoryis_delete = String()

     var SubCategorycreate_date = String()
     
     var SubcategoryArray = [String]()
    var SubcategoryIdArray = [String]()

    
     var getStrSubCategoryId = String()
    var selectedIndex=[Int]()





    @IBAction func btProceed(_ sender: Any) {
        if(SubCategoryPopupView.isHidden == true){
            SubCategoryPopupView.isHidden = false
            SubCategoryPopupView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            SubCategoryPopupView.isHidden = true
        }

    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }


    override func viewDidLoad() {
        super.viewDidLoad()

         collectionView.delegate = self
         collectionView.dataSource = self
        let defaults = UserDefaults.standard

         
         getCategoryType()

         
         setupGridView()
         
         self.setupDataSrource()
         self.initialSetup()
        
        
                tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
                productChildCategoryTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

                


                
                tableView.delegate = self
                tableView.dataSource = self


                       
                      view.addSubview(SubCategoryPopupView)
                
                
               productTypePopUpView.addSubview(CategoryPopUp)

                
                productTypePopUpView.addSubview(childCategoryPopup)



         
    }
    @IBAction func btnSelectSubCategory(_ sender: Any) {
        //SubCategoryPopupView.isHidden = true
        //BookStoreAddProductVc
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreInventoryManagementVc") as!BookStoreInventoryManagementVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnCross(_ sender: Any) {
        SubCategoryPopupView.isHidden = true
    }
    
    
    @IBAction func btnDropDown(_ sender: Any) {
        
        if(CategoryPopUp.isHidden == true){
            CategoryPopUp.isHidden = false
            getSubCategory()

            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            CategoryPopUp.isHidden = true
            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


        }
    }
    @IBAction func btnChildCategory(_ sender: Any) {
        if(childCategoryPopup.isHidden == true){
            childCategoryPopup.isHidden = false
            getChildCategory()
            
            btnChildCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            childCategoryPopup.isHidden = true
            btnChildCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


        }

    }

    
    
    
    
                override func viewDidLayoutSubviews() {
                    super.viewDidLayoutSubviews()
                    
                   
                    if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                            layout.minimumLineSpacing = 10
                            layout.minimumInteritemSpacing = -10
                            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                            let size = CGSize(width:(collectionView!.bounds.width-10)/3, height: 100)
                            layout.itemSize = size
                    }

                }


            func setupGridView() {
                let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
                flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
                flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
            }
        

    
    func setupDataSrource() {
        for (index, menuItem) in self.menuList.enumerated() {
            if index == 0 {
                let menuObject = ProductTypeInventroy(withTitle: menuItem, id: menuItem, is_active: menuItem, is_delete: menuItem, create_date: menuItem, image: menuItem, isSelected: true)
                self.userArray.append(menuObject)
            } else {
                let menuObject = ProductTypeInventroy(withTitle: menuItem, id: menuItem, is_active: menuItem, is_delete: menuItem, create_date: menuItem, image: menuItem, isSelected: false)
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
        self.collectionView.reloadData()
    }

    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let numberofItem: CGFloat = 3

        let collectionViewWidth = self.collectionView.bounds.width

        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing

        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left

        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)

        print(width)

        return CGSize(width: width, height: width)
            
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductInventroryCVCCollectionViewCell", for: indexPath) as? ProductInventroryCVCCollectionViewCell
         cell?.layer.borderWidth = 1
        var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
        cell?.layer.borderColor = red1.cgColor

        cell?.layer.masksToBounds = true
        let menuObject = self.userArray[indexPath.row]

        cell?.booklbl.text = menuObject.name
        //cell?.addProductImage.image = productImageArray[indexPath.row]
        cell?.addProductImage.sd_setImage(with: URL(string: "http://zaarmall.com/development/" + userArray[indexPath.row].bookImage), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)

            
       if menuObject.isSelected {
        
         cell?.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        self.getStrproductCategoryId = self.userArray[indexPath.row].catetgoryId
        cell?.booklbl.textColor = UIColor.white
        cell?.layer.cornerRadius = 5
        print(self.getStrproductCategoryId)


        }
       else{
        cell?.backgroundColor = .white
        cell?.booklbl.textColor = UIColor.black
        cell?.layer.cornerRadius = 5



        }

        
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        for (index, _) in self.userArray.enumerated() {
            if index == indexPath.row {
                self.userArray[index].isSelected = true



            } else {
                self.userArray[index].isSelected = false
            }
        }
        collectionView.reloadData()
            


    }
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    
                    var count:Int?
                    if tableView == tableView{

                    count = SubcategoryArray.count
                    }
                    else{
                        count = ChildcategoryArray.count

                    }
                    return count!
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    
                      var cellToReturn = UITableViewCell()
                    if tableView == self.tableView {

                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInvertroyCategoryTVC", for: indexPath) as!ProductInvertroyCategoryTVC
                    
                        


                        let subCategoryId = SubcategoryIdArray[indexPath.row]
                    cell.productcategorylbl.text = SubcategoryArray[indexPath.row]
                        
                        cellToReturn = cell

                    
                    }
                    
                    
                  else if tableView == self.productChildCategoryTableView {

                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInventroyChildCategory", for: indexPath) as!ProductInventroyChildCategory
                    
                        


                    
                    cell.productChildcategorylbl.text = ChildcategoryArray[indexPath.row]
                        
                        cellToReturn = cell

                    
                    }


                    
                    
                    
                    

                    return cellToReturn
        
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.tableView {

        
        
            

            self.getStrSubCategoryId = SubcategoryIdArray[indexPath.row]
            let   selectedData = SubcategoryArray[indexPath.row]
            selectSubCategoryText.text = selectedData

            btnDropDown.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

            
                CategoryPopUp.isHidden = true
            tableView.reloadData()

        
             
        }
        else if tableView == self.productChildCategoryTableView {
                //ChildcategoryArray
            
            let   selectedData = ChildcategoryArray[indexPath.row]
            selectchildSubCategoryText.text = selectedData

            

            btnChildCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

                
                    childCategoryPopup.isHidden = true
            
                   // productChildCategoryTableView.reloadData()


        }
        
        
    }

    
    func getCategoryType(){
        
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

                                                
                                                  for user in data
                                                  {
                                                    
                                                    print("hhhhh")
                                                    self.productCategoryId = (user as AnyObject).value(forKey: "category_id") as! String

                                                    self.productCategoryName = (user as AnyObject).value(forKey: "name") as! String

                                                    self.productimageCategory = (user as AnyObject).value(forKey: "image") as! String


                                                    self.productisisactiveCategory = (user as AnyObject).value(forKey: "is_active") as! String
                                                    
                                                    self.productisdeleteCategory = (user as AnyObject).value(forKey: "is_delete") as! String

                                                    
                                                    self.productcreateddateCategory = (user as AnyObject).value(forKey: "create_date") as! String



                                                    self.userArray.append(ProductTypeInventroy(withTitle: self.productCategoryName,id: self.productCategoryId, is_active: self.productisisactiveCategory, is_delete: self.productisdeleteCategory, create_date: self.productcreateddateCategory, image: self.productimageCategory, isSelected: false))

                                                    
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
    
        func getChildCategory(){
            
                    let parametersBal: Parameters=[
                        "sub_category_id":self.getStrSubCategoryId
                        ]
                    
                    print(parametersBal)
                    
                    
                    
                    Alamofire.request("http://zaarmall.com/development/get_all_child_categories", method: .post, parameters: parametersBal).responseJSON
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
                                                        
                                                        self.getChildCategoryId = (user as AnyObject).value(forKey: "child_category_id") as! String
                                                        
                                                        UserDefaults.standard.set(self.getChildCategoryId, forKey: "child_category_id")
                                                        UserDefaults.standard.synchronize()
                                                        
                                                        
                                                        self.getCategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                        
                                                        UserDefaults.standard.set(self.getCategoryId, forKey: "category_id")
                                                        UserDefaults.standard.synchronize()
                                                        
                                                        
                                                        self.getChildSubCategoryId = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                        
                                                        UserDefaults.standard.set(self.getChildSubCategoryId, forKey: "sub_category_id")
                                                        UserDefaults.standard.synchronize()





                                                        

                                                        self.ChildCategoryname = (user as AnyObject).value(forKey: "name") as! String
                                                        print(self.ChildCategoryname)
                                                        self.ChildcategoryArray.append(self.ChildCategoryname)
                                                        

                                                        
                                                        UserDefaults.standard.set(self.ChildCategoryname, forKey: "name")
                                                        UserDefaults.standard.synchronize()

                                                        
                                                        self.ChildCategoryimage = (user as AnyObject).value(forKey: "image") as! String
                                                        print(self.ChildCategoryimage)
                                                        
                                                        UserDefaults.standard.set(self.ChildCategoryimage, forKey: "image")
                                                        UserDefaults.standard.synchronize()


                                                        self.ChildCategoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                        print(self.ChildCategoryis_active)
                                                        
                                                        UserDefaults.standard.set(self.ChildCategoryis_active, forKey: "is_active")
                                                        UserDefaults.standard.synchronize()


                                                        self.ChildCategoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                        
                                                        UserDefaults.standard.set(self.ChildCategoryis_delete, forKey: "is_delete")
                                                        UserDefaults.standard.synchronize()


                                                        self.ChildCategorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                        
                                                        UserDefaults.standard.set(self.ChildCategorycreate_date, forKey: "create_date")
                                                        UserDefaults.standard.synchronize()







                                                        
                                                      }
                                                    
                                                   DispatchQueue.main.async {
                                                       self.productChildCategoryTableView.reloadData()
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        }
        func getSubCategory(){
            
                    let parametersBal: Parameters=[
                        "category_id":"1"
                        ]
                    
                    print(parametersBal)
                    
                    
                    
                    Alamofire.request("http://zaarmall.com/development/get_all_sub_categories", method: .post, parameters: parametersBal).responseJSON
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
                                                        
                                                        self.getSubCategoryId = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                        self.SubcategoryIdArray.append(self.getSubCategoryId )
                                                        
                                                        UserDefaults.standard.set(self.getSubCategoryId, forKey: "sub_category_id")
                                                        UserDefaults.standard.synchronize()
                                                        
                                                        self.strCategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                        
                                                        UserDefaults.standard.set(self.strCategoryId, forKey: "category_id")
                                                        UserDefaults.standard.synchronize()


                                                        

                                                        self.SubCategoryname = (user as AnyObject).value(forKey: "name") as! String
                                                        print(self.SubCategoryname)
                                                        self.SubcategoryArray.append(self.SubCategoryname)
                                                        

                                                        
                                                        UserDefaults.standard.set(self.SubCategoryname, forKey: "name")
                                                        UserDefaults.standard.synchronize()

                                                        
    //                                                    self.SubCategoryimage = (user as AnyObject).value(forKey: "image") as! String
    //                                                    print(self.SubCategoryimage)
    //
    //                                                    UserDefaults.standard.set(self.SubCategoryimage, forKey: "image")
    //                                                    UserDefaults.standard.synchronize()


                                                        self.SubCategoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                        print(self.SubCategoryis_active)
                                                        
                                                        UserDefaults.standard.set(self.SubCategoryis_active, forKey: "is_active")
                                                        UserDefaults.standard.synchronize()


                                                        self.SubCategoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                        
                                                        UserDefaults.standard.set(self.SubCategoryis_delete, forKey: "is_delete")
                                                        UserDefaults.standard.synchronize()


                                                        self.SubCategorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                        
                                                        UserDefaults.standard.set(self.SubCategorycreate_date, forKey: "create_date")
                                                        UserDefaults.standard.synchronize()







                                                        
                                                      }
                                                    
                                                   DispatchQueue.main.async {
                                                       self.tableView.reloadData()
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        }
        






}
