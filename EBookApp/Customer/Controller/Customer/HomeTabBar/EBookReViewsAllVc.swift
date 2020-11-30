
import UIKit
//ProductDetailsTVC
import Alamofire
import SDWebImage
import Kingfisher
 import MBProgressHUD
import SwiftSoup
import Loaf
//ProductAllReviewsTVC

class EBookReViewsAllVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
        var NameArray = [String]()
      //  var dayArray = ["1","2","3","4"]
    var ratingArray = [String]()

    @IBOutlet weak var aaaaaa: UITableView!
    var descriptionArray = [String]()

 var getProductId = String()

    

    func getDetailsAllReview(){

                let parametersBal: Parameters=[
                    "product_id":getProductId
        ]


                print(parametersBal)


                 // BasUrl.baseURLPOST + "customer_login"
                 //http://zaarmall.com/development/get_all_review

                Alamofire.request(BasUrl.baseURLPOST + "get_all_review", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in

                                        print(response)

                                        //getting the json value from the server
                                        if let result = response.result.value {


                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                          
                                            
                                            


                                            if (status == 200 as CFBoolean )
                                            {

                                                var data = (result as AnyObject).value(forKey: "Reviews") as! NSArray


                                                
                                                print("hiiii")
                                                  for user in data
                                                  {

                                                    let getCustomerName = (user as AnyObject).value(forKey: "customer_name") as! String
                                                    
                                                    let getRating = (user as AnyObject).value(forKey: "rating") as! String
                                                    
                                                    let getReview = (user as AnyObject).value(forKey: "review") as! String
                                 
                                                    self.NameArray.append(getCustomerName)
                                                    self.ratingArray.append(getRating)
                                                                                                       
                                                    self.descriptionArray.append(getReview)
                                                                                                       
               

                                                }
                                                    
                                        


                                            }
                                               
                                                
                                         
                                                

                                               DispatchQueue.main.async {
                                                  self.tableView.reloadData()
                                               }




                                            }
                                            else{
                                                                                  MBProgressHUD.hide(for: self.view, animated: true)
                                                                                  
                                                                              }

                                        }
                        


                }



    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 141
        
        
        getDetailsAllReview()

    }
    @IBAction func btnBack(_ sender: Any) {
        //EBookProductDetailsVc
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookProductDetailsVc") as! EBookProductDetailsVc
//        self.present(nextViewController, animated:true, completion:nil)

        self.dismiss(animated: true, completion: nil)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return NameArray.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                

                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductAllReviewsTVC", for: indexPath) as!ProductAllReviewsTVC
                
                    
//                let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! tableCell
//                       cell.frame = tableView.bounds
//                       cell.layoutIfNeeded()
//                       cell.objCollectionView.reloadData()
//                       cell.objCollectionViewHeightConstraint.constant = cell.objCollectionView.contentSize.height

                
                cell.namelbl.text = NameArray[indexPath.row]
          //      cell.daylbl.text = dayArray[indexPath.row]
                cell.ratinglbl.text = ratingArray[indexPath.row]

                cell.descrptionlbl.text = descriptionArray[indexPath.row]


                    

                
                
                
                

                return cell
    
    }



}
