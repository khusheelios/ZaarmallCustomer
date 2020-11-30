//
//  BookStoreOrderVc.swift
//  EBookApp
//
//  Created by apple on 06/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
struct MenuInfo {
    var menuTitle: String
    var isSelected: Bool
    
    init(withTitle title: String, isSelected selected: Bool) {
        self.menuTitle = title
        self.isSelected = selected
    }
}


class BookStoreOrderVc: UIViewController {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var menuList = ["New Order","Processing Order","Complete Order"]
    var segueIdentifiers = ["First","Second","Third"]
    var menuDataSource: [MenuInfo] = []
    var masterVc: BookStoreOrderMasterVc?
    var currentIndex: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

                self.setupDataSrource()
                self.initialSetup()
            }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        if let layout = menuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 6
                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 5)
                let size = CGSize(width:(menuCollectionView!.bounds.width-30)/2, height: 300)
                layout.itemSize = size
        }

        
        
        

    }



            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                self.navigationController?.isNavigationBarHidden = true
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "container" {
                    self.masterVc = segue.destination as? BookStoreOrderMasterVc
                }
            }
            
            @IBAction func handleRightSwipe(_ sender: UISwipeGestureRecognizer) {
                if currentIndex > 0 {
                    self.currentIndex = self.currentIndex - 1
                    let indexPath = IndexPath(row: currentIndex, section: 0)
                    self.menuCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                    
                    self.updateMenuObjects()
                    self.masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[self.currentIndex])
                }
            }
            
            @IBAction func handleLeftSwipe(_ sender: Any) {
                if currentIndex < self.segueIdentifiers.count - 1 {
                    self.currentIndex = self.currentIndex + 1
                    let indexPath = IndexPath(row: currentIndex, section: 0)
                    
                    self.menuCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                    self.updateMenuObjects()
                    self.masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[self.currentIndex])
                }
            }
            @IBAction func bntback(_ sender: Any) {
                self.dismiss(animated: true, completion: nil)


            }

            
            
        }

        //MARK:- Helper Methods:
        extension BookStoreOrderVc {
            
            //Creates a data source array for Horizontal Menu with tapped state.
            func setupDataSrource() {
                for (index, menuItem) in self.menuList.enumerated() {
                    if index == 0 {
                        let menuObject = MenuInfo(withTitle: menuItem, isSelected: true)
                        self.menuDataSource.append(menuObject)
                    } else {
                        let menuObject = MenuInfo(withTitle: menuItem, isSelected: false)
                        self.menuDataSource.append(menuObject)
                    }
                }
            }
            
            //Controls Initial Navigation upon App Launch.
            func initialSetup() {
                masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[0])
            }
            
            //Updates Menu List Objects upon - Tap on Menu or Scroll using swipe Gestures
            func updateMenuObjects() {
                let indexPath = IndexPath(row: currentIndex, section: 0)
                for (index, _) in self.menuDataSource.enumerated() {
                    if index == indexPath.row {
                        self.menuDataSource[index].isSelected = true
                    } else {
                        self.menuDataSource[index].isSelected = false
                    }
                }
                self.menuCollectionView.reloadData()
            }
        }

        //MARK:- Collection View Data Source Methods:
        extension BookStoreOrderVc: UICollectionViewDataSource {
            
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return self.menuDataSource.count
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookStoreOrderCVC", for: indexPath) as? BookStoreOrderCVC
                let menuObject = self.menuDataSource[indexPath.row]
                cell?.orderlbl.text = menuObject.menuTitle
                    cell?.layer.cornerRadius = 15


                cell?.clipsToBounds = true
                cell?.layer.borderWidth = 2
                //UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                cell?.layer.borderColor = red.cgColor
                if indexPath.row == 0{
                    
                    cell?.layer.cornerRadius = 15
                    cell?.clipsToBounds = true
                    cell?.layer.borderWidth = 2
                    var red1 = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                    cell?.layer.borderColor = red1.cgColor



                    cell?.backgroundColor = UIColor(red: 255/255.0, green:  204/255.0, blue: 0/255.0, alpha: 1.0)

                    
                    cell?.orderlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                     cell?.orderlbl.textColor =  UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)



                }

                if menuObject.isSelected {

                    cell?.orderlbl.textColor = UIColor.black
                    cell?.orderlbl.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                    cell?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                    
                    cell?.orderlbl.textColor =  UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
                   cell?.layer.cornerRadius = 15
                   cell?.clipsToBounds = true
                   cell?.layer.borderWidth = 2
                    var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)

                    cell?.layer.borderColor = red.cgColor


                    

                } else {
                    cell?.orderlbl.textColor = UIColor.black
                    cell?.orderlbl.backgroundColor = UIColor.clear
                        cell?.layer.cornerRadius = 15
                    cell?.orderlbl.textColor =  UIColor(red: 17/255.0, green: 17/255.0, blue: 17/255.0, alpha: 1.0)



                    cell?.clipsToBounds = true
                    cell?.layer.borderWidth = 2
                    var red = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
                    cell?.layer.borderColor = red.cgColor
                    var clear = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)

                    cell?.layer.backgroundColor = clear.cgColor

                }
                return cell!
            }
        }

        //MARK:- Collection View Delegate Source Methods:
        extension BookStoreOrderVc: UICollectionViewDelegate {
            
            func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                self.currentIndex = indexPath.row
                collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                for (index, _) in self.menuDataSource.enumerated() {
                    if index == indexPath.row {
                        self.menuDataSource[index].isSelected = true
                    } else {
                        self.menuDataSource[index].isSelected = false
                    }
                }
                collectionView.reloadData()
                masterVc?.segueIdentifierReceivedFromParent(identifier: self.segueIdentifiers[indexPath.row])
            }
        }

extension BookStoreOrderVc: UICollectionViewDelegateFlowLayout {
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
           return CGSize(width: 125, height: 30)

    }


    
}
