//
//  LoginViewController.swift
//  MeiLiTV
//
//  Created by 冰凉的枷锁 on 2017/3/9.
//  Copyright © 2017年 冰凉的枷锁. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    //MARK: - override func
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - custum func
    

    //MARK: - IBAction
    @IBAction func registerAction(_ sender: UIButton) {
        LAXAnimation.tuijiAnimation(with: LAXDirectionRight)
        let vc = RegisterViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        LAXAnimation.bowenAnimation()
        (UIApplication.shared.delegate as! AppDelegate).enterMainViewController()
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
