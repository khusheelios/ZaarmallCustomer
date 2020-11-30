
import UIKit
import Alamofire

class EBookAppChildCategoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var subCategorylbl: UILabel!
    var  CategoryItemsArray = ["Dress","Shirt","TShirt"]
    var getChildCategoryId = String()
    var getCategoryId = String()

    var getChildSubCategoryId = String()


    var ChildCategoryname = String()

     var ChildCategoryimage = String()

     var ChildCategoryis_active = String()

     var ChildCategoryis_delete = String()

     var ChildCategorycreate_date = String()
     
     var ChildcategoryNameArray = [String]()
    var getSelectedSubCategoryId = String()
    var getSelectSubCategoryName = String()
    




    override func viewDidLoad() {
        super.viewDidLoad()
        subCategorylbl.text = getSelectSubCategoryName
        getChildCategory()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
        

    @IBAction func btnBack(_ sender: Any) {
                   self.dismiss(animated: true, completion: nil)


    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChildcategoryNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCategoryTVC", for: indexPath) as!ChildCategoryTVC
        
        cell.moreCategorylbl?.text = ChildcategoryNameArray[indexPath.row]
        

        return cell
    }
    
            func getChildCategory(){
                
                        let parametersBal: Parameters=[
                            "sub_category_id":self.getSelectedSubCategoryId
                            ]
                        
                        print(parametersBal)
                        
                    // BasUrl.baseURLPOST + "customer_login"
                    //http://zaarmall.com/development/get_all_child_categories
                        
                        Alamofire.request(BasUrl.baseURLPOST + "get_all_child_categories", method: .post, parameters: parametersBal).responseJSON
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
                                                            self.ChildcategoryNameArray.append(self.ChildCategoryname)
                                                            

                                                            
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
                                                           self.tableView.reloadData()
                                                       }

                                                        


                                                    }
                                                    else{
                                                        
                                                    }

                                                }


                        }
                        

                
            }



}

