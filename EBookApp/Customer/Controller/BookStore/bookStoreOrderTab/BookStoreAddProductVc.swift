//
//  BookStoreAddProductVc.swift
//  EBookApp
//
//  Created by apple on 08/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import BSImagePicker
import Photos



class BookStoreAddProductVc: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource{

    
    @IBOutlet weak var addNewProductlbl: UILabel!
    
    @IBOutlet weak var ractangalePopView: RectangularDashedView!
    @IBOutlet weak var imageFour: UIImageView!
    @IBOutlet weak var imagethird: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var CategoryPopUP: CustomizableView!
    @IBOutlet weak var btnNo1: CustomizableButton!
    @IBOutlet weak var btnYes1: CustomizableButton!
    @IBOutlet weak var bookquantityText: UITextField!
    @IBOutlet weak var newPriceText: UITextField!
    @IBOutlet weak var stockqunatityText: UITextField!
    @IBOutlet weak var addtotalDiscountText: UITextField!
    @IBOutlet weak var addorinalText: UITextField!
    @IBOutlet weak var addsellingText: UITextField!
    @IBOutlet weak var lanuageText: UITextField!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var bookTitles: UITextField!
    @IBOutlet weak var addAuthorText: UITextField!
    @IBOutlet weak var publisherText: UITextField!
    @IBOutlet weak var cashondeliverySelectpopupView: CustomizableView!
    @IBOutlet weak var cashondeliveryView: CustomizableView!
    @IBOutlet weak var selectOnlinePaymentView: CustomizableView!
    @IBOutlet weak var unselectOnlinePaymentView: CustomizableView!
    
    @IBOutlet weak var btnCamra: UIButton!
    
    @IBOutlet weak var btnLanuage: UIButton!
    
    @IBOutlet weak var btnBookQunity: UIButton!
    @IBOutlet weak var advertisepopupView: UIView!
    
    @IBOutlet weak var imageCanera: UIImageView!
    @IBOutlet weak var imageGarllery: UIImageView!
    @IBOutlet weak var btnGarllery: UIButton!
    
    @IBOutlet weak var bookTableView: UITableView!
    @IBOutlet weak var bookQunityPopUp: CustomizableView!
    
    @IBOutlet weak var lanuageTableView: UITableView!
    @IBOutlet weak var languagepopup: CustomizableView!
    
    private var collectionView: UICollectionView!
    private let identifier: String = "identifier"
    private var selectedImages: [UIImage] = []

    
    var baseString1 = String()
    var baseString2 = String()

    var flag = 0
    var imgstring1 : String = ""
     var imgstring2 : String = ""

    
        var OwnerArray = ["men","Women"]
        var countryArray = ["India","Amrica"]
       var laguageArray = ["English","Arabic"]


    var selectedRows:[IndexPath] = []


    var strLanuageName = String()
    var strImage1 = UIImage()
    var strImage2 = UIImage()
    var strImage3 = UIImage()
    var strImage4 = UIImage()


    
    var CategoryID = String()
    var Categoryname = String()

     var Categoryimage = String()

     var Categoryis_active = String()

     var Categoryis_delete = String()

     var Categorycreate_date = String()

     var categoryArray = [String]()
    var arrayOfImageToUpload = [UIImage]()
    
    var UserTitlesName = String()
    var UserAuthorName = String()
    var UserCategoryName = String()
    var UserLanuageOfBook = String()
    var UserSellingPrice = String()
    var UserOriginalPrice = String()
    var UserAddTotaldiscount = String()
    var UserStockQuntity = String()
    var UserNewPrice  = String()
    var UserBookQuntity = String()
    var UserAddPublisherName  = String()
    var UserDescription = String()
    
    var getStrproductCategoryId1 = String()
    var getStrSubCategoryId1 = String()
    var getStrChildSubCategoryId1 = String()


    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard

        print(getStrproductCategoryId1)
        print(getStrSubCategoryId1)

        print(getStrSubCategoryId1)

        categoryTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        bookTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        lanuageTableView.separatorStyle = UITableViewCell.SeparatorStyle.none


