//
//  LoginHelperFunctions.swift
//  Airstrike
//
//  Created by Brian Nielson on 12/12/16.
//  Copyright © 2016 Airstrike. All rights reserved.
//

import UIKit

class LoginHelperFunctions: NSObject {
    
    class func changeRootViewController(toRootOf storyboard: UIStoryboard) {
        guard let window = UIApplication.shared.windows.first else { return }
        let desiredViewController = storyboard.instantiateInitialViewController() as? UINavigationController
        
        guard let view = window.rootViewController?.view else { return }
        
        guard let endView = desiredViewController?.view else { return }
        
        UIView.transition(from: view, to: endView, duration: 0.3, options: UIView.AnimationOptions.transitionCrossDissolve, completion: { someBool in
            window.rootViewController = desiredViewController
        })
    }
    
    class func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
//    class func isValidPassword(testStr: String) -> Bool {
//        let passwordRegEx = ".{8,50}"
//
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
//        return passwordTest.evaluate(with: testStr)
//    }
    
//    class func isValidPassword(testStr : String) -> Bool{
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
//        return passwordTest.evaluate(with: testStr)
//    }
    
    class func isValidPassword(testStr : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        return passwordTest.evaluate(with: testStr)
    }
    
    
    
    class func isValidatePhoneNo(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$";    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    class func showAlertOnViewController(targetVC: UIViewController,title: String,message: String)
    {
        
        let alert = UIAlertController(title: title,
message: message,
preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(
            title:"OK",
            style: UIAlertAction.Style.default,
            handler:
            {
                (alert: UIAlertAction!)  in
        })
        alert.addAction(okButton)
        targetVC.present(alert, animated: true, completion: nil)
    }
    
    
    class func notifyUser(_ title: String, message: String, alertButtonTitles: [String], alertButtonStyles: [UIAlertAction.Style], vc: UIViewController, completion: @escaping (Int)->Void) -> Void
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        for title in alertButtonTitles {
            let actionObj = UIAlertAction(title: title,
                                          style: alertButtonStyles[alertButtonTitles.index(of: title)!], handler: { action in
                                            completion(alertButtonTitles.index(of: action.title!)!)
            })
            
            alert.addAction(actionObj)
        }
        
        
        //vc will be the view controller on which you will present your alert as you cannot use self because this method is static.
        vc.present(alert, animated: true, completion: nil)
    }

    
    
    
    class func presentIncorrectLoginAlert() {
        let alert = UIAlertController(title: "Incorrect Username or Password", message: "The username or password entered is not correct.", preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(button)
       // present(alert, animated: true, completion: .none)
    }
    
}
