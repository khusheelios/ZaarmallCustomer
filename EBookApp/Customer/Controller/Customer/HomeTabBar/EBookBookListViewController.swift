import UIKit

class User11{
    let name: String
    
    init(name: String) {
        self.name = name
    }

}

class ResturentName12{
    var authorname: String

    var bookTitle: String


    var rating: String


    var amount: String


    var bookImage: String

    
    
    init(authorname: String,bookTitle: String,rating: String,amount: String,bookImage: String) {
        self.authorname = authorname

        self.bookTitle = bookTitle


        self.rating = rating


        self.amount = amount



        self.bookImage = bookImage
    }

}



class EBookBookListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {

    @IBOutlet weak var menuCollectionView: UICollectionView!

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var soldPopUpView: UIView!
    var userArray = [User11]()
    
    var restArray = [ResturentName12]()
    
    var currentRestArray = [ResturentName12]()
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0

     @IBOutlet weak var SearchText: UITextField!

    @IBOutlet weak var filterPopUpView: UIView!
    
    var template =  UIView()

    

    override func viewDidLoad() {
        super.viewDidLoad()

             menuCollectionView.delegate = self
             menuCollectionView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self

        userArray.append(User11(name: "All"))
        userArray.append(User11(name: "Best Selling"))
        userArray.append(User11(name: "Top Rated"))
        userArray.append(User11(name: "Author"))
        
        restArray.append(ResturentName12(authorname:"The Death",bookTitle:"Death",rating: "1.5",amount: "150",bookImage: "book_img02"))
        restArray.append(ResturentName12(authorname:"The Road",bookTitle:"Road",rating: "2.5",amount: "250",bookImage: "book_img03"))

        restArray.append(ResturentName12(authorname:"The Book",bookTitle:"Book",rating: "3.5",amount: "350", bookImage: "book_img04"))

        restArray.append(ResturentName12(authorname:"The Cloud",bookTitle:"Cloud",rating: "4.5",amount: "450",bookImage: "book_img10"))

        restArray.append(ResturentName12(authorname:"The Crown",bookTitle:"Crown",rating: "5.5",amount: "550",bookImage: "book_img02"))
        
        for str in restArray {
            currentRestArray.append(str)
        }

        self.setupGridView()
        view.addSubview(filterPopUpView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EBookBookListViewController.handleTap(_:)))
                filterPopUpView.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                filterPopUpView.isHidden = true
            }
    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func btnCard(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCartVC") as! EBookCartVC
        self.present(nextViewController, animated:true, completion:nil)


    }
    @IBAction func btnFilter(_ sender: Any) {
        if(filterPopUpView.isHidden == true){
            filterPopUpView.isHidden = false
            filterPopUpView.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        }
        else{
            filterPopUpView.isHidden = true

        }
    }
    @IBAction func btnViewAll(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookDetailsVc") as! EBookDetailsVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        SearchText.resignFirstResponder()
        SearchText.text = ""
        self.currentRestArray.removeAll()
        for str in restArray {
            currentRestArray.append(str)
        }
        collectionView.reloadData()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (SearchText.text?.count)! != 0 {
            self.currentRestArray.removeAll()
            for str in restArray {
                let range = str.authorname.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
                
                if range != nil {
                    self.currentRestArray.append(str)
                }
            }
        }
        collectionView.reloadData()
        return true
    }
    

    
    
    
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
    //        self.setupGridView()
    //        DispatchQueue.main.async {
    //            self.collectionView.reloadData()
    //        }
            
            if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                    layout.minimumLineSpacing = 10
                    layout.minimumInteritemSpacing = 6
                    layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
                    let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 300)
                    layout.itemSize = size
            }

        }

    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == menuCollectionView {
            return CGSize(width: 100, height: 35) // Collection View size right?
        }
        else{
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let numberofItem: CGFloat = 2
        
        let collectionViewWidth = self.collectionView.bounds.width
        
        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
        
        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
        
        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
        
        print(width)
        
        return CGSize(width: width, height: width)
        }
    }

    
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                var count:Int?
                if collectionView == menuCollectionView{
                    count = self.userArray.count
                    
                }else if collectionView == collectionView{
                    count = currentRestArray.count
                }
//                else{
//                    count = 2
//
//                }
                return count!

            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                  var cellToReturn = UICollectionViewCell()
                if collectionView == self.menuCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookListCVC", for: indexPath) as? EBookListCVC


                cell?.homelbl.text = userArray[indexPath.row].name
                cell?.layer.cornerRadius = 18
                cell?.clipsToBounds = true
                cell?.layer.borderWidth = 2
                var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                cell?.layer.borderColor = red.cgColor
                    cellToReturn = cell!

                }
                else if collectionView == self.collectionView{
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookListTVC", for: indexPath) as? EBookListTVC
                    
                    cell?.bookTitles.text = currentRestArray[indexPath.row].authorname
                    cell?.Authornamelbl.text = currentRestArray[indexPath.row].bookTitle
                    cell?.amountlbl.text = currentRestArray[indexPath.row].amount
                    cell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)

                    cell?.ratingslbl.text = currentRestArray[indexPath.row].rating
                    cell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
              
                    if indexPath.row == 1 {
                        
                        template = UIView.init(frame: CGRect(x: 5, y: 3, width: 200, height: 240))
                        template.backgroundColor = UIColor.systemGroupedBackground.withAlphaComponent(0.60)
                        
                           setImage()
                        
                        cell?.addSubview(template)

                        

                    }



                    cellToReturn = cell!

                    
                    
                }

                
                
                
                return cellToReturn
            }
    
    
    func setImage(){
        var image: UIImage = UIImage(named: "sold_out_01")!
        
        var imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 115,y: 170,width: 60,height: 50)
        template.addSubview(imageView)


        
    }
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCartVC") as! EBookCartVC
        self.present(nextViewController, animated:true, completion:nil)


        
    }

    
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookDetailsVc") as! EBookDetailsVc
            self.present(nextViewController, animated:true, completion:nil)


            
        }


        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            let selectedSvc = userArray[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookHomeCVC", for: indexPath) as! EBookHomeCVC

        }

            


}