        //AddProductBookCategory
        view.addSubview(advertisepopupView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreAddProductVc.handleTap(_:)))
                advertisepopupView.addGestureRecognizer(tapGesture)
              mainView.addSubview(CategoryPopUP)
                let tapGesture11 = UITapGestureRecognizer(target: self, action: #selector(BookStoreAddProductVc.handleTap33(_:)))
                CategoryPopUP.addGestureRecognizer(tapGesture11)
        

              mainView.addSubview(bookQunityPopUp)
                let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(BookStoreAddProductVc.handleTap22(_:)))
                bookQunityPopUp.addGestureRecognizer(tapGesture1)
        
        mainView.addSubview(languagepopup)
          let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(BookStoreAddProductVc.handleTap44(_:)))
          languagepopup.addGestureRecognizer(tapGesture1)



               let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
               flowLayout.minimumLineSpacing = -30
               flowLayout.scrollDirection = .horizontal
               flowLayout.minimumInteritemSpacing = -30
               flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
               flowLayout.itemSize = CGSize(width: 150, height: 150)
        
        collectionView = UICollectionView(frame: CGRect(x: 10, y: ractangalePopView.frame.origin.y + ractangalePopView.frame.size.height - 30, width: 380, height: 120), collectionViewLayout: flowLayout)
               collectionView.dataSource = self
               collectionView.delegate = self
               collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
               collectionView.alwaysBounceHorizontal = true
               collectionView.register(ImageCell.self, forCellWithReuseIdentifier: identifier)
               view.addSubview(collectionView)

        
        
        
        
        
        
            }
    
    
    @objc func handleTap44(_ sender: UITapGestureRecognizer) {
        languagepopup.isHidden = true
        btnLanuage.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

    }

    
    @objc func handleTap22(_ sender: UITapGestureRecognizer) {
        bookQunityPopUp.isHidden = true
        btnBookQunity.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

    }

    @objc func handleTap33(_ sender: UITapGestureRecognizer) {
        CategoryPopUP.isHidden = true
        btnCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

    }

            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                advertisepopupView.isHidden = true
            }

    @IBAction func btnBookQunity(_ sender: Any) {
        if(bookQunityPopUp.isHidden == true){
            bookQunityPopUp.isHidden = false
            btnBookQunity.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            bookQunityPopUp.isHidden = true
            btnBookQunity.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

        }


    }
    @IBAction func btnCategory(_ sender: Any) {
        getCategory()
        
        if(CategoryPopUP.isHidden == true){
            CategoryPopUP.isHidden = false
            btnCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            CategoryPopUP.isHidden = true
            btnCategory.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

        }





        
    }
    @IBAction func btnGarllery(_ sender: Any) {

    }
    @IBAction func btnCamra(_ sender: Any) {
        
               let imagePicker = ImagePickerController()
               presentImagePicker(imagePicker, select: { (asset) in
               }, deselect: { (asset) in
                    
               }, cancel: { (assets) in
                    
               }, finish: { (assets) in
                    
                   self.selectedImages = []
                   let options: PHImageRequestOptions = PHImageRequestOptions()
                   options.deliveryMode = .highQualityFormat
                print(PHImageManagerMaximumSize)
        
                   for asset in assets {
                       PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options) { (image, info) in
                           self.selectedImages.append(image!)
                           self.collectionView.reloadData()
                       }
                   }
               })

        

    }
    @IBAction func btnSelectOnlinePayment(_ sender: Any) {
        selectOnlinePaymentView.isHidden = true

    }
    @IBAction func btnUnselectOnline(_ sender: Any) {
        if(selectOnlinePaymentView.isHidden == true){
            selectOnlinePaymentView.isHidden = false


        }
        else{
            selectOnlinePaymentView.isHidden = true

        }

    }
    @IBAction func btnSelectCashOnDelicery(_ sender: Any) {
        cashondeliverySelectpopupView.isHidden = true

    }
    @IBAction func btnUnselectCashOndelivery(_ sender: Any) {
        if(cashondeliverySelectpopupView.isHidden == true){
            cashondeliverySelectpopupView.isHidden = false


        }
        else{
            cashondeliverySelectpopupView.isHidden = true

        }

    }
    @IBAction func btnLanguage(_ sender: Any) {
        if(languagepopup.isHidden == true){
            languagepopup.isHidden = false
            btnLanuage.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

        }
        else{
            languagepopup.isHidden = true
            btnLanuage.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)

        }


    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreBookPublishVc") as! BookStoreBookPublishVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    
    @IBAction func btnBarachLocation(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAddBrachVc") as! BookStoreAddBrachVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnSendRediract(_ sender: Any) {
        getAddProduct()
        
        if(advertisepopupView.isHidden == true){
            advertisepopupView.isHidden = false
            advertisepopupView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            advertisepopupView.isHidden = true
        }

    
    }
    
    @IBAction func btnNo(_ sender: Any) {
        
        btnNo1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

        btnYes1.backgroundColor = .clear
        btnNo1.setTitleColor(UIColor.white, for: .normal)
        btnYes1.setTitleColor(UIColor.black, for: .normal)
            
            
            btnNo1.layer.cornerRadius = 20
            btnNo1.layer.borderWidth = 1
            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnNo1.layer.borderColor = red.cgColor



            btnYes1.layer.cornerRadius = 20
            btnYes1.layer.borderWidth = 1
            var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnYes1.layer.borderColor = red1.cgColor


        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreBookPublishVc") as! BookStoreBookPublishVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    


    
    
    @IBAction func btnYes(_ sender: Any) {
        advertisepopupView.isHidden = true
        
        btnYes1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

        btnNo1.backgroundColor = .clear
        btnYes1.setTitleColor(UIColor.white, for: .normal)
        btnNo1.setTitleColor(UIColor.black, for: .normal)
            
            
            btnYes1.layer.cornerRadius = 20
            btnYes1.layer.borderWidth = 1
            var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
            btnYes1.layer.borderColor = red.cgColor



            btnNo1.layer.cornerRadius = 20
            btnNo1.layer.borderWidth = 1
            var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnNo1.layer.borderColor = red1.cgColor


        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAdvertiesPlanVc") as! BookStoreAdvertiesPlanVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data: UIImage = selectedImages[indexPath.item]
        let cell: ImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCell
        cell.image.image = data
//        cell.layer.cornerRadius = 20
//        cell.layer.borderWidth = 1
//        var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
//        cell.layer.borderColor = red1.cgColor
        return cell
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == categoryTableView{

            count = self.OwnerArray.count
        }
        else if tableView == bookTableView{
            count = self.countryArray.count

        }
           else if tableView == lanuageTableView{
               count = self.laguageArray.count

           }


        else{
            count = 5

        }
        
        return count!

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          var cellToReturn = UITableViewCell()
        if tableView == self.categoryTableView {

         let cell = tableView.dequeueReusableCell(withIdentifier: "AddProductBookCategory", for: indexPath) as!AddProductBookCategory

        cell.categorylbl?.text = OwnerArray[indexPath.row]
           //owmerText.text = cell.ownerlbl?.text

            cellToReturn = cell
            
        }
        else if tableView == self.bookTableView{
                  let cell = tableView.dequeueReusableCell(withIdentifier: "AddProductBookQunity", for: indexPath) as!AddProductBookQunity
                 cell.qunititylbl?.text = countryArray[indexPath.row]

                     cellToReturn = cell

            
        }
       else if tableView == self.lanuageTableView{
                 let cell = tableView.dequeueReusableCell(withIdentifier: "AddProductBookLaunage", for: indexPath) as!AddProductBookLaunage
                                cell.languagelbl.text = laguageArray[indexPath.row]
                                strLanuageName = cell.languagelbl.text!
                                
                                
                                if selectedRows.contains(indexPath)
                                {
                                              cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)
                                    lanuageText.text = strLanuageName
                                   btnLanuage.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi / 2)

                                    languagepopup.isHidden = true

                                }
                                else
                                {
                                              cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)
                                    btnLanuage.transform = CGAffineTransform(rotationAngle: -2*CGFloat.pi)


                                }
                                cell.btnLaguageSlect.tag = indexPath.row
                                cell.btnLaguageSlect.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)


                    cellToReturn = cell

           
       }



        return cellToReturn
    }
    @objc func checkBoxSelection(_ sender:UIButton)
    {
      let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
      if self.selectedRows.contains(selectedIndexPath)
      {
        self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
      }
      else
      {
        self.selectedRows.append(selectedIndexPath)
      }
      self.lanuageTableView.reloadData()
    }

    
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

   func convertBase64ToImage(imageString: String) -> UIImage {
       let imageData = Data(base64Encoded: imageString,
                            options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
       return UIImage(data: imageData)!
   }
    
    func getCategory(){
        
                Alamofire.request("http://laxmi1963.com/ZaarMall/get_all_categories", method: .get).responseJSON
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
                                                    
                                                    self.CategoryID = (user as AnyObject).value(forKey: "id") as! String
                                                    print(self.CategoryID)
                                                    
                                                    UserDefaults.standard.set(self.CategoryID, forKey: "id")
                                                    UserDefaults.standard.synchronize()

                                                    

                                                    self.Categoryname = (user as AnyObject).value(forKey: "name") as! String
                                                    print(self.Categoryname)
                                                    self.categoryArray.append(self.Categoryname)
                                                    
                                                    //self.restArray.append(ResturentName21(authorname:self.author_name,bookTitle:self.product_name,rating: self.rating,amount: self.original_price,bookImage: self.image_1,amount1: self.selling_price,perstage: self.total_discount))

                                                    
                                                    UserDefaults.standard.set(self.Categoryname, forKey: "name")
                                                    UserDefaults.standard.synchronize()

                                                    
                                                    self.Categoryimage = (user as AnyObject).value(forKey: "image") as! String
                                                    print(self.Categoryimage)
                                                    
                                                    UserDefaults.standard.set(self.Categoryimage, forKey: "image")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                    print(self.Categoryis_active)
                                                    
                                                    UserDefaults.standard.set(self.Categoryis_active, forKey: "is_active")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                    
                                                    UserDefaults.standard.set(self.Categoryis_delete, forKey: "is_delete")
                                                    UserDefaults.standard.synchronize()


                                                    self.Categorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                    
                                                    UserDefaults.standard.set(self.Categorycreate_date, forKey: "create_date")
                                                    UserDefaults.standard.synchronize()





                                                    
                                                  }
                                                
                                               DispatchQueue.main.async {
                                                   self.categoryTableView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    
    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }



    func getAddProduct(){

//           UserTitlesName = bookTitles.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//           UserAuthorName = addAuthorText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//           UserCategoryName = categoryText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserLanuageOfBook = lanuageText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserSellingPrice = addsellingText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//           UserOriginalPrice = addorinalText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//           UserAddTotaldiscount = addtotalDiscountText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserStockQuntity = stockqunatityText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserNewPrice = newPriceText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserBookQuntity = bookquantityText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserAddPublisherName = publisherText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//           UserDescription = descriptionText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//
//
//
//        if((UserTitlesName.isEmpty)
//            || (UserAuthorName.isEmpty) || (UserCategoryName.isEmpty) || (UserLanuageOfBook.isEmpty) || (UserSellingPrice.isEmpty) || (UserOriginalPrice.isEmpty) || (UserAddTotaldiscount.isEmpty) || (UserStockQuntity.isEmpty) || (UserNewPrice.isEmpty) || (UserBookQuntity.isEmpty) || (UserAddPublisherName.isEmpty) || (UserDescription.isEmpty))
//            {
//
//                if (UserTitlesName.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter FullName")
//
//               }
//               else if (UserAuthorName.isEmpty) {
//                   displayMyAlertMessage(userMessage: "Please Enter Email")
//
//               }
//               else if (UserCategoryName.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter Password")
//
//               }
//
//               else if (UserLanuageOfBook.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter ConfromPassword")
//
//               }
//
//               else if (UserSellingPrice.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter Owner Name")
//
//               }
//
//
//               else if (UserOriginalPrice.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter BookStoreName")
//
//               }
//
//               else if (UserAddTotaldiscount.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter Address")
//
//               }
//
//               else if (UserStockQuntity.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter LandMark")
//
//               }
//
//               else if (UserNewPrice.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter CountryName")
//
//               }
//
//               else if (UserBookQuntity.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter CityName")
//
//               }
//
//               else if (UserAddPublisherName.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter StateName")
//
//               }
//
//               else if (UserDescription.isEmpty) {
//
//                   displayMyAlertMessage(userMessage: "Please Enter BusinessContactNumber")
//
//               }
//
//
//
//
//            }

  
        
        
        
        let image = strImage1
        let imgData = image.jpegData(compressionQuality: 0.2)!
        
        self.arrayOfImageToUpload.append(image)
        
        let image1 = strImage2
        let imgData1 = image1.jpegData(compressionQuality: 0.2)!
        self.arrayOfImageToUpload.append(image1)



         let parametersBal: Parameters=[
             "category_id":"1",
             "sub_category_id":"1",
             "child_category_id":"1",
             "author_id":"1",
             "product_name":"DeliveryProduct",
             "description":"123",
             "original_price":"100",
             "total_discount":"10",
             "stock_quantity":"2",
             
         ]

        Alamofire.upload(multipartFormData:
            {
                (multipartFormData) in
                DispatchQueue.main.async {

//                    let count = self.arrayOfImageToUpload.count
//                    for i in 0..<count{
//                        multipartFormData.append(imgData,withName: "image_1", fileName: "image_1", mimeType: "image/jpeg")
//
//
//                    }

                    multipartFormData.append(imgData,withName: "image_1", fileName: "image_1", mimeType: "image/jpeg")
//                    multipartFormData.append(imgData1,withName: "image_2", fileName: "image_2", mimeType: "image/jpeg")


                }
                for (key, value) in parametersBal
                {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
        }, to:"http://zaarmall.com/development/bookStore_add_product",headers:nil)
        { (result) in
            switch result {
            case .success(let upload,_,_ ):
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                })
                upload.responseJSON
                    { response in
                        //print response.result
                        if response.result.value != nil
                        {
                            let dict :NSDictionary = response.result.value! as! NSDictionary
                            print(dict)

                            guard let strStatus = dict["status"] as? Int else { return }
                            print(strStatus)

                            
                            if strStatus == 200
                            {
                              print("DATA UPLOAD SUCCESSFULLY")
                                
//                                var FMDBInfo:Tbl_Info = Tbl_Info()
//                                FMDBInfo.category_id = "1"
//                                FMDBInfo.sub_category_id = "1"
//                                FMDBInfo.child_category_id = "1"
//                                FMDBInfo.author_id = "1"
//
//                                FMDBInfo.product_name = "DeliveryProduct"
//
//                                FMDBInfo.descriptions = "123"
//
//                                FMDBInfo.original_price = "100"
//
//                                FMDBInfo.total_discount = "10"
//
//                                FMDBInfo.stock_quantity = "2"
//
//
//                                let isInserted = FMDBDatabaseModel.getInstance().InsertData(FMDBInfo)
//                                if isInserted{
//                                    Util.invokeAlertMethod(strTitle: "", strBody: "Insert data successfully", delegate: nil)
//                                }else
//                                {
//                                    Util.invokeAlertMethod(strTitle: "", strBody: "Error in inserting record", delegate: nil)
//                                }

                            }
                        }
                }
            case .failure(let encodingError):
                break
            }
        }
        }
    }
        

class ImageCell: UICollectionViewCell {
    var image: UIImageView!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
     
    private func setupViews() {
        image = UIImageView(frame: CGRect(x: 15, y: 0, width: 100, height: 100))
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        addSubview(image)
    }
}


