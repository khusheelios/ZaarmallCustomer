//
//  EBReviewWriterVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 10/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit
import Loaf
import MBProgressHUD

class EBReviewWriterVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtTitle1: UITextField!
    @IBOutlet weak var txtLinkfirst: CustomizableTextfield!
    
    @IBOutlet weak var txtTitleFifth: UITextField!
    @IBOutlet weak var txtLinkFourth: CustomizableTextfield!
    @IBOutlet weak var txtTitle4: UITextField!
    @IBOutlet weak var txtTitle2: UITextField!
    @IBOutlet weak var txtTitle3: UITextField!
    @IBOutlet weak var txtLinkSecond: CustomizableTextfield!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtLinkFifth: CustomizableTextfield!
    @IBOutlet weak var txtLinkThird: CustomizableTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backAcion(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func placeOrderAction(_ sender: Any)
    {
        
        
  
        
        guard let Title1 = txtTitle1.text , txtTitle1.text != "" else {
            Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
             
            return
            
        }
        guard let LinkOne = txtLinkfirst.text , txtLinkfirst.text != "" else {
           Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
            return
            
        }
        guard let Title2 = txtTitle2.text , txtTitle2.text != "" else {
                   Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                    
                   return
                   
               }
               guard let Linksecond = txtLinkSecond.text , txtLinkSecond.text != "" else {
                  Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                   return
                   
               }
        
        guard let Title3 = txtTitle3.text , txtTitle3.text != "" else {
                      Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                       
                      return
                      
                  }
                  guard let LinkThird = txtLinkThird.text , txtLinkThird.text != "" else {
                     Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                      return
                      
                  }
        
        guard let Title4 = txtTitle4.text , txtTitle4.text != "" else {
                      Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                       
                      return
                      
                  }
                  guard let LinkFourth = txtLinkFourth.text , txtLinkFourth.text != "" else {
                     Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                      return
                      
                  }
        
        guard let Title5 = txtTitleFifth.text , txtTitleFifth.text != "" else {
                      Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                       
                      return
                      
                  }
                  guard let Linkfifth = txtLinkFifth.text , txtLinkFifth.text != "" else {
                     Loaf("Field can't be empty", state: .info, location: .bottom, sender: self).show()
                      return
                      
                  }
        
         MBProgressHUD.showAdded(to: self.view, animated: true)
        
            
                let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let login = MainStoryboard.instantiateViewController(withIdentifier: "navBar") as! UINavigationController

                self.present(login, animated: true, completion: nil)
         
        }
 
    

}
