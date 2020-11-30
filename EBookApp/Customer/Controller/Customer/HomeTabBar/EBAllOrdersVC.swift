//
//  EBAllOrdersVC.swift
//  EBookApp
//
//  Created by Zanjo iOS Dev on 24/11/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class EBAllOrdersVC: ButtonBarPagerTabStripViewController {
    
    @IBAction func backAcion(_ sender: Any) {
             self.dismiss(animated: true, completion: nil)
         }
    

   let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    override func viewDidLoad() {
    // change selected bar color
    settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
    settings.style.buttonBarItemBackgroundColor = #colorLiteral(red: 0.1098039216, green: 0.5411764706, blue: 0.7529411765, alpha: 1)
        settings.style.selectedBarBackgroundColor = .white
    settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 18)
    settings.style.selectedBarHeight = 2.0
    settings.style.buttonBarMinimumLineSpacing = 0
    settings.style.buttonBarItemTitleColor = .white
  //  settings.style.buttonBarItemsShouldFillAvailiableWidth = true
    settings.style.buttonBarLeftContentInset = 0
    settings.style.buttonBarRightContentInset = 0
    changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
    guard changeCurrentIndex == true else { return }
    oldCell?.label.textColor = .white
        newCell?.label.textColor = .white
    }
    super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1")
    let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child2")
    return [child_1, child_2]
    }
}
