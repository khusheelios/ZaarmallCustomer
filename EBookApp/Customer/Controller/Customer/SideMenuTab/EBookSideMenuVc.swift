//
//  EBookSideMenuVc.swift
//  EBookApp
//
//  Created by apple on 16/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Segmentio

typealias SideMenuHandler = ((_ style: SegmentioStyle) -> Void)

private let animationDuration: TimeInterval = 0.3



class EBookSideMenuVc: UIViewController ,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
        var sideMenuDidHide: SideMenuHandler?
    var ebookAppHomeVc:EBookAppHomeVc!
    var ebookOfferViewController:EBookOfferViewController!

    var ebookFavoritBookVC:EBookFavoritBookVC!
    var eBookTabbarVc:EBookTabbarVc!

    @IBOutlet weak var slideHome: UIView!
    
    
    @IBOutlet weak var btnLeftBack: UIButton!
    
        @IBOutlet fileprivate weak var shadowView: UIView!
        @IBOutlet fileprivate weak var menuTableView: UITableView!
        @IBOutlet fileprivate weak var menuTableViewWidthConstraint: NSLayoutConstraint!
        
       // fileprivate var menuItems = SegmentioStyle.allStyles
        fileprivate var currentStyle = SegmentioStyle.onlyImage
    
   // @IBOutlet weak var btnMyProfile: UIButton!
    //@IBOutlet weak var myImageView: UIImageView!
    var tab:EBookTabbarVc!

        let  arrCategoriesItems = ["Mens","Women","Electronics","Kids","Home & Life","Sports","Supermarket ","Baby","Beauty","Audio Book Cat.","Test","op","XYZ"]
    
    
     let  menuItems = ["Dashboard","Shop by Category","Your Order","Wish list","Settings"]
        
        var sidemenuArray = [UIImage (named:"home"),UIImage(named:"backend"),UIImage(named:"stationary"),UIImage(named:"wishlist"),UIImage(named:"settings")]


    @IBOutlet weak var tblViewCategory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidesBottomBarWhenPushed = true


        menuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        slideHome.isHidden = true
        
        menuTableView.isHidden = true

        view.isHidden = true
