//
//  EBookReuestProductOfferVc.swift
//  EBookApp
//
//  Created by apple on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class EBookReuestProductOfferVc: UIViewController  ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var numberProductlbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var bookTitlesArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]
    var bookAmountArray = ["150","250","350","450","750"]
    var bookPerstageArray = ["15","25","35","45","75"]


    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    
    var bookdecriptsionArray = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]
    var bookAmountArray1 = ["150","250","350","450","750"]
    var dateArray = ["Sat,25 JUne 2020","Sat,26 JUne 2020","Sat,27 JUne 2020","Sat,28 JUne 2020","Sat,29 JUne 2020"]




    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bookTitlesArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductOfferCell", for: indexPath) as!ProductOfferCell
           //print(nameArray.count)
            


            cell.bookTileslbl?.text = bookTitlesArray[indexPath.row]
            cell.authorNamelbl?.text = bookSubTitlesArray[indexPath.row]
            cell.amountlbl.text = bookAmountArray[indexPath.row]
            cell.perstagelbl.text = bookPerstageArray[indexPath.row]

            
            cell.bookImage.image = bookImageArray[indexPath.row]
            cell.textlbl.text = bookdecriptsionArray[indexPath.row]
            cell.amountlbl1.text = bookAmountArray1[indexPath.row]
            cell.datelbl.text = dateArray[indexPath.row]
            cell.btnAccept.addTarget(self, action: #selector(Accept), for: .touchUpInside)
            cell.btnReject.addTarget(self, action: #selector(Reject), for: .touchUpInside)


            

            
            

            return cell

        }

    @objc func Reject() {

        
    }

    
    @objc func Accept() {

        getAccptOrder()
    }




    @IBAction func btnBack(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookReuestProductVc") as! EBookReuestProductVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    func getAccptOrder(){
        let parametersBal: Parameters=[
            "order_id":"2",
            "status":"Accept",
            
            
        ]
        
        print(parametersBal)
        
        
        // BasUrl.baseURLPOST + "customer_login"
        //http://laxmi1963.com/ZaarMall/accept_or_reject_offer
        Alamofire.request(BasUrl.baseURLPOST + "accept_or_reject_offer", method: .post, parameters: parametersBal).responseJSON
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

