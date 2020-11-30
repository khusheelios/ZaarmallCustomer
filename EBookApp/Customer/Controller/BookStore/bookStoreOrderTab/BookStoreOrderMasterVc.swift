//
//  BookStoreOrderMasterVc.swift
//  EBookApp
//
//  Created by apple on 09/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookStoreOrderMasterVc: UIViewController {

        private weak var guestViewController: UIViewController!
        private var containerViewObjects = [String: UIViewController]()
        
        fileprivate var currentViewController : UIViewController {
            get {
                return self.guestViewController
            }
        }

        private var segueIdentifier: String!
        
        //View Life Cycle:
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if self.guestViewController != nil {
                self.guestViewController.view.removeFromSuperview()
                self.guestViewController = nil
            }
            
            if (self.containerViewObjects[self.segueIdentifier] == nil) {
                self.guestViewController = segue.destination
                self.containerViewObjects[self.segueIdentifier] = self.guestViewController
            } else {
                for (key, value) in self.containerViewObjects {
                    if key == self.segueIdentifier {
                        self.guestViewController = value
                    }
                }
            }
            
            self.addChild(guestViewController)
            guestViewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(guestViewController.view)
            guestViewController.didMove(toParent: self)
        }
    }

    // MARK:- Helper Methods:
    extension BookStoreOrderMasterVc {
        func segueIdentifierReceivedFromParent(identifier: String) {
            self.segueIdentifier = identifier
            performSegue(withIdentifier: identifier, sender: nil)
        }
    }
