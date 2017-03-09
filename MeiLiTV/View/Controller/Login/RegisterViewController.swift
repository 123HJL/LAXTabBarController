//
//  RegisterViewController.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerAction(_ sender: UIButton) {
        LAXAnimation.bowenAnimation()
        (UIApplication.shared.delegate as! AppDelegate).enterMainViewController()
    }
    
    @IBAction func returnAction(_ sender: UIButton) {
        LAXAnimation.tuijiAnimation(with: LAXDirectionLeft)
        self.dismiss(animated: true, completion: nil)
    }

}
