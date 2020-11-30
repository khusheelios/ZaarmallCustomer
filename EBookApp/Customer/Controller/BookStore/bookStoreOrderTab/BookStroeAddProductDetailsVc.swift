//
//  BookStroeAddProductDetailsVc.swift
//  EBookApp
//
//  Created by apple on 31/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import BSImagePicker
import Photos
import OpalImagePicker


class BookStroeAddProductDetailsVc: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var StokPopup: CustomizableView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var uploadImagelbl: UILabel!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ractangalePopView: RectangularDashedView!
    private var selectedImages: [UIImage] = []
    
      private var selectedImages1: [UIImage] = []
    
    var Product_template_id = String()
    var ProductTemplatecategory_id = String()
    var ProductTemplatesub_category_id = String()

    var ProductTemplatechild_category_id = String()

    var ProductTemplatecolor = String()

    var ProductTemplatefield_name = String()

    var ProductTemplatetag_name = String()

    var ProductTemplateoption = String()
    var ProductTemplatecreated_date = String()
    var productOptionArray = [String]()
    
    var strTagName = String()
    var ProductInputArray = ["Women","Men","Audio","Authors"]
    var ProductDropArray  = ["title","Run"]
    var ProductRadioArray = ["radio","radio1"]
    var villainButton = UITextField()
    var dropvillainButton = UITextField()
    var StrbuttonY: CGFloat = 0.0
    var customView = UIView()







    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard

        
       collectionView.dataSource = self
       collectionView.delegate = self
        //getProductTemplate()
       ractangalePopView.addSubview(collectionView)
        strTagName = "Drop"
        if(strTagName == "input"){
            getInputData()
            
        }
        else if(strTagName == "Drop")
        {
            getDropData()
        }
        else if(strTagName == "radio"){
            
        }

    }
    
    func getDropData(){
        var buttonY: CGFloat = 560
        var buttonY1: CGFloat = -380
        for villain in ProductInputArray {
            print(villain)
            
             dropvillainButton = UITextField(frame: CGRect(x: 16, y: buttonY, width: 384, height: 57))
            buttonY = buttonY + 70
            
            
            dropvillainButton.layer.cornerRadius = 30
            dropvillainButton.backgroundColor = UIColor(red: 221/255.0, green: 232/255.0, blue: 241/255.0, alpha: 1.0)
            dropvillainButton.textColor = .darkGray
            //var insetX: CGFloat = 10
            
            let paddingView : UIView = UIView(frame: CGRect(x: -10, y: 0, width: 30, height: 20))


            dropvillainButton.leftView = paddingView
            dropvillainButton.leftViewMode = .always

            dropvillainButton.placeholder = "\(villain)"
            
            customView = UIView(frame: CGRect(x: 15, y: buttonY1, width: 360, height: 70))
            buttonY1 = buttonY1+70
             customView.layer.borderWidth = 1
             var red1 = UIColor(red: 221/255.0, green: 232/255.0, blue: 241/255.0, alpha: 1.0)
             customView.layer.borderColor = red1.cgColor

             

            customView.isHidden = true
            self.dropvillainButton.addSubview(customView)

           dropvillainButton.addTarget(self, action: #selector(myTargetFunction(_:)),for: .editingDidBegin)



            self.mainView.addSubview(dropvillainButton)

        }

    }
    
    
    func createPopup(){
        
    }
    @objc func myTargetFunction(_ textField: UITextField) {
        if(customView.isHidden == true){
            customView.isHidden = false
        }
        else{
            customView.isHidden = true

        }

    }

    func getInputData(){
        var buttonY: CGFloat = 560
        print(ProductInputArray)
        for villain in ProductInputArray {
            print(villain)
            
             villainButton = UITextField(frame: CGRect(x: 16, y: buttonY, width: 384, height: 57))
                //UIButton(frame: CGRect(x: 50, y: buttonY, width: 250, height: 30))
            buttonY = buttonY + 70
            
            villainButton.layer.cornerRadius = 30
            villainButton.backgroundColor = UIColor(red: 221/255.0, green: 232/255.0, blue: 241/255.0, alpha: 1.0)
            villainButton.textColor = .darkGray
            //var insetX: CGFloat = 10
            
            let paddingView : UIView = UIView(frame: CGRect(x: -10, y: 0, width: 30, height: 20))


            villainButton.leftView = paddingView
            villainButton.leftViewMode = .always

            villainButton.placeholder = "\(villain)"


            self.mainView.addSubview(villainButton)

        }
    }

    
    
    
    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreBookPublishVc") as! BookStoreBookPublishVc
        self.present(nextViewController, animated:true, completion:nil)


    }


    @IBAction func btnCamra(_ sender: Any) {
        if(collectionView.isHidden == true){
            
        collectionView.isHidden = false
            
            
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                     //Show error to user?
                     return
                 }

                 //Example Instantiating OpalImagePickerController with Closures
                 let imagePicker = OpalImagePickerController()

                 //Present Image Picker
            //     presentOpalImagePickerController(imagePicker, animated: true, select: { (_) in
                     //Save Images, update UI
                    //Limit maximum allowed selections to 5
                    imagePicker.maximumSelectionsAllowed = 4

                               self.selectedImages = []
                               let options: PHImageRequestOptions = PHImageRequestOptions()
                               options.deliveryMode = .highQualityFormat
                            
                            print(PHImageManagerMaximumSize)
                    
            
            presentOpalImagePickerController(imagePicker, animated: true,
            select: { (assets) in
                //Select Assets
                

                              for asset in assets {
                                  PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options) { (image, info) in
                                      self.selectedImages.append(image!)
                                   
                                   
                                   print(self.selectedImages.count)
                                   
                                    
                                          self.collectionView.reloadData()
                                   
                                 
                                  }

                    //Dismiss Controller
                    imagePicker.dismiss(animated: true, completion: nil)
                }
            }, cancel: {
                //Cancel
            })
            
            
            
            
            
