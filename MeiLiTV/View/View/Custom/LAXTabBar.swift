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

    init() {
        super.init(frame: CGRect.init(x: 0, y: ScreenHeight - 49, width: ScreenWidth, height: 49))
        plusButton.center = CGPoint.init(x: ScreenWidth / 2, y: 49 - plusButton.bounds.size.height / 2)
        self.addSubview(plusButton)
    }
    
    convenience init(delegate: LAXTabBarDelegate) {
        self.init()
        self.tabbarDelegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var plusButton: UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 55, height: 55))
        btn.setImage(UIImage.init(named: PlusButtonImage), for: .normal)
        btn.addTarget(self, action: #selector(plusButtonAction(sender:)), for: .touchUpInside)
        
        return btn
    }()
    
    var tabbarDelegate: LAXTabBarDelegate?
    
    func plusButtonAction(sender: UIButton) {
        self.tabbarDelegate?.tabBarDidClickPlusButton(self)
    }

}
