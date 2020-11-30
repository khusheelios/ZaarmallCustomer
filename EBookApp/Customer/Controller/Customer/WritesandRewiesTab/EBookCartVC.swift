//
//  EBookCartVC.swift
//  EBookApp
//
//  Created by apple on 17/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Segmentio


class EBookCartVC: UIViewController,UITableViewDataSource,UITableViewDelegate,AddbuttonDelegete {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var currentStyle = SegmentioStyle.onlyImage

    
    var bookTitlesArray = ["The Death","The Road","The Book","The Cloud","The Crown"]
    var bookSubTitlesArray = ["Death","Road","Book","Cloud","Crown"]
    var bookAmountArray = ["150","250","350","450","650"]


    
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),UIImage(named:"book_img10"),UIImage(named:"book_img02"),]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        
    }
    func PlusButton1(_ cell: EBookCartCell) {

        if (cell.strProductQuantity1 != 0 ) {


            
            
            
            
                        cell.strProductQuantity1 += 1

                         cell.incrmentlbl.text = "\(cell.strProductQuantity1)"

                        

            
            

                        }

        else{
        }



    }


    func MiniusButton1(_ cell: EBookCartCell) {


        
        
        
        
        if (cell.strProductQuantity1 != 0 ) {

                            
                                          if (cell.strProductQuantity1 < 0){
                                                
                                            cell.strProductQuantity1 = 0
                                            cell.incrmentlbl.text = "\(cell.strProductQuantity1)"
                                               

                                               }
                                          else if (cell.strProductQuantity1 > 0){
                                            //configureTopView()


                                            
                                            cell.strProductQuantity1 -= 1

                                              cell.incrmentlbl.text = "\(cell.strProductQuantity1)"
                                           
                                            



                                            
                                            

                                            
                                            

                                           }
                                          else{
                                            
                                           // cell.strProductQuantity1 += 1

                                            cell.incrmentlbl.text = "\(cell.strProductQuantity1)"
                                            
                         }

            
            

                      }








     }

    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EBookCartCell", for: indexPath) as!EBookCartCell
       //print(nameArray.count)
        
        cell.editData = self as  AddbuttonDelegete


        cell.bookTilitslbl?.text = bookTitlesArray[indexPath.row]
        cell.bookSubTitleslbl?.text = bookSubTitlesArray[indexPath.row]
        cell.rupeelbl.text = bookAmountArray[indexPath.row]

        
        cell.bookImageView.image = bookImageArray[indexPath.row]
        
//        cell.imgView.sd_setImage(with: URL(string: homeimgArray[indexPath.row]), placeholderImage: UIImage(named: "image"), options: .forceTransition, progress: nil, completed: nil)
        cell .bookImageView?.layer.cornerRadius = 10
        cell.bookImageView?.clipsToBounds = true
        

        return cell

    }

    @IBAction func btnBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
//        self.present(nextViewController, animated:true, completion:nil)
//
        
    }


    @IBAction func btnCheckOut(_ sender: Any) {
        //EBookPlaceOrderVc
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookPlaceOrderVc") as! EBookPlaceOrderVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    
}
