//
//  BookStoreAdvertiesPlanVc.swift
//  EBookApp
//
//  Created by apple on 23/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreAdvertiesPlanVc: UIViewController {

        @IBOutlet weak var btnWeekly: CustomizableButton!
        @IBOutlet weak var btnMonthly: CustomizableButton!
        
        @IBOutlet weak var slideshow: ImageSlideshow!
        
        @IBOutlet weak var slideshow1: ImageSlideshow!
        @IBOutlet weak var headerView: UIView!
        var localSource  = [ImageSource(imageString: "640x960-1")!, ImageSource(imageString: "640x960-1")!]
        
        var sliderLabel: UILabel?

        @IBOutlet weak var mainView: UIView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
                   slideshow.slideshowInterval = 5.0
                   slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
                slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
                   
                   let pageControl = UIPageControl()
                   pageControl.currentPageIndicatorTintColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                   pageControl.pageIndicatorTintColor = UIColor.lightGray
            slideshow.pageIndicator = pageControl
                   
                   // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
                   slideshow.activityIndicator = DefaultActivityIndicator()
                   slideshow.currentPageChanged = { page in
                     //  print("current page:", page)
                   }
            
            
            
                   let label = UILabel(frame: CGRect(x: -30, y: 20, width: 200, height: 30))
                    //UILabel(frame: slideshow.bounds)
                   label.backgroundColor = .clear
                   label.textAlignment = .center
                   label.textColor = .white
                   label.numberOfLines = 0

                   label.text = "Basic"
            label.font = UIFont.boldSystemFont(ofSize: 25)


                   slideshow.addSubview(label)
            
                       let btnCart = UIButton(type: .custom)
                       btnCart.frame = CGRect(x: 30, y: 55, width: 25, height: 25)
                       btnCart.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                       btnCart.clipsToBounds = true
                       btnCart.backgroundColor = UIColor.clear
                       btnCart.setImage(UIImage(named:"money-bag"), for: .normal)

                       slideshow.addSubview(btnCart)

    //
            
            let label1 = UILabel(frame: CGRect(x: -10, y: 45, width: 200, height: 60))
             //UILabel(frame: slideshow.bounds)
            label1.backgroundColor = .clear
            label1.textAlignment = .center
            label1.textColor = .white
            label1.numberOfLines = 0

            label1.text = "50"
            label1.font = UIFont.boldSystemFont(ofSize: 50)


            slideshow.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 30, y: 55, width: 200, height: 30))
             //UILabel(frame: slideshow.bounds)
            label2.backgroundColor = .clear
            label2.textAlignment = .center
            label2.textColor = .white
            label2.numberOfLines = 0

            label2.text = "/"

            slideshow.addSubview(label2)


            let label3 = UILabel(frame: CGRect(x: 60, y: 55, width: 200, height: 30))
             //UILabel(frame: slideshow.bounds)
            label3.backgroundColor = .clear
            label3.textAlignment = .center
            label3.textColor = .white
            label3.numberOfLines = 0

            label3.text = "Month"

            slideshow.addSubview(label3)
            
            
                               let btnCart1 = UIButton(type: .custom)
                               btnCart1.frame = CGRect(x: 60, y: 240, width: 25, height: 25)
                               btnCart1.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                               btnCart1.clipsToBounds = true
                               btnCart1.backgroundColor = UIColor.clear
                               btnCart1.setImage(UIImage(named:"correct-1"), for: .normal)

                               slideshow.addSubview(btnCart1)

            //
                    
                    let label11 = UILabel(frame: CGRect(x: 75, y: 220, width: 200, height: 60))
                     //UILabel(frame: slideshow.bounds)
                    label11.backgroundColor = .clear
                    label11.textAlignment = .center
                    label11.textColor = .black
                    label11.numberOfLines = 0

                    label11.text = "Lorem Ipsum simply"
                    //label11.font = UIFont.boldSystemFont(ofSize: 50)


                    slideshow.addSubview(label11)


            
                               let btnCart2 = UIButton(type: .custom)
                               btnCart2.frame = CGRect(x: 60, y: 270, width: 25, height: 25)
                               btnCart2.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                               btnCart2.clipsToBounds = true
                               btnCart2.backgroundColor = UIColor.clear
                               btnCart2.setImage(UIImage(named:"correct-1"), for: .normal)

                               slideshow.addSubview(btnCart2)

            //
                    
                    let label12 = UILabel(frame: CGRect(x: 75, y: 250, width: 200, height: 60))
                     //UILabel(frame: slideshow.bounds)
                    label12.backgroundColor = .clear
                    label12.textAlignment = .center
                    label12.textColor = .lightGray
                    label12.numberOfLines = 0

                    label12.text = "Lorem Ipsum simply"
                    //label11.font = UIFont.boldSystemFont(ofSize: 50)


                    slideshow.addSubview(label12)

            
            
            
                               let btnCart3 = UIButton(type: .custom)
                               btnCart3.frame = CGRect(x: 60, y: 300, width: 25, height: 25)
                               btnCart3.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                               btnCart3.clipsToBounds = true
                               btnCart3.backgroundColor = UIColor.clear
                               btnCart3.setImage(UIImage(named:"correct-1"), for: .normal)

                               slideshow.addSubview(btnCart3)

            //
                    
                    let label13 = UILabel(frame: CGRect(x: 75, y: 280, width: 200, height: 60))
                     //UILabel(frame: slideshow.bounds)
                    label13.backgroundColor = .clear
                    label13.textAlignment = .center
                    label13.textColor = .lightGray
                    label13.numberOfLines = 0

                    label13.text = "Lorem Ipsum simply"
                    //label11.font = UIFont.boldSystemFont(ofSize: 50)


                    slideshow.addSubview(label13)


            
                               let btnCart4 = UIButton(type: .custom)
                               btnCart4.frame = CGRect(x: 60, y: 330, width: 25, height: 25)
                               btnCart4.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                               btnCart4.clipsToBounds = true
                               btnCart4.backgroundColor = UIColor.clear
                               btnCart4.setImage(UIImage(named:"correct-1"), for: .normal)

                               slideshow.addSubview(btnCart4)

            //
                    
                    let label14 = UILabel(frame: CGRect(x: 75, y: 310, width: 200, height: 60))
                     //UILabel(frame: slideshow.bounds)
                    label14.backgroundColor = .clear
                    label14.textAlignment = .center
                    label14.textColor = .lightGray
                    label14.numberOfLines = 0

                    label14.text = "Lorem Ipsum simply"
                    //label11.font = UIFont.boldSystemFont(ofSize: 50)


                    slideshow.addSubview(label14)


                                      let btnCart5 = UIButton(type: .custom)
                                      btnCart5.frame = CGRect(x: 60, y: 360, width: 25, height: 25)
                                      btnCart5.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
                                      btnCart5.clipsToBounds = true
                                      btnCart5.backgroundColor = UIColor.clear
                                      btnCart5.setImage(UIImage(named:"correct-1"), for: .normal)

                                      slideshow.addSubview(btnCart5)

                   //
                           
                           let label15 = UILabel(frame: CGRect(x: 75, y: 340, width: 200, height: 60))
                            //UILabel(frame: slideshow.bounds)
                           label15.backgroundColor = .clear
                           label15.textAlignment = .center
                           label15.textColor = .lightGray
                           label15.numberOfLines = 0

                           label15.text = "Lorem Ipsum simply"
                           //label11.font = UIFont.boldSystemFont(ofSize: 50)


                           slideshow.addSubview(label15)
            
            
            
            let btnCart6 = UIButton(type: .custom)
            btnCart6.frame = CGRect(x: 100, y: 430, width: 170, height: 40)
            btnCart6.layer.cornerRadius = 0.5 * btnCart.bounds.size.width
            btnCart6.clipsToBounds = true
            btnCart6.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
            btnCart6.setTitle("Active Plan", for: .normal)
            btnCart6.layer.cornerRadius = 20
            btnCart6.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)

            slideshow.addSubview(btnCart6)

            

            
            

                   self.sliderLabel = label
                   //set label font, size, color, etc.

                   
                   // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
                slideshow.setImageInputs(localSource)
                   
                   let recognizer = UITapGestureRecognizer(target: self, action: #selector(BookStorePlanVc.didTap))
                   slideshow.addGestureRecognizer(recognizer)
                   
                
                   slideshow1.slideshowInterval = 5.0
                               slideshow1.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
                            slideshow1.contentScaleMode = UIView.ContentMode.scaleAspectFill
                               
                               let pageControl1 = UIPageControl()
                               pageControl1.currentPageIndicatorTintColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                               pageControl1.pageIndicatorTintColor = UIColor.lightGray
                               slideshow1.pageIndicator = pageControl1
                               
                               // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
                               slideshow1.activityIndicator = DefaultActivityIndicator()
                               slideshow1.currentPageChanged = { page in
                                 //  print("current page:", page)
                               }
                        
                        
                        
                               let label01 = UILabel(frame: CGRect(x: -10, y: 20, width: 200, height: 30))
                                //UILabel(frame: slideshow.bounds)
                               label01.backgroundColor = .clear
                               label01.textAlignment = .center
                               label01.textColor = .white
                               label01.numberOfLines = 0

                               label01.text = "Primium"
                        label01.font = UIFont.boldSystemFont(ofSize: 25)


                               slideshow1.addSubview(label01)
                        
                                   let btnCart01 = UIButton(type: .custom)
                                   btnCart01.frame = CGRect(x: 30, y: 55, width: 25, height: 25)
                                   btnCart01.layer.cornerRadius = 0.5 * btnCart01.bounds.size.width
                                   btnCart01.clipsToBounds = true
                                   btnCart01.backgroundColor = UIColor.clear
                                   btnCart01.setImage(UIImage(named:"money-bag"), for: .normal)

                                   slideshow1.addSubview(btnCart01)

                //
                        
                        let label25 = UILabel(frame: CGRect(x: 5, y: 45, width: 200, height: 60))
                         //UILabel(frame: slideshow.bounds)
                        label25.backgroundColor = .clear
                        label25.textAlignment = .center
                        label25.textColor = .white
                        label25.numberOfLines = 0

                        label25.text = "150"
                        label25.font = UIFont.boldSystemFont(ofSize: 50)


                        slideshow1.addSubview(label25)
                        
                        let label21 = UILabel(frame: CGRect(x: 60, y: 55, width: 200, height: 30))
                         //UILabel(frame: slideshow.bounds)
                        label21.backgroundColor = .clear
                        label21.textAlignment = .center
                        label21.textColor = .white
                        label21.numberOfLines = 0

                        label21.text = "/"

                        slideshow1.addSubview(label21)


                        let label31 = UILabel(frame: CGRect(x: 90, y: 55, width: 200, height: 30))
                         //UILabel(frame: slideshow.bounds)
                        label31.backgroundColor = .clear
                        label31.textAlignment = .center
                        label31.textColor = .white
                        label31.numberOfLines = 0

                        label31.text = "Month"

                        slideshow1.addSubview(label31)
                        
                        
                                           let btnCart13 = UIButton(type: .custom)
                                           btnCart13.frame = CGRect(x: 60, y: 240, width: 25, height: 25)
                                           btnCart13.layer.cornerRadius = 0.5 * btnCart13.bounds.size.width
                                           btnCart13.clipsToBounds = true
                                           btnCart13.backgroundColor = UIColor.clear
                                           btnCart13.setImage(UIImage(named:"correct-1"), for: .normal)

                                           slideshow1.addSubview(btnCart13)

                        //
                                
                                let label41 = UILabel(frame: CGRect(x: 75, y: 220, width: 200, height: 60))
                                 //UILabel(frame: slideshow.bounds)
                                label41.backgroundColor = .clear
                                label41.textAlignment = .center
                                label41.textColor = .black
                                label41.numberOfLines = 0

                                label41.text = "Lorem Ipsum simply"
                                //label11.font = UIFont.boldSystemFont(ofSize: 50)


                                slideshow1.addSubview(label41)


                        
                                           let btnCart22 = UIButton(type: .custom)
                                           btnCart22.frame = CGRect(x: 60, y: 270, width: 25, height: 25)
                                           btnCart22.layer.cornerRadius = 0.5 * btnCart22.bounds.size.width
                                           btnCart22.clipsToBounds = true
                                           btnCart22.backgroundColor = UIColor.clear
                                           btnCart22.setImage(UIImage(named:"correct-1"), for: .normal)

                                           slideshow1.addSubview(btnCart22)

                        //
                                
                                let label10 = UILabel(frame: CGRect(x: 75, y: 250, width: 200, height: 60))
                                 //UILabel(frame: slideshow.bounds)
                                label10.backgroundColor = .clear
                                label10.textAlignment = .center
                                label10.textColor = .lightGray
                                label10.numberOfLines = 0

                                label10.text = "Lorem Ipsum simply"
                                //label11.font = UIFont.boldSystemFont(ofSize: 50)


                                slideshow1.addSubview(label10)

                        
                        
                        
                                           let btnCart111 = UIButton(type: .custom)
                                           btnCart111.frame = CGRect(x: 60, y: 300, width: 25, height: 25)
                                           btnCart111.layer.cornerRadius = 0.5 * btnCart111.bounds.size.width
                                           btnCart111.clipsToBounds = true
                                           btnCart111.backgroundColor = UIColor.clear
                                           btnCart111.setImage(UIImage(named:"correct-1"), for: .normal)

                                           slideshow1.addSubview(btnCart111)

                        //
                                
                                let label131 = UILabel(frame: CGRect(x: 75, y: 280, width: 200, height: 60))
                                 //UILabel(frame: slideshow.bounds)
                                label131.backgroundColor = .clear
                                label131.textAlignment = .center
                                label131.textColor = .lightGray
                                label131.numberOfLines = 0

                                label131.text = "Lorem Ipsum simply"
                                //label11.font = UIFont.boldSystemFont(ofSize: 50)


                                slideshow1.addSubview(label131)


                        
                                           let btnCart44 = UIButton(type: .custom)
                                           btnCart44.frame = CGRect(x: 60, y: 330, width: 25, height: 25)
                                           btnCart44.layer.cornerRadius = 0.5 * btnCart44.bounds.size.width
                                           btnCart44.clipsToBounds = true
                                           btnCart44.backgroundColor = UIColor.clear
                                           btnCart44.setImage(UIImage(named:"correct-1"), for: .normal)

                                           slideshow1.addSubview(btnCart44)

                        //
                                
                                let label141 = UILabel(frame: CGRect(x: 75, y: 310, width: 200, height: 60))
                                 //UILabel(frame: slideshow.bounds)
                                label141.backgroundColor = .clear
                                label141.textAlignment = .center
                                label141.textColor = .lightGray
                                label141.numberOfLines = 0

                                label141.text = "Lorem Ipsum simply"
                                //label11.font = UIFont.boldSystemFont(ofSize: 50)


                                slideshow1.addSubview(label141)


                                                  let btnCart57 = UIButton(type: .custom)
                                                  btnCart57.frame = CGRect(x: 60, y: 360, width: 25, height: 25)
                                                  btnCart57.layer.cornerRadius = 0.5 * btnCart57.bounds.size.width
                                                  btnCart57.clipsToBounds = true
                                                  btnCart57.backgroundColor = UIColor.clear
                                                  btnCart57.setImage(UIImage(named:"correct-1"), for: .normal)

                                                  slideshow1.addSubview(btnCart57)

                               //
                                       
                                       let label153 = UILabel(frame: CGRect(x: 75, y: 340, width: 200, height: 60))
                                        //UILabel(frame: slideshow.bounds)
                                       label153.backgroundColor = .clear
                                       label153.textAlignment = .center
                                       label153.textColor = .lightGray
                                       label153.numberOfLines = 0

                                       label153.text = "Lorem Ipsum simply"
                                       //label11.font = UIFont.boldSystemFont(ofSize: 50)


                                       slideshow1.addSubview(label153)
                        
                        
                        
                        let btnCart62 = UIButton(type: .custom)
                        btnCart62.frame = CGRect(x: 100, y: 430, width: 170, height: 40)
                        btnCart62.layer.cornerRadius = 0.5 * btnCart62.bounds.size.width
                        btnCart62.clipsToBounds = true
                        btnCart62.backgroundColor = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)

                        btnCart62.setTitle("Active Plan", for: .normal)
                        btnCart62.layer.cornerRadius = 20
                        btnCart62.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)

                        slideshow1.addSubview(btnCart62)

                        

                        
                        

                              // self.sliderLabel = label
                               //set label font, size, color, etc.

                               
                               // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
                            slideshow1.setImageInputs(localSource)
                               
                               let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(BookStorePlanVc.didTap1))
                               slideshow1.addGestureRecognizer(recognizer2)


            
            

            
            
                
                
            }
        
            @objc func thumbsUpButtonPressed() {
                
                
            }

        
        @objc func didTap1() {
            let fullScreenController = slideshow.presentFullScreenController(from: self)
            // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
            fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        }

            
            @objc func didTap() {
                let fullScreenController = slideshow.presentFullScreenController(from: self)
                // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
                fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
            }


        
            
            @IBAction func btnWeekly(_ sender: Any) {
            
                
                            btnMonthly.backgroundColor = .clear
                            btnWeekly.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                
                            btnWeekly.setTitleColor(UIColor.white, for: .normal)
                            btnMonthly.setTitleColor(UIColor.black, for: .normal)
                
                
                btnWeekly.layer.cornerRadius = 20
                btnWeekly.layer.borderWidth = 1
                var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                btnWeekly.layer.borderColor = red.cgColor



                btnMonthly.layer.cornerRadius = 20
                btnMonthly.layer.borderWidth = 1
                var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                btnMonthly.layer.borderColor = red1.cgColor


                            //stationaryPopUp.isHidden = true

                
                headerView.isHidden = false
                mainView.isHidden = true




            }
            
    @IBAction func btnBack(_ sender: Any) {
        //BookStoreAddProductVc
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreAddProductVc") as! BookStoreAddProductVc
        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnMonthly(_ sender: Any) {
                if(mainView.isHidden == true){
                    mainView.isHidden = false
                    headerView.isHidden = true

                btnMonthly.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                btnWeekly.backgroundColor = .clear
                btnMonthly.setTitleColor(UIColor.white, for: .normal)
                btnWeekly.setTitleColor(UIColor.black, for: .normal)
                    
                    
                    btnWeekly.layer.cornerRadius = 20
                    btnWeekly.layer.borderWidth = 1
                    var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                    btnWeekly.layer.borderColor = red.cgColor



                    btnMonthly.layer.cornerRadius = 20
                    btnMonthly.layer.borderWidth = 1
                    var red1 = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                    btnMonthly.layer.borderColor = red1.cgColor


                    
                }
                else{
                    mainView.isHidden = true

                }
            }
        @IBAction func btnSeconNext(_ sender: Any) {
        }
        
        @IBAction func btnFirstNext(_ sender: Any) {
            if(mainView.isHidden == true){
                mainView.isHidden = false
                headerView.isHidden = true

    //        btnannunnal.backgroundColor = .systemOrange
    //        btnMonth.backgroundColor = .clear
    //        btnannunnal.setTitleColor(UIColor.white, for: .normal)
    //        btnMonth.setTitleColor(UIColor.black, for: .normal)
                
            }
            else{
                mainView.isHidden = true

            }


        }
        
    }
