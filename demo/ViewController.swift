//
//  ViewController.swift
//  demo
//
//  Created by Mominur Rahman on 9/13/18.
//  Copyright © 2018 BYSL Global. All rights reserved.
//

import UIKit
import CarbonKit

class ViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let items = ["All",  "WOMEN",  "MEN",  "KIDS",  "HOME",  "CITY"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
        //Change the toolbar background color, font color, tint color
        
        carbonTabSwipeNavigation.toolbar.isTranslucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = UIColor.black
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.orange)
        carbonTabSwipeNavigation.setIndicatorHeight(2)
        carbonTabSwipeNavigation.setTabExtraWidth(16)

        carbonTabSwipeNavigation.toolbar.clipsToBounds = true
        carbonTabSwipeNavigation.setSelectedColor(UIColor.white, font: UIFont.systemFont(ofSize: 12))
        carbonTabSwipeNavigation.setNormalColor(UIColor.lightGray, font: UIFont.systemFont(ofSize: 12))
        carbonTabSwipeNavigation.carbonTabSwipeScrollView.bounces = false
        
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        //           let screen = self.storyboard?.instantiateViewController(withIdentifier: "demo") as! demo
        //           showSubViewContrller(subViewController: vc)
        //           return screen
        
        let storyBoard = getStoryBoardByIndentifier(identifier: "All")
        let vc = storyBoard.instantiateViewController(withIdentifier: "AllViewController") as! AllViewController
        showSubViewContrller(subViewController: vc)
        return vc
    }
    
    
    //Subview Controller
    func showSubViewContrller(subViewController:UIViewController) {
        self.addChildViewController(subViewController)
        subViewController.view.frame = containerView.frame
        self.containerView.addSubview(subViewController.view)
        subViewController.didMove(toParentViewController: self)
        //previousVc = subViewController
    }

    func getStoryBoardByIndentifier(identifier:String)->UIStoryboard {
        return  UIStoryboard.init(name: identifier, bundle: nil)
    }
  
}

