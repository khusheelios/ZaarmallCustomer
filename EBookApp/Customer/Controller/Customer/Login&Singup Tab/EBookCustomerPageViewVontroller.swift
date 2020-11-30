//
//  EBookCustomerPageViewVontroller.swift
//  EBookApp
//
//  Created by apple on 12/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookCustomerPageViewVontroller: UIViewController,EBookCustomerPageVcDelegate {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: CustomizableButton!
    @IBOutlet weak var pageControl: UIPageControl!
        @IBOutlet weak var containerView: UIView!
    var pageCount = Int()
    var pageCount1 = Int()
    var pageCoun2 = Int()
    var pageCount3 = Int()



        
        var tutorialPageViewController: EBookCustomerPageVc? {
            didSet {
                tutorialPageViewController?.tutorialDelegate = self
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            pageControl.addTarget(self, action: Selector("didChangePageControlValue"), for: .valueChanged)
            
 
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let tutorialPageViewController = segue.destination as? EBookCustomerPageVc {
                self.tutorialPageViewController = tutorialPageViewController
            }
        }

        @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
            self.present(nextViewController, animated:true, completion:nil)

        }
    @IBAction func btnBack(_ sender: Any) {

        if(pageCount == 0){
            btnBack.isHidden = true
            tutorialPageViewController?.scrollToViewController(index: 0)


        }
       else if(pageCount == 1){
            print(pageCount)
            btnBack.isHidden = false

            tutorialPageViewController?.scrollToViewController(index: 0)


        }
     else  if(pageCount == 2){
            btnBack.isHidden = false

            tutorialPageViewController?.scrollToViewController(index:1)


        }
      else  if(pageCount == 3){
            btnBack.isHidden = false
            btnNext.setTitle("NEXT", for: .normal)


            tutorialPageViewController?.scrollToViewController(index:2)


        }



    }
    @IBAction func didTapNextButton(_ sender: Any) {

                 if(btnNext.titleLabel?.text == "DONE"){
                                 let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
                                 self.present(nextViewController, animated:true, completion:nil)


                 }
                 else{
                     tutorialPageViewController?.scrollToNextViewController()
                     btnBack.isHidden = false

                 }



            
        }
    

        func didChangePageControlValue() {
            tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
            

            
        }
    
    func tutorialPageViewController(tutorialPageViewController: EBookCustomerPageVc,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: EBookCustomerPageVc,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
         switch index {
         case 0...1:
            pageCount = 0
          
         case 1:
            pageCount = 1


         case 2:
            pageCount = 2


         case 3:
            pageCount = 3


            btnNext.setTitle("DONE", for: .normal)
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookLoginNumberVc") as! EBookLoginNumberVc
//        self.present(nextViewController, animated:true, completion:nil)
            
       default: break
        }

    }

    }


