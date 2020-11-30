
import UIKit
import Segmentio
import Alamofire

typealias SideMenuHandler1 = ((_ style: SegmentioStyle) -> Void)

private let animationDuration: TimeInterval = 0.3


class BookStoreSideMenuVc: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
        var sideMenuDidHide: SideMenuHandler1?
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var btnLeftBack: UIButton!
    
        @IBOutlet fileprivate weak var shadowView: UIView!
        @IBOutlet fileprivate weak var menuTableView: UITableView!
        @IBOutlet fileprivate weak var menuTableViewWidthConstraint: NSLayoutConstraint!
        
        fileprivate var currentStyle = SegmentioStyle.onlyImage
    

        let  menuItems = ["Home","Setting","Payment Settlement","Feedback","Request Products","Plan","More-Category"]
        
        var sidemenuArray = [UIImage (named:"home"),UIImage(named:"settings"),UIImage(named:"money"),
        UIImage(named:"app"),UIImage(named:"question"),UIImage(named:"calendar"),UIImage(named:"backend")]
    
            var rightBackArray = [UIImage (named:""),UIImage(named:""),UIImage(named:""),
    UIImage(named:""),UIImage(named:""),UIImage(named:""),UIImage(named:""),UIImage(named:""),UIImage(named:""),UIImage(named:"next-3")]



    override func viewDidLoad() {
        super.viewDidLoad()


        menuTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        menuTableView.isHidden = true
        view.isHidden = true
        menuTableViewWidthConstraint.constant = UIScreen.main.bounds.width * 0.8
        setupGestureRecognizers()
    }
    
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           

       }


    

        class func create() -> BookStoreSideMenuVc {
            let board = UIStoryboard(name: "bookStore", bundle: nil)
            return board.instantiateViewController(withIdentifier: String(describing: self)) as! BookStoreSideMenuVc
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
            let dissmisSideMenuSelector = #selector(BookStoreSideMenuVc.dismissSideMenu)
            
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
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreSideMenuCell", for: indexPath) as!BookStoreSideMenuCell
        print(menuItems)
        cell.titleslbl?.text = menuItems[indexPath.row]
        
        
         cell.imgSideMenuView.image = sidemenuArray[indexPath.row]
        cell.rightBackImage.image = rightBackArray[indexPath.row]

        
        
        let btnCart = UIButton(type: .custom)
        btnCart.frame = CGRect(x: 305, y: 42, width: 45, height: 45)
        btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
        btnCart.clipsToBounds = true
        btnCart.backgroundColor = UIColor.clear
        btnCart.setImage(UIImage(named:"menu-4"), for: .normal)
        btnCart.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        view.addSubview(btnCart)
        




        
//        if indexPath.row == 6
//        {
//            cell.titleslbl?.font = UIFont.boldSystemFont(ofSize: 20)
//            cell.titleslbl?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -15).isActive = true
//            cell.bottomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -15).isActive = true
//            cell.bottomView.widthAnchor.constraint(equalToConstant: 190).isActive = true
//            
//            
//        }
//        
//

         return cell

    }
    
    
    @objc func thumbsUpButtonPressed() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
        self.present(nextViewController, animated:true, completion:nil)

        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
        self.present(nextViewController, animated:true, completion:nil)
    }

        if indexPath.row == 1
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreSettingVc") as! BookStoreSettingVc
            self.present(nextViewController, animated:true, completion:nil)
        }
        if indexPath.row == 2
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStorePaymentSettlementVC") as! BookStorePaymentSettlementVC
            self.present(nextViewController, animated:true, completion:nil)
        }

        if indexPath.row == 3
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreFeedbackVc") as! BookStoreFeedbackVc
            self.present(nextViewController, animated:true, completion:nil)
        }
 if indexPath.row == 4
 {
     let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreReuestStatusVc") as! BookStoreReuestStatusVc
     self.present(nextViewController, animated:true, completion:nil)
 }

        if indexPath.row == 5
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStorePlanVc") as! BookStorePlanVc
            self.present(nextViewController, animated:true, completion:nil)
        }

        if indexPath.row == 6{
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreMainCategoryVc") as!
            BookStoreMainCategoryVc
            nextViewController.modalPresentationStyle = .overCurrentContext
            nextViewController.modalTransitionStyle = .crossDissolve
            nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
            self.present(nextViewController, animated:true, completion:nil)


        }
        
        
    
    }

    
    
}
extension BookStoreSideMenuVc: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

