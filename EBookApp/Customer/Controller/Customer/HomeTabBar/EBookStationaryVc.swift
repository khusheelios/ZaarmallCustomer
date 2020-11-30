//
//  EBookStationaryVc.swift
//  EBookApp
//
//  Created by apple on 26/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookStationaryVc: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var bookAuthorNameArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]

    var bookRatingArray = ["5","2","3","4","5"]
      var bookAmountArray = ["150","250","350","450","550"]




    
    var bookAuthorImageArray = [UIImage (named:"ZaarMall Business Card"),UIImage(named:"ZaarMall Complimentary"),UIImage(named:"ZaarMall Envelope"),UIImage(named:"ZaarMall Letter Head"),UIImage(named:"ZaarMall Letter Head"),]
    

    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    var template =  UIView()


    @IBOutlet weak var btnCard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.setupGridView()


    }
    

    @IBAction func btnCard(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)


    }
    
    @IBAction func btnBack(_ sender: Any) {
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)

            
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 5
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
        return bookAuthorNameArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookStatonaryCell", for: indexPath) as? EBookStatonaryCell


        cell?.bookTitles.text = bookAuthorNameArray[indexPath.row]
        cell?.Authornamelbl.text = bookSubTitlesArray[indexPath.row]
        cell?.amountlbl.text = bookAmountArray[indexPath.row]
        cell?.bookImage.image = bookAuthorImageArray[indexPath.row]
        cell?.ratingslbl.text = bookRatingArray[indexPath.row]
        
        cell?.btnAddToCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)

        
        if indexPath.row == 1 {
            
            template = UIView.init(frame: CGRect(x: 5, y: 3, width: 200, height: 240))
            template.backgroundColor = UIColor.systemGroupedBackground.withAlphaComponent(0.60)
            
               setImage()
            
            cell?.addSubview(template)

            

        }




        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookDetailsVc") as! EBookDetailsVc
        self.present(nextViewController, animated:true, completion:nil)


        
    }


    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let selectedSvc = userArray[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EBookHomeCVC", for: indexPath) as! EBookHomeCVC

    }



    func setImage(){
        var image: UIImage = UIImage(named: "sold_out_01")!
        
        var imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 115,y: 170,width: 60,height: 50)
        template.addSubview(imageView)


        
    }

    
    
    @objc func thumbsUpButtonPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookEmptyCardVc") as! EBookEmptyCardVc
        self.present(nextViewController, animated:true, completion:nil)


        
    }


}
