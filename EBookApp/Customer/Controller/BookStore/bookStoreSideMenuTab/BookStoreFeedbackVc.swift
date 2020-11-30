//
//  BookStoreFeedbackVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreFeedbackVc: UIViewController {

        @IBOutlet weak var starRateView: StarRateView!


        override func viewDidLoad() {
            super.viewDidLoad()

            setupRatingView()
        }
        

        func setupRatingView() {
            starRateView.delegate = self
            starRateView.ratingValue = -1
        }
        
        @IBAction func btnBack(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
            self.present(nextViewController, animated:true, completion:nil)

            
        }

        @IBAction func btnSubmit(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreTabBarVc") as! BookStoreTabBarVc
            self.present(nextViewController, animated:true, completion:nil)


        }
        
    }
    extension BookStoreFeedbackVc: RatingViewDelegate {
        func updateRatingFormatValue(_ value: Int) {
            print("Rating : = ", value)
        }
    }
