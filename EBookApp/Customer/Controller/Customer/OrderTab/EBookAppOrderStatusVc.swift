
import UIKit
import FlexibleSteppedProgressBar
import Alamofire

class EBookAppOrderStatusVc: UIViewController,FlexibleSteppedProgressBarDelegate {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var sellerNamelbl: UILabel!
    @IBOutlet weak var quntitylbl: UILabel!
    @IBOutlet weak var authorNamelbl: UILabel!
    @IBOutlet weak var productNamelbl: UILabel!
    @IBOutlet weak var orderIdlbl: UILabel!
    @IBOutlet weak var orderstatuspopup: UIView!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    // var progressBarWithDifferentDimensions: FlexibleSteppedProgressBar!
     
     var backgroundColor = UIColor.black
         //UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
     var progressColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

     var textColorHere = UIColor.darkGray
         //UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)

     var maxIndex = -1
    var strZero = String()
    var strOne = String()
    var strTwo = String()
    var strThree = String()
    var progressIndex = Int()
    var strprogressIndex = Int()
    var strPrice = "0"
    var strCusinesName = String()
    var strCusinesName1 = String()
    var strTag = Int()




    override func viewDidLoad() {
        super.viewDidLoad()

                 progressBarWithoutLastState = FlexibleSteppedProgressBar()
                 progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false

                 progressBarWithoutLastState.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)

                 orderstatuspopup.addSubview(progressBarWithoutLastState)
                 
        let horizontalConstraint = progressBarWithoutLastState.centerXAnchor.constraint(equalTo: orderstatuspopup.centerXAnchor,constant: -170)
                 let verticalConstraint = progressBarWithoutLastState.topAnchor.constraint(
                     equalTo: orderstatuspopup.topAnchor,
                     constant: 280
                 )
                 let widthConstraint = progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: 250)
                 let heightConstraint = progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 180)
                 NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

                 progressBarWithoutLastState.numberOfPoints = 4
                 progressBarWithoutLastState.lineHeight = 3
                 progressBarWithoutLastState.radius = 10
                 progressBarWithoutLastState.progressRadius = 10
                 progressBarWithoutLastState.progressLineHeight = 3
                 progressBarWithoutLastState.delegate = self
                 progressBarWithoutLastState.selectedBackgoundColor = progressColor
                 //progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor
                 progressBarWithoutLastState.currentSelectedCenterColor = progressColor
                 progressBarWithoutLastState.stepTextColor = textColorHere
                 progressBarWithoutLastState.currentSelectedTextColor = progressColor

                 progressBarWithoutLastState.currentIndex = 0

    }
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
        progressBar.currentIndex = index
        if index > maxIndex {
            maxIndex = index
            progressBar.completedTillIndex = maxIndex
            
            strprogressIndex = maxIndex
            
            progressIndex = progressBar.completedTillIndex
            
            if (progressIndex == 1){
                
            }else if (progressIndex == 2){

                
            }
            
            else if (progressIndex == 3){

                
            }
            else{


            }
            
            
            
        }
    }
    @IBAction func btnNeedHelp(_ sender: Any) {
    }
    @IBAction func btnCancelOrder(_ sender: Any) {
        
    }
    
    
    
    @IBAction func btnBack(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMyOrderVc") as! EBookMyOrderVc
//        self.present(nextViewController, animated:true, completion:nil)
        
        self.dismiss(animated: true, completion: nil)

    }
    
//    
//            func get_all_productDetails2(getId : String){
//              
//                
//                            let parametersBal: Parameters=[
//                                
//                                    "type":"new_products"
//                                ]
//                            
//                            print(parametersBal)
//                            
//                            // BasUrl.baseURLPOST + "customer_login"
//                            //http://zaarmall.com/development/get_all_product
//                            
//                            Alamofire.request(BasUrl.baseURLPOST + "get_all_product", method: .post, parameters: parametersBal).responseJSON
//                                {
//                                                    response in
//                                                    
//                                                    print(response)
//                                                    
//                                                    //getting the json value from the server
//                                                    if let result = response.result.value {
//                                                        
//                                                        
//                                                        let status = (result as AnyObject).value(forKey: "status") as! CFBoolean
//
//                                                         let message = (result as AnyObject).value(forKey: "message") as! NSString
//                                                      
//                                                            
//
//                                                            self.arrNewProductAdded.removeAll()
//
//
//                                                        
//                                                      
//                                                        
//                                                        
//                                                        if (status == 200 as CFBoolean )
//                                                        {
//                                                            
//                                                        }
//                                                        else{
//                                                            DispatchQueue.main.async {
//                                                                
//                                                           
//                                                                
//                                                                                                                  self.collectionView5.reloadData()
//    //                                                               self.collectionView3.reloadData()
//    //                                                              self.collectionView4.reloadData()
//    //                                                              self.collectionView5.reloadData()
//                                                                                                               
//                                                                                                              }
//                                                        }
//
//                                                    }
//                                                    else{
//                                                        DispatchQueue.main.async {
//                                                            
//                                                          
//                                                     //       self.scrollView.contentSize = CGSize(width: self.view.frame.width, height:self.viewBackground.frame.height - self.collectionView2.frame.height - 200)
//                                                            
//                                                                                                              self.collectionView5.reloadData()
//    //                                                           self.collectionView3.reloadData()
//    //                                                                                                       self.collectionView4.reloadData()
//    //                                                                                                                                                                self.collectionView5.reloadData()
//                                                                                                          }
//                                                    }
//
//
//                            }
//                            
//
//                    
//                }
    
    
    @IBAction func btnCart(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCustomerAddCarrtVc") as! EBookCustomerAddCarrtVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return true
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if progressBar == self.progressBarWithoutLastState || progressBar == self.progressBarWithoutLastState {
            if position == FlexibleSteppedProgressBarTextLocation.top {
                switch index {
                    
                 
                default: break
                    
                }
            } else if position == FlexibleSteppedProgressBarTextLocation.bottom {
                
                switch index {
                    
                case 0: return ""
                case 1: return ""
                    

                case 2: return ""
                case 3: return ""
                //case 4: return "Fifth"
                default: return "Date"
                    
                }
                
            } else if position == FlexibleSteppedProgressBarTextLocation.center {
                switch index {
                    
                default: break
                    
                }
            }
       }
        return ""
    }



}
