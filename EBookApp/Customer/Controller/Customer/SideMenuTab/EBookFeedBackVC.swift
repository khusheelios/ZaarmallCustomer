//
//  EBookFeedBackVC.swift
//  EBookApp
//
//  Created by apple on 16/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookFeedBackVC: UIViewController {
    
    @IBOutlet weak var starRateView: StarRateView!

    @IBOutlet weak var writeReviewsText: UITextField!
    
    var UserRating = String()
    var UserWriteReViews = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRatingView()
    }
    

    func setupRatingView() {
        starRateView.delegate = self
        starRateView.ratingValue = -1
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        self.present(nextViewController, animated:true, completion:nil)

        
    }

    @IBAction func btnSubmit(_ sender: Any) {
        getFeedBack()
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//        self.present(nextViewController, animated:true, completion:nil)


    }
    
    func displayMyAlertMessage(userMessage:String)
    {        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertController.Style.alert);
        let okAction=UIAlertAction(title:"OK",style:UIAlertAction.Style.default,handler:nil);
        let cancelAction=UIAlertAction(title:"Cancel",style:UIAlertAction.Style.default,handler:nil);
        myAlert.addAction(okAction);
        myAlert.addAction(cancelAction);
        self.present(myAlert, animated: true,completion:nil);
        
        
    }

    
    func getFeedBack(){
        print(UserRating)

        UserWriteReViews = writeReviewsText.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
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
                            "type":"Web",
                            "user_type":"Customer",
                            "user_id":"1",
                            "review":self.UserWriteReViews,
                            "rating":self.UserRating
                            
                            
                            
                        ]
                        
                        print(parametersBal)
                        
                        // BasUrl.baseURLPOST + "customer_login"
                        //http://laxmi1963.com/ZaarMall/app_or_web_feedback
                        
                        Alamofire.request(BasUrl.baseURLPOST + "app_or_web_feedback", method: .post, parameters: parametersBal).responseJSON
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
extension EBookFeedBackVC: RatingViewDelegate {
    func updateRatingFormatValue(_ value: Int) {
        print("Rating : = ", value)
    }
}
