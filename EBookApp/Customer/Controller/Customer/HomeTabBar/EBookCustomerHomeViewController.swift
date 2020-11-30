//
//  EBookCustomerHomeViewController.swift
//  EBookApp
//
//  Created by apple on 03/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Segmentio

class User2{
    let name: String
    
    init(name: String) {
        self.name = name
    }

}

class ResturentName2{
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



class EBookCustomerHomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var menuCollectionView: UICollectionView!

    @IBOutlet weak var collectionView: UICollectionView!
    
    var userArray = [User2]()
    
    var restArray = [ResturentName2]()
    
    var currentRestArray = [ResturentName2]()
    
    var currentIndex: Int = 0

    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0

    fileprivate var currentStyle = SegmentioStyle.onlyImage
     @IBOutlet weak var SearchText: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()

             menuCollectionView.delegate = self
             menuCollectionView.dataSource = self
        
        collectionView.delegate = self
        collectionView.dataSource = self

        userArray.append(User2(name: "All"))
        userArray.append(User2(name: "Best Selling"))
        userArray.append(User2(name: "Top Rated"))
        userArray.append(User2(name: "Author"))
        
        restArray.append(ResturentName2(authorname:"The Death",bookTitle:"Death",rating: "1.5",amount: "150",bookImage: "book_img02"))
        restArray.append(ResturentName2(authorname:"The Road",bookTitle:"Road",rating: "2.5",amount: "250",bookImage: "book_img03"))

        restArray.append(ResturentName2(authorname:"The Book",bookTitle:"Book",rating: "3.5",amount: "350", bookImage: "book_img04"))

        restArray.append(ResturentName2(authorname:"The Cloud",bookTitle:"Cloud",rating: "4.5",amount: "450",bookImage: "book_img10"))

        restArray.append(ResturentName2(authorname:"The Crown",bookTitle:"Crown",rating: "5.5",amount: "550",bookImage: "book_img02"))

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
       // collectionView.reloadData()
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
       // collectionView.reloadData()
        return true
    }
    @IBAction func btnViewAll(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookBookListViewController") as! EBookBookListViewController
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnNotification(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookNotificatsionVc") as! EBookNotificatsionVc
        self.present(nextViewController, animated:true, completion:nil)

    }

    
    @IBAction func btnChage(_ sender: Any) {
    }
    
    @IBAction func btnRequest(_ sender: Any) {
        
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EbookReuestBooksVc") as! EbookReuestBooksVc
                self.present(nextViewController, animated:true, completion:nil)

    }
    
    
    @IBAction func btnSideMenu(_ sender: Any) {
        
        EBookSideMenuVc.create().showSideMenu(
            viewController: self,
            currentStyle: currentStyle,
            sideMenuDidHide: { [weak self] style in
                self?.dismiss(
                    animated: false,
                    completion: {
                        if self?.currentStyle != style {
                            self?.currentStyle = style
                           // self?.containerViewController?.swapViewControllers(style)
                        }
                    }
                )
            }
        )

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
                    
                }
                else if collectionView == collectionView{
                    count = currentRestArray.count
                }
                else{
                    count = 2

                }
                return count!

            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                  var cellToReturn = UICollectionViewCell()
                if collectionView == self.menuCollectionView {
                    
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookHomeCVC", for: indexPath) as? EBookHomeCVC
                   // if cell!.isSelected {


                cell?.firstlbl.text = userArray[indexPath.row].name
                    cell?.layer.cornerRadius = 18


                cell?.clipsToBounds = true
                cell?.layer.borderWidth = 2
                var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                cell?.layer.borderColor = red.cgColor
                    
                    if indexPath.row == 0{

                        cell?.firstlbl.textColor = UIColor.black
                        cell?.firstlbl.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                        cell?.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)


                    }
                    
                    
                    

                        
                    cellToReturn = cell!

                }
                else if collectionView == self.collectionView{
                    let firstcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomerHomeCVC", for: indexPath) as? CustomerHomeCVC

                    firstcell?.bookTitles.text = currentRestArray[indexPath.row].authorname
                    firstcell?.Authornamelbl.text = currentRestArray[indexPath.row].bookTitle
                    firstcell?.amountlbl.text = currentRestArray[indexPath.row].amount
                    firstcell?.bookImage.image = UIImage(named:currentRestArray[indexPath.row].bookImage)

                    firstcell?.ratingslbl.text = currentRestArray[indexPath.row].rating

                    firstcell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)


                    cellToReturn = firstcell!



                }

                
                
                
                return cellToReturn
            }
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCartVC") as! EBookCartVC
        self.present(nextViewController, animated:true, completion:nil)



    }

    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            if collectionView == self.menuCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookHomeCVC", for: indexPath) as? EBookHomeCVC


                cell?.firstlbl.textColor = UIColor.black
                cell?.firstlbl.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                cell?.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                menuCollectionView.reloadData()


//            self.currentIndex = indexPath.row
//            menuCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
//            for (index, _) in self.userArray.enumerated() {
//                if index == indexPath.row {
//                    self.userArray[index].isSelected = true
//                } else {
//                    self.userArray[index].isSelected = false
//                }
          //  }
            menuCollectionView.reloadData()

            
            }
            
          else  if collectionView == self.collectionView {

            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookDetailsVc") as! EBookDetailsVc
            self.present(nextViewController, animated:true, completion:nil)

            }
            
        }


        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookHomeCVC", for: indexPath) as? EBookHomeCVC

            cell?.firstlbl.textColor = UIColor.black
            cell?.firstlbl.backgroundColor = UIColor.clear
                cell?.layer.cornerRadius = 18


            cell?.clipsToBounds = true
            cell?.layer.borderWidth = 2
            var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            cell?.layer.borderColor = red.cgColor
            var clear = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

            cell?.layer.backgroundColor = clear.cgColor

            menuCollectionView.reloadData()


        }




}
