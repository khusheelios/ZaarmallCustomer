//
//  BookStoreProcessingOrderVc.swift
//  EBookApp
//
//  Created by apple on 10/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

class BookStoreProcessingOrderVc: UIViewController,UITableViewDelegate,UITableViewDataSource,FlexibleSteppedProgressBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var titlesArray = ["The Death","The Book"]
    var subtitlesArray = ["Death","Book"]

    
    var orderIdArray = ["#1234","#1231"]
    var ImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),]
    
    
     var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    // var progressBarWithDifferentDimensions: FlexibleSteppedProgressBar!
     
     var backgroundColor = UIColor.black
         //UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
     var progressColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

     var textColorHere = UIColor.darkGray
         //UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)

     var maxIndex = -1
    
    var strZero = String()
    var strOne = String()
    var strTwo = String()
    var strThree = String()
    var progressIndex = Int()
    var strprogressIndex = Int()
    var strPrice = "0"
    var strCusinesName = String()
    var strCusinesName1 = String()
    var strTag = Int()




    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
            
            func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                             didSelectItemAtIndex index: Int) {
                progressBar.currentIndex = index
                if index > maxIndex {
                    maxIndex = index
                    progressBar.completedTillIndex = maxIndex
                    
                    strprogressIndex = maxIndex
                    
                    progressIndex = progressBar.completedTillIndex
                    
                    if (progressIndex == 1){
                        
                    }else if (progressIndex == 2){

                        
                    }
                    
                    else if (progressIndex == 3){

                        
                    }
                    else{


                    }
                    
                    
                    
                }
            }
            
            func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                             canSelectItemAtIndex index: Int) -> Bool {
                return true
            }
            
            func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                             textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
                if progressBar == self.progressBarWithoutLastState || progressBar == self.progressBarWithoutLastState {
                    if position == FlexibleSteppedProgressBarTextLocation.top {
                        switch index {
                            
                         
                        default: break
                            
                        }
                    } else if position == FlexibleSteppedProgressBarTextLocation.bottom {
                        
                        switch index {
                            
                        case 0: return ""
                        case 1: return ""
                            

                        case 2: return ""
                        case 3: return ""
                        //case 4: return "Fifth"
                        default: return "Date"
                            
                        }
                        
                    } else if position == FlexibleSteppedProgressBarTextLocation.center {
                        switch index {
                            
                        default: break
                            
                        }
                    }
               }
                return ""
            }

    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreProcessingOrderCell", for: indexPath) as!BookStoreProcessingOrderCell
        cell.titileslbl?.text = titlesArray[indexPath.row]
        cell.sabtitleslbl.text = subtitlesArray[indexPath.row]
        cell.orderiflbl.text = orderIdArray[indexPath.row]
        
        //cell.Compeletelbl?.text = CompelteArray[indexPath.row]

        cell.ProcessingOrderImage.image = ImageArray[indexPath.row]
        
        
                 progressBarWithoutLastState = FlexibleSteppedProgressBar()
                 progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false

                 progressBarWithoutLastState.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)

                 cell.compelteProgressPopup.addSubview(progressBarWithoutLastState)
                 
        let horizontalConstraint = progressBarWithoutLastState.centerXAnchor.constraint(equalTo: cell.compelteProgressPopup.centerXAnchor,constant: -160)
                 let verticalConstraint = progressBarWithoutLastState.topAnchor.constraint(
                     equalTo: cell.compelteProgressPopup.topAnchor,
                     constant: 10
                 )
                 let widthConstraint = progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: 200)
                 let heightConstraint = progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 180)
                 NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

                 // Customise the progress bar here
                 progressBarWithoutLastState.numberOfPoints = 4
                 progressBarWithoutLastState.lineHeight = 3
                 progressBarWithoutLastState.radius = 10
                 progressBarWithoutLastState.progressRadius = 10
                 progressBarWithoutLastState.progressLineHeight = 3
                 progressBarWithoutLastState.delegate = self
                 progressBarWithoutLastState.selectedBackgoundColor = progressColor
                 //progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor
                 progressBarWithoutLastState.currentSelectedCenterColor = progressColor
                 progressBarWithoutLastState.stepTextColor = textColorHere
                 progressBarWithoutLastState.currentSelectedTextColor = progressColor

                 progressBarWithoutLastState.currentIndex = 0




        
        
        
        

         return cell

    }


}
