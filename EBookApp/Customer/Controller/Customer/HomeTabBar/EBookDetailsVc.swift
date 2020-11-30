
import UIKit

class EBookDetailsVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var EBookDetailsVc: ImageSlideshow!
    
    var bookAuthorNameArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]

    var bookRatingArray = ["50","20","30","40","50"]
      var bookAmountArray = ["150","250","350","450","550"]
    var bookAmountArray1 = ["150","250","350","450","550"]
    var bookPerstageArray = ["15","25","35","45","55"]
    
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    var localSource  = [ImageSource(imageString: "01-4")!, ImageSource(imageString: "02-1")!,ImageSource(imageString: "03-1")!]
    
    var sliderLabel: UILabel?







    
    var bookAuthorImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    
    var bookAuthorImageArray1 = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]

    var estimateWidth = 160.0
    var cellMarginSize = 16.0

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let label25 = UILabel(frame: CGRect(x: 20, y: 1100, width: 150, height: 30))
         //UILabel(frame: slideshow.bounds)
        label25.backgroundColor = .clear
        label25.textAlignment = .center
        label25.textColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        label25.numberOfLines = 0

        label25.text = "Similar Products"
        label25.font = UIFont.boldSystemFont(ofSize: 15)



        
        self.setupGridView()


        
        
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
                  // print("current page:", page)
               }
        
        slideshow.setImageInputs(localSource)
           
           let recognizer = UITapGestureRecognizer(target: self, action: #selector(EBookProductDetailsVc.didTap))
           slideshow.addGestureRecognizer(recognizer)
           

    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

    

    @IBAction func btnViewAll(_ sender: Any) {
        //EBookSelectSubCategoryProductVc
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookSelectSubCategoryProductVc") as! EBookSelectSubCategoryProductVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnBuyNow(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPatmentVc") as! EBookPatmentVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnAddCart(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnGift(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookGiftVc") as! EBookGiftVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    @IBAction func btnCart(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)

//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//            self.present(nextViewController, animated:true, completion:nil)

            
        

    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        self.setupGridView()
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 5
                layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
                let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 250)
                layout.itemSize = size
        }

    }

    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let numberofItem: CGFloat = 2
        
        let collectionViewWidth = self.collectionView.bounds.width
        
        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
        
        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
        
        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
        
        print(width)
        
        return CGSize(width: width, height: width)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookCVC", for: indexPath) as? EBookCVC


        cell?.bookTitles.text = bookAuthorNameArray[indexPath.row]
        cell?.Authornamelbl.text = bookSubTitlesArray[indexPath.row]
        cell?.amountlbl.text = bookAmountArray[indexPath.row]
        cell?.bookImage.image = bookAuthorImageArray[indexPath.row]
        cell?.ratingslbl.text = bookRatingArray[indexPath.row]
        cell?.amountlbl1.text = bookAmountArray1[indexPath.row]
        cell?.perstagelbl.text = bookPerstageArray[indexPath.row]
        cell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)


        return cell!
    }
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)


        
    }



}
//extension EBookDetailsVc: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.bookAuthorNameArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookCVC", for: indexPath) as? EBookCVC
//
//
//                cell?.bookTitles.text = bookAuthorNameArray[indexPath.row]
//                cell?.Authornamelbl.text = bookSubTitlesArray[indexPath.row]
//                cell?.amountlbl.text = bookAmountArray[indexPath.row]
//                cell?.bookImage.image = bookAuthorImageArray[indexPath.row]
//                cell?.ratingslbl.text = bookRatingArray[indexPath.row]
//
//        return cell!
//    }
//}
//
//extension EBookDetailsVc: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = self.calculateWith()
//        return CGSize(width: width, height: width)
//    }
//
//    func calculateWith() -> CGFloat {
//        let estimatedWidth = CGFloat(estimateWidth)
//        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
//
//        let margin = CGFloat(cellMarginSize * 2)
//        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
//
//        return width
//    }
//}






extension EBookDetailsVc: RatingViewDelegate {
    func updateRatingFormatValue(_ value: Int) {
        print("Rating : = ", value)
    }
}