//        menuTableViewWidthConstraint.constant = UIScreen.main.bounds.width * 0.8
        setupGestureRecognizers()
    }
    
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           

       }


    

        class func create() -> EBookSideMenuVc {
            let board = UIStoryboard(name: "Main", bundle: nil)
            return board.instantiateViewController(withIdentifier: String(describing: self)) as! EBookSideMenuVc
        }
        
        func showSideMenu(viewController: UIViewController, currentStyle: SegmentioStyle, sideMenuDidHide: SideMenuHandler?) {
            self.currentStyle = currentStyle
            self.sideMenuDidHide = sideMenuDidHide
            modalPresentationStyle = .overCurrentContext
            let size = view.frame.size
            
            viewController.present(self, animated: false) { [weak self] in
                self?.view.isHidden = false
                self?.menuTableView.frame.origin = CGPoint(x: -size.width, y: 0)
                UIView.animate(
                    withDuration: animationDuration,
                    animations: {
                        self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.63)
                        self?.slideAnimationToPoint(.zero)
                        self?.menuTableView.isHidden = false
                    }
                )
            }
        }
        
        // MARK: - Private functions
        
        fileprivate func setupGestureRecognizers() {
            let dissmisSideMenuSelector = #selector(EBookSideMenuVc.dismissSideMenu)
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: dissmisSideMenuSelector)
            tapRecognizer.delegate = self
            shadowView.addGestureRecognizer(tapRecognizer)
            
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: dissmisSideMenuSelector)
            swipeRecognizer.direction = .left
            swipeRecognizer.delegate = self
            view.addGestureRecognizer(swipeRecognizer)
        }
        
        fileprivate func didSelectItem(at indexPath: IndexPath) {
            currentStyle = SegmentioStyle.allStyles[indexPath.row]
            dismissSideMenu()
        }
        
        @objc fileprivate func dismissSideMenu() {
            let size = view.frame.size
            
            UIView.animate(
                withDuration: animationDuration,
                animations: {
                    self.slideAnimationToPoint(CGPoint(x: -size.width, y: 0))
                    self.view.backgroundColor = .clear
                },
                completion: { _ in
                    self.view.isHidden = true
                    self.menuTableView.isHidden = true
                    self.sideMenuDidHide?(self.currentStyle)
                }
            )
        }
        
        fileprivate func slideAnimationToPoint(_ point: CGPoint) {
            UIView.animate(withDuration: animationDuration) {
                self.menuTableView.frame.origin = point
            }
        }
        
        fileprivate func uncheckCurrentStyle() {
            guard let currentStyleIndex = menuItems.firstIndex(of: currentStyle.rawValue) else {
                return
            }
            
            let activeIndexPath = IndexPath(row: currentStyleIndex, section: menuTableView.numberOfSections - 1)
            
            let activeCell = menuTableView.cellForRow(at: activeIndexPath)
           // activeCell?.imageView?.image = defaultCheckboxImage
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        var count : Int = 0
        
        if tableView == self.tblViewCategory{
            count = arrCategoriesItems.count
        }
        else{
            count = menuItems.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellToReturn = UITableViewCell()
        
        
        if tableView == self.tblViewCategory{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                           print(menuItems)
            cell.textLabel?.text = arrCategoriesItems[indexPath.row]
                     
            cellToReturn = cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserNutrignesSideMenuCell", for: indexPath) as!UserNutrignesSideMenuCell
                   print(menuItems)
                   cell.titleslbl?.text = menuItems[indexPath.row]
                   
                   
                    cell.imgSideMenuView.image = sidemenuArray[indexPath.row]
                   
                   if indexPath.row == 2
                   {
//                       let btnCart1 = UIButton(type: .custom)
//                       btnCart1.frame = CGRect(x: 300, y: 277, width: 15, height: 15)
//                       btnCart1.layer.cornerRadius = 0.5 * btnCart1.bounds.size.width
//                       btnCart1.clipsToBounds = true
//                       btnCart1.backgroundColor = UIColor.clear
//                       btnCart1.setImage(UIImage(named:"next-3"), for: .normal)
//                       btnCart1.addTarget(self, action: #selector(thumbsUpButtonPressed1), for: .touchUpInside)
//                       view.addSubview(btnCart1)


                   }
                   
//                   let btnCart = UIButton(type: .custom)
//                   btnCart.frame = CGRect(x: 305, y: 42, width: 45, height: 45)
//                   btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
//                   btnCart.clipsToBounds = true
//                   btnCart.backgroundColor = UIColor.clear
//                   btnCart.setImage(UIImage(named:"menu-4"), for: .normal)
//                   btnCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
//                   view.addSubview(btnCart)

                cellToReturn = cell
                    
        }
        
        return cellToReturn

    }
    
    
    @objc func thumbsUpButtonPressed1() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMoreCategoryVc") as!
        EBookMoreCategoryVc
        nextViewController.modalPresentationStyle = .overCurrentContext
        nextViewController.modalTransitionStyle = .crossDissolve
        nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        self.present(nextViewController, animated:true, completion:nil)

        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // this will show the tabbar when come back to first viewcontroller
        self.eBookTabbarVc?.tabBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // this will hide the tabbar when moved next viewcontroller
        self.eBookTabbarVc?.tabBar.isHidden = true
    }
    
    @IBAction func backAction(_ sender: Any)
    {
        slideHome.isHidden = true
    }
    

    
    @objc func thumbsUpButtonPressed() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        self.present(nextViewController, animated:true, completion:nil)

        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
        
        self.present(nextViewController, animated:false, completion:nil)
        
//        self.view.isHidden = true
//        self.menuTableView.isHidden = true
//        self.sideMenuDidHide?(self.currentStyle)
        
    }

        if indexPath.row == 1
        {
            slideHome.isHidden = false
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMyProfileViewController") as! EBookMyProfileViewController
//            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 2
        {
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBMyOrderVC") as! EBMyOrderVC
            self.present(nextViewController, animated:true, completion:nil)
        }

        if indexPath.row == 3
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            
            nextViewController.selectedIndex = 2
            
            
            self.present(nextViewController, animated:false, completion:nil)


        }
        if indexPath.row == 4
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBSettingVC") as! EBSettingVC
                    
                    self.present(nextViewController, animated:false, completion:nil)
        }

       
        
    
    }
    


    
    
}
extension EBookSideMenuVc: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

