//
//  RootViewController.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController, LAXTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = LAXTabBar.init(delegate: self)
        self.setValue(tabBar, forKey: "tabBar")
        
        self.tabBar.barTintColor = TabBarColor
        self.tabBar.tintColor = OrangeColor
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = WhiteColor
        } else {
            // Fallback on earlier versions
        }
        
        let vc1 = MainViewController()
        let vc2 = AttentionViewController()
        let vc3 = UIViewController()
        let vc4 = CommuntityViewController()
        let vc5 = MineViewController()
        
        vc1.view.backgroundColor = BlueColor
        vc2.view.backgroundColor = GreenColor
        vc4.view.backgroundColor = OrangeColor
        vc5.view.backgroundColor = GrayColor
        
        let nvc1 = UINavigationController.init(rootViewController: vc1)
        let nvc2 = UINavigationController.init(rootViewController: vc2)
        let nvc3 = UINavigationController.init(rootViewController: vc3)
        let nvc4 = UINavigationController.init(rootViewController: vc4)
        let nvc5 = UINavigationController.init(rootViewController: vc5)
        
        nvc1.tabBarItem.title = "首页"
        nvc2.tabBarItem.title = "关注"
        nvc4.tabBarItem.title = "社区"
        nvc5.tabBarItem.title = "我的"
        
        nvc1.tabBarItem.image = UIImage.init(named: "btn_home_normal")
        nvc1.tabBarItem.selectedImage = UIImage.init(named: "btn_home_selected")
        nvc2.tabBarItem.image = UIImage.init(named: "btn_attention_normal")
        nvc2.tabBarItem.selectedImage = UIImage.init(named: "btn_attention_selected")
        nvc4.tabBarItem.image = UIImage.init(named: "btn_search_normal")
        nvc4.tabBarItem.selectedImage = UIImage.init(named: "btn_search_selected")
        nvc5.tabBarItem.image = UIImage.init(named: "btn_user_normal")
        nvc5.tabBarItem.selectedImage = UIImage.init(named: "btn_user_selected")
        
        nvc3.tabBarItem.isEnabled = false
        self.viewControllers = [nvc1, nvc2, nvc3, nvc4, nvc5]
        self.selectedIndex = 0
        
    }

    func tabBarDidClickPlusButton(_: LAXTabBar) {
        let vc = LiveViewController()
        self.present(vc, animated: true, completion: nil)
    }

}
