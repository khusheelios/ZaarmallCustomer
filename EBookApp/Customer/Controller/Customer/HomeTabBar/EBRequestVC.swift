//
//  EBRequestVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 15/10/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class EBRequestVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    @IBOutlet weak var tblView: UITableView!
    
    var arrTitle = [String]()
    var arrAuthor = [String]()
    var arrLanguage = [String]()
    var arrDiscription = [String]()
    var arrImage = [String]()
 
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EBRequestTVC", for: indexPath) as! EBRequestTVC
        
        cell.lblTitle.text = arrTitle[indexPath.row]
        
        cell.lblAuthor.text = arrAuthor[indexPath.row]
        
        cell.lblDescription.text = arrDiscription[indexPath.row]
        
        cell.lblLanguage.text = arrLanguage[indexPath.row]
        
        let getString = arrImage[indexPath.row]
        
        let getUrl = getString.replacingOccurrences(of: " ", with: "%20", options: NSString.CompareOptions.literal, range:nil)
        
        print(getUrl)
        
        // BasUrl.baseURLPOST + "customer_login"
        
        cell.imgView.sd_setImage(with:URL(string: BasUrl.baseURLPOST + getUrl), placeholderImage: UIImage(named: "image_1"), options: .forceTransition, progress: nil, completed: nil)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBRequestBookDetailsVC") as! EBRequestBookDetailsVC
        
        nextViewController.getTitle = arrTitle[indexPath.row]
        nextViewController.getSubTitle = arrAuthor[indexPath.row]
        nextViewController.getDescription = arrDiscription[indexPath.row]
        nextViewController.getBookName = arrLanguage[indexPath.row]
        
        self.present(nextViewController, animated:true, completion:nil)
    }


        func getCategory(){
            // BasUrl.baseURLPOST + "customer_login"
            //http://zaarmall.com/development/get_all_active_offer

                   let parametersBal: Parameters=[
                        "customer_id":"1"
            ]


                    print(parametersBal)

            
                    Alamofire.request(BasUrl.baseURLPOST  + "get_all_product_request"
    , method: .post, parameters: parametersBal).responseJSON
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
                                                       for case let getInstallment in ((jsonData["data"] as? [AnyObject]))!
                                                      {
                                                        let title = getInstallment["title"] as? String
                                                        
                                                        let author = getInstallment["author"] as? String
                                                        
                                                        let language = getInstallment["language"] as? String
                                                        
                                                        let description = getInstallment["description"] as? String
                                                        
                                                        let image = getInstallment["image"] as? String
                                                        
                                                        self.arrTitle.append(title ?? "")
                                                        self.arrAuthor.append(author ?? "")
                                                        self.arrLanguage.append(language ?? "")
                                                        self.arrDiscription.append(description ?? "")
                                                        self.arrImage.append(image ?? "")
                                                        
                                            
                                                        }
                                                    
                                                    
                                                        
                                                      }
                                                    
                                                   DispatchQueue.main.async {
                                                       self.tblView.reloadData()
                                                   }

                                                    


                                                }
                                                else{
                                                    
                                                }

                                            }


                    }
                    

            
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let btnCart = UIButton(type: .custom)
            btnCart.frame = CGRect(x: 324, y: 760, width: 50, height: 50)
            btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
            btnCart.clipsToBounds = true
         //   btnCart.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnCart.tintColor = #colorLiteral(red: 0.1100466922, green: 0.539958477, blue: 0.7510432005, alpha: 1)
                //UIColor.systemOrange
            //
            btnCart.layer.cornerRadius = 20
            btnCart.setTitle("", for: .normal)
            btnCart.setTitleColor(UIColor.white, for: .normal)
        
        btnCart.setImage(UIImage(named: "plus"), for: .normal)
            btnCart.titleLabel?.font = .systemFont(ofSize: 15)

            btnCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
            view.addSubview(btnCart)
        
        getCategory()
        
       // shadowView.dropShadow()
        
        // Do any additional setup after loading the view.
    }
    

    @objc func thumbsUpButtonPressed() {
            
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             
                     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EbookReuestBooksVc") as! EbookReuestBooksVc
        
        
        
                     self.present(nextViewController, animated:true, completion:nil)
            
            
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
