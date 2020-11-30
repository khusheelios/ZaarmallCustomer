//
//  BookStoreProductDetailsVc.swift
//  EBookApp
//
//  Created by apple on 26/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreProductDetailsVc: UIViewController ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var btnAddtocart: CustomizableButton!
    @IBOutlet weak var btnByNow: CustomizableButton!
    @IBOutlet weak var perstagelbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    @IBOutlet weak var authorNamelbl: UILabel!
    @IBOutlet weak var productNamelbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    @IBOutlet weak var strickethoughtlbl1: UILabel!
    @IBOutlet weak var strickethoughtlbl: UILabel!
    var localSource  = [ImageSource(imageString: "01-4")!, ImageSource(imageString: "02-1")!,ImageSource(imageString: "03-1")!]
    
    var sliderLabel: UILabel?
    

    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnFavrtioes: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var bookAuthorNameArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]

    var bookRatingArray = ["50","20","30","40","50"]
      var bookAmountArray = ["150","250","350","450","550"]
    var bookAmountArray1 = ["150","250","350","450","550"]
    var bookPerstageArray = ["15","25","35","45","55"]
    
    var bookAuthorImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    
    var bookAuthorImageArray1 = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]

    var estimateWidth = 160.0
    var cellMarginSize = 16.0



    
        var NameArray = ["Deepak","Jittu","Annu","Ojas"]
        var dayArray = ["1","2","3","4"]
    var ratingArray = ["1.1","2.1","3.1","4.1"]

    var descriptionArray = ["Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.","Lorem ipsum dolor sit er elit lamet consectetaur cillium adipisicing pecu sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]

    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

               slideshow.slideshowInterval = 5.0
               slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
            slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
               
               let pageControl = UIPageControl()
               pageControl.currentPageIndicatorTintColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

               pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.pageIndicator = pageControl
        
               // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
               slideshow.activityIndicator = DefaultActivityIndicator()
               slideshow.currentPageChanged = { page in
                 //  print("current page:", page)
               }
        
        slideshow.setImageInputs(localSource)
           
           let recognizer = UITapGestureRecognizer(target: self, action: #selector(EBookProductDetailsVc.didTap))
           slideshow.addGestureRecognizer(recognizer)
        
//            let attributedString1 = NSMutableAttributedString(string: "$5")
//
//        attributedString1.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString1.length))
//
//        attributedString1.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString1.length))
//        attributedString1.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.systemGreen, range: NSMakeRange(0, attributedString1.length))
//
//
//            strickethoughtlbl.attributedText = attributedString1

        
            let attributedString = NSMutableAttributedString(string: "$55")

        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))

        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            strickethoughtlbl1.attributedText = attributedString

           

    }
    @IBAction func btnShare(_ sender: Any) {
        btnShare.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)

    }
    @IBAction func btnFavrtioes(_ sender: Any) {
        btnFavrtioes.setImage(UIImage(named:"favorite-(1)-1"), for: .normal)
        
        
    }
    
    
    
    @IBAction func btnCart(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCustomerAddCarrtVc") as! EBookCustomerAddCarrtVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return 3
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                

                let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreProductDetailsTVC", for: indexPath) as!BookStoreProductDetailsTVC
                
                    


                
                cell.namelbl.text = NameArray[indexPath.row]
                cell.daylbl.text = dayArray[indexPath.row]
                cell.ratinglbl.text = ratingArray[indexPath.row]

                cell.descrptionlbl.text = descriptionArray[indexPath.row]


                    

                
                
                
                

                return cell
    
    }
    
    @IBAction func btnRateThisProduct(_ sender: Any) {
    }
    @IBAction func btnViewAllRatings(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreProductAllReviewsVc") as! BookStoreProductAllReviewsVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnDeleteProduct(_ sender: Any) {
        
        


    }
    @IBAction func btnEditProduct(_ sender: Any) {

    }
    




}

