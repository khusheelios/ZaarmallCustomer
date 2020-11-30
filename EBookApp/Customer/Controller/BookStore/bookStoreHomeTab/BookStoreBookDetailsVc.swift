//
//  BookStoreBookDetailsVc.swift
//  EBookApp
//
//  Created by apple on 08/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreBookDetailsVc: UIViewController {
    @IBOutlet weak var starRateView: StarRateView!

    @IBOutlet weak var editpopupView: CustomizableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRatingView()
              view.addSubview(editpopupView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreBookDetailsVc.handleTap(_:)))
                editpopupView.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                editpopupView.isHidden = true
            }

    @IBAction func btnDelete(_ sender: Any) {
        editpopupView.isHidden = true
    }
    @IBAction func btnEdit(_ sender: Any) {
        editpopupView.isHidden = true
    }
    @IBAction func btnShare(_ sender: Any) {
        editpopupView.isHidden = true
    }
    @IBAction func btnTrippledot(_ sender: Any) {
        if(editpopupView.isHidden == true){
            editpopupView.isHidden = false
        }
        else{
            editpopupView.isHidden = true

        }
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
        func setupRatingView() {
            starRateView.delegate = self
            starRateView.ratingValue = -1
        }
}
extension BookStoreBookDetailsVc: RatingViewDelegate {
    func updateRatingFormatValue(_ value: Int) {
        print("Rating : = ", value)
    }
}
