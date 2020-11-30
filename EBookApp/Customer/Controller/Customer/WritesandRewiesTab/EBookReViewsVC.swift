//
//  EBookReViewsVC.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookReViewsVC: UIViewController {

    
    @IBOutlet weak var reViewsText: UITextField!
    @IBOutlet weak var reViewslbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var authorNamelbl: UILabel!
    @IBOutlet weak var productNamelbl: UILabel!
    @IBOutlet weak var popupBasicReviews: UIView!
    @IBOutlet weak var starRateView: StarRateView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var addProfiesonalReviewsPopUpView: UIView!
    
    var product_name = String()
    var image_1 = String()

    var author_name = String()
    
    var getProductId = String()
    var getCategoryId = String()
    var getAuthorId = String()


    var strRating = String()
    
    
    var UserRating = String()
    var UserWriteReViews = String()


    var getUserId = String()

       override func viewDidLoad() {
           super.viewDidLoad()
           
           if getUserId.isEmpty
               {
                   getUserId  = UserDefaults.standard.string(forKey: "customer_id") ?? "1"
               }
        
        
        getProductReviews()
            // Do any additional setup after loading the view, typically from a nib.
            setupRatingView()
        view.addSubview(addProfiesonalReviewsPopUpView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EBookReViewsVC.handleTap(_:)))
                addProfiesonalReviewsPopUpView.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                addProfiesonalReviewsPopUpView.isHidden = true
            }
        func setupRatingView() {
            starRateView.delegate = self
            starRateView.ratingValue = -1
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    @IBAction func btnSubmit(_ sender: Any) {
        getWriteReviews()

    }
    @IBAction func btnAddProfsonalReviews(_ sender: Any) {
        if(addProfiesonalReviewsPopUpView.isHidden == true){
            addProfiesonalReviewsPopUpView.isHidden = false
            addProfiesonalReviewsPopUpView.backgroundColor = UIColor.black.withAlphaComponent(0.50)
            //popupBasicReviews.isHidden = true
        }
        else{
            addProfiesonalReviewsPopUpView.isHidden = true

        }
        
    }
    @IBAction func btnWriteReviews(_ sender: Any) {
       // popupBasicReviews.isHidden = false

    }
    @IBAction func btnBack(_ sender: Any) {
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)

            
        

    }
    @IBAction func btnProfesionalSubmit(_ sender: Any) {
        addProfiesonalReviewsPopUpView.isHidden = true

    }
    @IBAction func btnCancel(_ sender: Any) {
        addProfiesonalReviewsPopUpView.isHidden = true

    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }

    func getProductReviews(){

        

        
        
                        let parametersBal: Parameters=[
                            "product_id":"1"
                            
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        
                        // BasUrl.baseURLPOST + "customer_login"
                        //http://laxmi1963.com/ZaarMall/get_product_detail_by_customer
                        Alamofire.request(BasUrl.baseURLPOST + "get_product_detail_by_customer", method: .post, parameters: parametersBal).responseJSON
                            {
                                response in
                                
                                print(response)
                                
                                //getting the json value from the server
                                if let result = response.result.value {
                                    
                                    
                                    var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                     var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                    var data = (result as AnyObject).value(forKey: "data") as! NSDictionary



                                    
                                    if (status == 200 as CFBoolean)
                                    {

                                        self.getProductId = (data as AnyObject).value(forKey: "product_id") as! String

                                        print(self.getProductId)
                                        
                                        UserDefaults.standard.set(self.getProductId, forKey: "product_id")
                                        UserDefaults.standard.synchronize()

                                        
                                        self.getCategoryId = (data as AnyObject).value(forKey: "category_id") as! String

                                        print(self.getCategoryId)
                                        
                                        UserDefaults.standard.set(self.getCategoryId, forKey: "category_id")
                                        UserDefaults.standard.synchronize()

                                        
                                        
                                        self.getAuthorId = (data as AnyObject).value(forKey: "author_id") as! String

                                        print(self.getAuthorId)
                                        
                                        UserDefaults.standard.set(self.getAuthorId, forKey: "author_id")
                                        UserDefaults.standard.synchronize()

                                        
                                        
                                        self.product_name = (data as AnyObject).value(forKey: "product_name") as! String

                                        print(self.product_name)
                                        
                                        UserDefaults.standard.set(self.product_name, forKey: "product_name")
                                        UserDefaults.standard.synchronize()
                                        self.productNamelbl.text = self.product_name

                                        
//                                        self.image_1 = (data as AnyObject).value(forKey: "image_1") as! String
//
//                                        print(self.image_1)
//
//
//                                        UserDefaults.standard.set(self.image_1, forKey: "image_1")
//                                        UserDefaults.standard.synchronize()
//

                                        self.author_name = (data as AnyObject).value(forKey: "author_name") as! String

                                        print(self.author_name)
                                        UserDefaults.standard.set(self.author_name, forKey: "author_name")
                                        UserDefaults.standard.synchronize()
                                        self.authorNamelbl.text = self.author_name

                                        


                                        
                                        



                                        
                                        
                                        


                                    }
                                    else if(status == 1 as CFBoolean){
                                        print("Already Exit")

                                    }
                                    else{
                                        
                                    }

                                }

                             }

        

        
    }

        func getWriteReviews(){
            print(UserRating)

            UserWriteReViews = reViewsText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            UserRating = String(starRateView.rating)


            if((UserWriteReViews.isEmpty)
                || (UserRating.isEmpty))
                {
                   
                    if (UserWriteReViews.isEmpty) {
                       
                       displayMyAlertMessage(userMessage: "Please Enter Reviews")

                   }
                   else if (UserRating.isEmpty) {
                       displayMyAlertMessage(userMessage: "Please Select Rating")

                   }

            }
            else{
                            let parametersBal: Parameters=[
                                "customer_id":getUserId,
                                "product_id":self.getProductId,
                                "review":self.UserWriteReViews,
                                "rating":self.UserRating
                                
                                
                                
                            ]
                            
                            print(parametersBal)
                            
                            // BasUrl.baseURLPOST + "customer_login"
                            //http://laxmi1963.com/ZaarMall/send_review_by_customer
                            
                            Alamofire.request(BasUrl.baseURLPOST + "send_review_by_customer", method: .post, parameters: parametersBal).responseJSON
                                {
                                    response in
                                    
                                    print(response)
                                    
                                    //getting the json value from the server
                                    if let result = response.result.value {
                                        
                                        
                                        var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                         var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                        var data = (result as AnyObject).value(forKey: "data") as! NSDictionary



                                        
                                        if (status == 200 as CFBoolean)
                                        {

                                            

                                            LoginHelperFunctions.notifyUser("Alert", message: "Update Successful", alertButtonTitles: ["OK"], alertButtonStyles: [.default], vc: self, completion: { indexOfTappedButton in


                                           let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
                                           self.present(nextViewController, animated:true, completion:nil)

                                            
                                            

                                            })

                                            
                                            
                                            


                                        }
                                        else if(status == 1 as CFBoolean){
                                            print("Already Exit")

                                        }
                                        else{
                                            
                                        }

                                    }

                                 }

            
            }
            
        }


    
    
    }
    extension EBookReViewsVC: RatingViewDelegate {
        func updateRatingFormatValue(_ value: Int) {
            print("Rating : = ", value)
        }
    }