//               let imagePicker = ImagePickerController()
//
//               presentImagePicker(imagePicker, select: { (asset) in
//               }, deselect: { (asset) in
//
//               }, cancel: { (assets) in
//
//               }, finish: { (assets) in
//
//                   self.selectedImages = []
//                   let options: PHImageRequestOptions = PHImageRequestOptions()
//                   options.deliveryMode = .highQualityFormat
//
//                print(PHImageManagerMaximumSize)
//
//                   for asset in assets {
//                       PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options) { (image, info) in
//                           self.selectedImages.append(image!)
//
//
//                        print(self.selectedImages.count)
//
//                        if self.selectedImages.count <= 3 {
//
//                            for getImg in self.selectedImages{
//
//                                self.selectedImages1.append(getImg)
//                            }
//
//                               self.collectionView.reloadData()
//                        }
//
//                       }
//
//                   }
//
//
//
//               })

        }
        else{
            collectionView.isHidden = true
        }

        

    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return selectedImages.count
        }
         
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            
                               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddProductImageCVC", for: indexPath) as? AddProductImageCVC
                          
                let data: UIImage = selectedImages[indexPath.item]
                   

                      cell?.addProductImage.image = data
                      cell?.layer.cornerRadius = 5
                      cell?.layer.borderWidth = 1
                      var red1 = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1.0)
                      cell?.layer.borderColor = red1.cgColor
                      cell?.btnCross.addTarget(nil, action: #selector(del(sender:)), for: .touchUpInside)

        
            
      
           
            return cell!
        }
    
    @objc func del(sender: UIButton) {

    let indexPath = IndexPath(item: sender.tag, section: 0)

        selectedImages.remove(at: 0)

        self.collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        }) { (finished) in
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        }
       self.collectionView.isHidden = true

    }
        func getProductTemplate(){
            
                    let parametersBal: Parameters=[
                        "category_id":"9",
                        "sub_category_id":"7"
                        ]
                    
                    print(parametersBal)
                    
                    
                    
                    Alamofire.request("http://zaarmall.com/development/get_product_template", method: .post, parameters: parametersBal).responseJSON
                        {
                                            response in
                                            
                                            print(response)
                                            
                                            //getting the json value from the server
                                            if let result = response.result.value {
                                                
                                                
                                                var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                              //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                                var data = (result as AnyObject).value(forKey: "productTemplete") as! NSArray
                                                


                                                
                                                if (status == 200 as CFBoolean )
                                                {

                                                    print("hiiii")
                                                      for user in data
                                                      {
                                                        

                                                        self.Product_template_id = (user as AnyObject).value(forKey: "product_template_id") as! String

                                                        UserDefaults.standard.set(self.Product_template_id, forKey: "product_template_id")
                                                        UserDefaults.standard.synchronize()



                                                        
                                                        self.ProductTemplatecategory_id = (user as AnyObject).value(forKey: "category_id") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatecategory_id, forKey: "category_id")
                                                        UserDefaults.standard.synchronize()


                                                        self.ProductTemplatesub_category_id = (user as AnyObject).value(forKey: "sub_category_id") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatesub_category_id, forKey: "sub_category_id")
                                                        UserDefaults.standard.synchronize()


                                                        
                                                        self.ProductTemplatechild_category_id = (user as AnyObject).value(forKey: "child_category_id") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatechild_category_id, forKey: "child_category_id")
                                                        UserDefaults.standard.synchronize()



                                                        
                                                        self.ProductTemplatecolor = (user as AnyObject).value(forKey: "color") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatecolor, forKey: "color")
                                                        UserDefaults.standard.synchronize()


                                                        self.ProductTemplatefield_name = (user as AnyObject).value(forKey: "field_name") as! String

                                                        print(self.ProductTemplatefield_name)
                                                        UserDefaults.standard.set(self.ProductTemplatefield_name, forKey: "field_name")
                                                        UserDefaults.standard.synchronize()


                                                        
                                                        self.ProductTemplatetag_name = (user as AnyObject).value(forKey: "tag_name") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatetag_name, forKey: "tag_name")
                                                        UserDefaults.standard.synchronize()


                                                        self.ProductTemplateoption = (user as AnyObject).value(forKey: "option") as! String
                                                        
                                                        self.productOptionArray.append(self.ProductTemplateoption)

//                                                        let array = productOptionArray.components(separatedBy: ",")
//                                                        print(self.productOptionArray[0])
//                                                        print(self.productOptionArray[1])

                                                        UserDefaults.standard.set(self.ProductTemplateoption, forKey: "option")
                                                        UserDefaults.standard.synchronize()


                                                        self.ProductTemplatecreated_date = (user as AnyObject).value(forKey: "created_date") as! String

                                                        UserDefaults.standard.set(self.ProductTemplatecreated_date, forKey: "created_date")
                                                        UserDefaults.standard.synchronize()



                                                        
                                                      }
                                                    

                                                    


                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        }
        



    


}
