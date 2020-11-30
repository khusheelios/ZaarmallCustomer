//
//  BookStoreProductBrandIteamVc.swift
//  EBookApp
//
//  Created by apple on 23/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
class ResturentNameProduct{
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



class BookStoreProductBrandIteamVc: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout{

        @IBOutlet weak var menuCollectionView: UICollectionView!

        
        
        var restArray = [ResturentNameProduct]()
        
        var currentRestArray = [ResturentNameProduct]()
        
        var estimateWidth = 160.0
        var cellMarginSize = 16.0

         @IBOutlet weak var SearchText: UITextField!
        var menuList = ["Women","Male","Electornic","Books","Author","All"]
           var currentIndex: Int = 0




        override func viewDidLoad() {
            super.viewDidLoad()

                 menuCollectionView.delegate = self
                 menuCollectionView.dataSource = self
            
            
            restArray.append(ResturentNameProduct(authorname:"Women Jeans",bookTitle:"Lee Jeans",rating: "1.5",amount: "150",bookImage: "book_img02"))
            restArray.append(ResturentNameProduct(authorname:"Women Shirt",bookTitle:"Lee Jeans",rating: "2.5",amount: "250",bookImage: "book_img03"))

            restArray.append(ResturentNameProduct(authorname:"Women T-Shirt",bookTitle:"Lee Jeans",rating: "3.5",amount: "350", bookImage: "book_img04"))

            restArray.append(ResturentNameProduct(authorname:"Men Jeans",bookTitle:"Lee Jeans",rating: "4.5",amount: "450",bookImage: "book_img10"))

            restArray.append(ResturentNameProduct(authorname:"Men Shirt",bookTitle:"Lee Jeans",rating: "5.5",amount: "550",bookImage: "book_img02"))

            for str in restArray {
                currentRestArray.append(str)
            }

            self.setupGridView()


        }
        
        
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            SearchText.resignFirstResponder()
            SearchText.text = ""
            self.currentRestArray.removeAll()
            for str in restArray {
                currentRestArray.append(str)
            }
            menuCollectionView.reloadData()
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
            menuCollectionView.reloadData()
            return true
        }

        
        
        
        @IBAction func btnBack(_ sender: Any) {
                            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
            
                            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreHomeVc") as! BookStoreHomeVc
            
            
                            self.present(nextViewController, animated:true, completion:nil)

            
            

        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            
            
            
            if let layout1 = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                    layout1.minimumLineSpacing = 10
                    layout1.minimumInteritemSpacing = 6
                    layout1.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
                    let size1 = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
                    layout1.itemSize = size1
            }

        }


    func setupGridView() {
        let flow = menuCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let numberofItem: CGFloat = 2

        let collectionViewWidth = self.menuCollectionView.bounds.width

        let extraSpace = (numberofItem - 1) * flowLayout.minimumInteritemSpacing

        let inset = flowLayout.sectionInset.right + flowLayout.sectionInset.left

        let width = Int((collectionViewWidth - extraSpace - inset) / numberofItem)

        print(width)

        return CGSize(width: width, height: width)
            
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.currentRestArray.count
       
    }

            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                    let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreProductBrandCVC", for: indexPath) as? BookStoreProductBrandCVC

                    firstcell?.bookTitles.text = currentRestArray[indexPath.row].authorname
                    firstcell?.Authornamelbl.text = currentRestArray[indexPath.row].bookTitle
                    firstcell?.amountlbl.text = currentRestArray[indexPath.row].amount
                    firstcell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)

                    firstcell?.ratingslbl.text = currentRestArray[indexPath.row].rating
                    

                return firstcell!
                

                
                
                
            }
    

        
    }





