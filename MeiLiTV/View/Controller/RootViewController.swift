//
//  RootViewController.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController, UITabBarControllerDelegate, LAXTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        let tabBar = LAXTabBar.init(delegate: self)
        self.setValue(tabBar, forKey: "tabBar")
        
        self.tabBar.barTintColor = TabBarColor
        self.tabBar.tintColor = OrangeColor
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = WhiteColor
        } else {
            // Fallback on earlier versions
        }
        
        self.addViewController()
        
    }
    
    func addViewController() {
        let vc1 = MainViewController()
        let vc2 = AttentionViewController()
        let vc3 = UIViewController()
        let vc4 = CommuntityViewController()
        let vc5 = MineViewController()
        
        vc1.title = TabBar_Title_1
        vc2.title = TabBar_Title_2
        vc4.title = TabBar_Title_4
        vc5.title = TabBar_Title_5
        
        vc1.view.backgroundColor = BlueColor
        vc2.view.backgroundColor = GreenColor
        vc4.view.backgroundColor = OrangeColor
        vc5.view.backgroundColor = GrayColor
        
        let nvc1 = UINavigationController.init(rootViewController: vc1)
        let nvc2 = UINavigationController.init(rootViewController: vc2)
        let nvc3 = UINavigationController.init(rootViewController: vc3)
        let nvc4 = UINavigationController.init(rootViewController: vc4)
        let nvc5 = UINavigationController.init(rootViewController: vc5)
        
        nvc1.tabBarItem.title = TabBar_Title_1
        nvc2.tabBarItem.title = TabBar_Title_2
        nvc4.tabBarItem.title = TabBar_Title_4
        nvc5.tabBarItem.title = TabBar_Title_5
        
        nvc1.tabBarItem.image = UIImage.init(named: TabBar_Image_1)
        nvc2.tabBarItem.image = UIImage.init(named: TabBar_Image_2)
        nvc4.tabBarItem.image = UIImage.init(named: TabBar_Image_4)
        nvc5.tabBarItem.image = UIImage.init(named: TabBar_Image_5)
        
        nvc1.tabBarItem.selectedImage = UIImage.init(named: TabBar_Image_Selected_1)
        nvc2.tabBarItem.selectedImage = UIImage.init(named: TabBar_Image_Selected_2)
        nvc4.tabBarItem.selectedImage = UIImage.init(named: TabBar_Image_Selected_4)
        nvc5.tabBarItem.selectedImage = UIImage.init(named: TabBar_Image_Selected_5)
        
        nvc3.tabBarItem.isEnabled = false
        self.viewControllers = [nvc1, nvc2, nvc3, nvc4, nvc5]
        self.selectedIndex = 0
    }
    
    //delegate
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LAXAnimationManager()
    }
    
    func tabBarDidClickPlusButton(_: LAXTabBar) {
        let vc = LiveViewController()
        self.present(vc, animated: true, completion: nil)
    }

}
