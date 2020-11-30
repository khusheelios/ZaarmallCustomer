//
//  BookStorePageVc.swift
//  EBookApp
//
//  Created by apple on 12/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStorePageVc: UIViewController {

        @IBOutlet weak var pageControl: UIPageControl!
        @IBOutlet weak var containerView: UIView!
        
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnNext1: CustomizableButton!
    var pageCount = Int()
    var pageCount1 = Int()
    var pageCoun2 = Int()
    var pageCount3 = Int()


    var tutorialPageViewController: BookStorePageViewController? {
            didSet {
                tutorialPageViewController?.tutorialDelegate = self
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            pageControl.addTarget(self, action: Selector("didChangePageControlValue"), for: .valueChanged)
            //left-arrow
            
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let tutorialPageViewController = segue.destination as? BookStorePageViewController {
                self.tutorialPageViewController = tutorialPageViewController
            }
        }

    @IBAction func btnNext(_ sender: Any) {
        
           if(pageCount == 0){
               btnNext.isHidden = true
               tutorialPageViewController?.scrollToViewController(index: 0)


           }
          else if(pageCount == 1){
               print(pageCount)
               btnNext.isHidden = false

               tutorialPageViewController?.scrollToViewController(index: 0)


           }
        else  if(pageCount == 2){
               btnNext.isHidden = false

               tutorialPageViewController?.scrollToViewController(index:1)


           }
         else  if(pageCount == 3){
               btnNext.isHidden = false
            btnNext1.setTitle("NEXT", for: .normal)


               tutorialPageViewController?.scrollToViewController(index:2)


           }

    }
    @IBAction func btnSkip(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoinWithUserNmberVc") as! BookStoreLoinWithUserNmberVc
            self.present(nextViewController, animated:true, completion:nil)

        }
    
    
        @IBAction func didTapNextButton(_ sender: Any) {
            
            


            if(btnNext1.titleLabel?.text == "DONE"){
                            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

                             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoinWithUserNmberVc") as! BookStoreLoinWithUserNmberVc
                             self.present(nextViewController, animated:true, completion:nil)


            }
            else{
                tutorialPageViewController?.scrollToNextViewController()
                 btnNext.isHidden = false

            }

        }
        
        /**
         Fired when the user taps on the pageControl to change its current page.
         */
        func didChangePageControlValue() {
            tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
        }
    }

    extension BookStorePageVc: BookStorePageViewControllerDelegate {
        
        func tutorialPageViewController(tutorialPageViewController: BookStorePageViewController,
            didUpdatePageCount count: Int) {
            pageControl.numberOfPages = count
        }
        
        func tutorialPageViewController(tutorialPageViewController: BookStorePageViewController,
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


                 btnNext1.setTitle("DONE", for: .normal)
//             let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
//
//             let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreLoinWithUserNmberVc") as! BookStoreLoinWithUserNmberVc
//             self.present(nextViewController, animated:true, completion:nil)
                 
            default: break
             }

            
        }
        
    }
