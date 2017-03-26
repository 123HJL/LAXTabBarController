//
//  LAXTabBar.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

protocol LAXTabBarDelegate : UITabBarDelegate {
    func tabBarDidClickPlusButton(_: LAXTabBar)
}

class LAXTabBar: UITabBar {

    lazy var plusButton: UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 55, height: 55))
        btn.setImage(UIImage.init(named: PlusButtonImage), for: .normal)
        btn.addTarget(self, action: #selector(plusButtonAction(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    var tabbarDelegate: LAXTabBarDelegate?
    
    init() {
        super.init(frame: CGRect.init(x: 0, y: ScreenHeight - 49, width: ScreenWidth, height: 49))
        self.addSubview(plusButton)
        plusButton .setValue(CGPoint.init(x: ScreenWidth / 2, y: 49 - plusButton.bounds.size.height / 2), forKey: "center")
        self .addObserver(self, forKeyPath: "frame", options: .new, context: nil)
    }
    
    convenience init(delegate: LAXTabBarDelegate) {
        self.init()
        self.tabbarDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        removeObserver(self, forKeyPath: "frame")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            if let rect = change?[.newKey] as? CGRect {
                        plusButton .setValue(CGPoint.init(x: rect.size.width / 2, y: 49 - plusButton.bounds.size.height / 2), forKey: "center")
            }
        }
    }
    
    func plusButtonAction(sender: UIButton) {
        self.tabbarDelegate?.tabBarDidClickPlusButton(self)
    }

}
