//
//  EBRequestBookDetailsVC.swift
//  ZaarMallStackDemo
//
//  Created by Zanjo iOS Dev on 09/11/20.
//  Copyright © 2020 Zanjo iOS Dev. All rights reserved.
//

import UIKit

class EBRequestBookDetailsVC: UIViewController {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnDecline: UIButton!
    
    @IBOutlet weak var lblBottomSubtitle: UILabel!
    @IBOutlet weak var lblBottomTitle: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    var getTitle = String()
    var getSubTitle = String()
    var getBookName = String()
     var getDescription = String()
     var getId = String()
var getQuantity = String()
  
    var getImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblTitle.text = getTitle
        self.lblSubTitle.text = getSubTitle
        self.lblBookName.text = getBookName
        self.lblDescription.text = getDescription
        self.lblQuantity.text = getQuantity
        
        
        topView.dropShadow()
        
        bottomView.dropShadow()
      //  self.imgView.image = UIImage(named: getImage)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackAction(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
