//
//  BookStoreAudioOtherVc.swift
//  EBookApp
//
//  Created by apple on 14/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
//AudioCVC

class ResturentName25{
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



class BookStoreAudioOtherVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var bookAuthorNameArray = ["The Death hhhhhhh","The Road hhhhhhh","The Book hhhhhhh","The Cloud hhhhhhh","The Crown hhhhhhh"]
    var bookSubTitlesArray = ["Death hhhhhhh","Road hhhhhhh","Book hhhhhhh","Cloud hhhhhhh","Crown hhhhhhh"]

    var bookRatingArray = ["50","20","30","40","50"]
      var bookAmountArray = ["150","250","350","450","550"]
    var bookAmountArray1 = ["150","250","350","450","550"]
    var bookPerstageArray = ["15","25","35","45","55"]
    
    var restArray = [ResturentName25]()
    
    var currentRestArray = [ResturentName25]()







    
    var bookAuthorImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]
    
    var bookAuthorImageArray1 = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]

    var estimateWidth = 160.0
    var cellMarginSize = 16.0

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        restArray.append(ResturentName25(authorname:"The Death",bookTitle:"Death",rating: "1.5",amount: "150",bookImage: "book_img02"))
        restArray.append(ResturentName25(authorname:"The Road",bookTitle:"Road",rating: "2.5",amount: "250",bookImage: "book_img03"))

        restArray.append(ResturentName25(authorname:"The Book",bookTitle:"Book",rating: "3.5",amount: "350", bookImage: "book_img04"))

        restArray.append(ResturentName25(authorname:"The Cloud",bookTitle:"Cloud",rating: "4.5",amount: "450",bookImage: "book_img10"))

        restArray.append(ResturentName25(authorname:"The Crown",bookTitle:"Crown",rating: "5.5",amount: "550",bookImage: "book_img02"))

        for str in restArray {
            currentRestArray.append(str)
        }

        
        self.setupGridView()


    }
    
    @IBAction func btnViewAll(_ sender: Any) {
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
                layout.minimumLineSpacing = -25
                layout.minimumInteritemSpacing = -60
                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(collectionView!.bounds.width-10)/2, height: 250)
                layout.itemSize = size
        }
                   else if let layout = collectionView1?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 30
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
        
                if collectionView == collectionView {

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let numberofItem: CGFloat = 2
        
        let collectionViewWidth = self.collectionView.bounds.width
        
        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing
        
        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left
        
        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)
        
        print(width)
        
        return CGSize(width: width, height: width)
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
        if collectionView == collectionView{
            count = 4
        
        }else if collectionView == collectionView1 {
             count = currentRestArray.count

            
        }                else{
            count = 4

        }
        return count!

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
          var cellToReturn = UICollectionViewCell()
        if collectionView == self.collectionView {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreAudioOtherCVC", for: indexPath) as? BookStoreAudioOtherCVC


        cell?.bookTitles.text = bookAuthorNameArray[indexPath.row]
        cell?.Authornamelbl.text = bookSubTitlesArray[indexPath.row]
        cell?.amountlbl.text = bookAmountArray[indexPath.row]
        cell?.amountlbl1.text = bookAmountArray1[indexPath.row]
        cell?.perstagelbl.text = bookPerstageArray[indexPath.row]


        cell?.bookImage.image = bookAuthorImageArray[indexPath.row]
        cell?.ratingslbl.text = bookRatingArray[indexPath.row]
        cell?.btnPlay.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        if indexPath.row == 0
        {
            cell?.cardImage.image = UIImage(named: "card1")
            cell?.cardImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
            cell?.cardImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
             //swipeView.widthAnchor.constraint(equalToConstant: 600).isActive = true
           // swipeView.heightAnchor.constraint(equalToConstant: 500).isActive = true

        }

       else if indexPath.row == 1
        {
            cell?.cardImage.image = UIImage(named: "card02")
            cell?.cardImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
            cell?.cardImage.heightAnchor.constraint(equalToConstant: 241).isActive = true

        }
        
      else  if indexPath.row == 2
        {
            cell?.cardImage.image = UIImage(named: "card03")
            cell?.cardImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
            cell?.cardImage.heightAnchor.constraint(equalToConstant: 241).isActive = true

        }

       else if indexPath.row == 3
        {
            cell?.cardImage.image = UIImage(named: "card2")
            cell?.cardImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
            cell?.cardImage.heightAnchor.constraint(equalToConstant: 300).isActive = true

        }



        cellToReturn = cell!

        }
                        else if collectionView == self.collectionView1{
            let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "AudioCVC", for: indexPath) as? AudioCVC

            firstcell?.bookTitles.text = currentRestArray[indexPath.row].authorname
            firstcell?.Authornamelbl.text = currentRestArray[indexPath.row].bookTitle
            firstcell?.amountlbl.text = currentRestArray[indexPath.row].amount
            firstcell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)

            firstcell?.ratingslbl.text = currentRestArray[indexPath.row].rating
            
//            let btnCart = UIButton(type: .custom)
//            btnCart.frame = CGRect(x: 270, y: 770, width: 130, height: 40)
//            btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
//            btnCart.clipsToBounds = true
//            btnCart.backgroundColor = UIColor.systemOrange
//            btnCart.layer.cornerRadius = 20
//            btnCart.setTitle("Add Product", for: .normal)
//            btnCart.setTitleColor(UIColor.white, for: .normal)
//            btnCart.titleLabel?.font = .systemFont(ofSize: 12)
//
//            btnCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
//            view.addSubview(btnCart)




            cellToReturn = firstcell!



        }

        
        
        
        return cellToReturn

        }
        
    
    @objc func thumbsUpButtonPressed() {



    }

}


