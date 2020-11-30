//
//  EBookTabbarVc.swift
//  EBookApp
//
//  Created by apple on 21/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookTabbarVc: UITabBarController, UITabBarControllerDelegate {
    var strCustomerId = String()
    var strCustomerName = String()

    var strCustomerEmail = String()

    var strCustomerPhone = String()

    var strCustomerPassword = String()

    var strCustomerOTP = String()

    var strCustomercreated_date = String()

    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let finalVC = self.viewControllers![4] as! EBookMyProfileViewController //first view controller in the tabbar
        finalVC.getCustomerId = strCustomerId
        finalVC.getCustomerName = strCustomerName

        finalVC.getCustomerEmail = strCustomerEmail

        finalVC.getCustomerPhone = strCustomerPhone

        
    //



    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("the selected index is : \(tabBar.items!.index(of: item))")
        
        
//        if tabBar.items!.index(of: item) == 3
//        {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookCustomerAddCarrtVc") as! EBookCustomerAddCarrtVc
//                               self.present(nextViewController, animated:true, completion:nil)
//        }
        
        
        
    }
    
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let yourView = self.viewControllers![self.selectedIndex] as! UINavigationController
//        yourView.popToRootViewController(animated:false)
//
//     //   let getIndex = tabBar.selectedItem
//
////        if getIndex == 4
////        {

////
////        }
//
//    }


}
