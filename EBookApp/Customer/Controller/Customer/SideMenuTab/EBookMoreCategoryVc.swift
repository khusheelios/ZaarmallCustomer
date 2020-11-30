
import UIKit
import Alamofire

class EBookMoreCategoryVc: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
   // var  CategoryItemsArray = ["Women","Men","Electronic"]
    
    var  CategoryNameArray = [String]()
    var  CategoryIdArray = [String]()
    var SelectedStrCatrgoryId = String()
    var SelectedStrCatrgoryName = String()


    
    var getStrCategoryId = String()
    var CategoryId = String()
    var Categoryname = String()

     var Categoryimage = String()

     var Categoryis_active = String()

     var Categoryis_delete = String()

     var Categorycreate_date = String()



    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        getCategory()


        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        



        }
    


    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CategoryNameArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

         let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCategoryCell", for: indexPath) as!MoreCategoryCell
        let catrgoryId = CategoryIdArray[indexPath.row]
        cell.moreCategorylbl?.text = CategoryNameArray[indexPath.row]
       cell.btnCategory.addTarget(self, action: #selector(thumbsUpButtonPressed11), for: .touchUpInside)

        
    //tableView.reloadData()

        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       DispatchQueue.main.async {
            self.tableView.reloadData()
            self.SelectedStrCatrgoryId = self.CategoryIdArray[indexPath.row]
           self.SelectedStrCatrgoryName = self.CategoryNameArray[indexPath.row]

        

                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCategoryByProductVc") as! EBookCategoryByProductVc
        nextViewController.getSelectedStrCatrgoryId = self.SelectedStrCatrgoryId
        nextViewController.getSelectedStrCatrgoryName = self.SelectedStrCatrgoryName

        
                        nextViewController.modalPresentationStyle = .overCurrentContext
                         nextViewController.modalTransitionStyle = .crossDissolve
                         nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.15)

        
                        self.present(nextViewController, animated:true, completion:nil)

        }



    }
    @objc func thumbsUpButtonPressed11() {
        
        
//        DispatchQueue.main.async {
//                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCategoryByProductVc") as! EBookCategoryByProductVc
//
//                        nextViewController.modalPresentationStyle = .overCurrentContext
//                         nextViewController.modalTransitionStyle = .crossDissolve
//                         nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
//
//                        self.present(nextViewController, animated:true, completion:nil)
//
//        }
//

    }
    
    
    func getCategory(){
        
        // BasUrl.baseURLPOST + "customer_login"
        //http://zaarmall.com/development/get_all_categories
                Alamofire.request(BasUrl.baseURLPOST + "get_all_categories", method: .get).responseJSON
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
                                                    
                                                    self.CategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                    self.CategoryIdArray.append(self.CategoryId)

                                                    
                                                    UserDefaults.standard.set(self.CategoryId, forKey: "category_id")
                                                    UserDefaults.standard.synchronize()

                                                    

                                                    self.Categoryname = (user as AnyObject).value(forKey: "name") as! String
                                                    print(self.Categoryname)
                                                    self.CategoryNameArray.append(self.Categoryname)
                                                    
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
                                                   self.tableView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }


}
