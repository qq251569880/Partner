//
//  PtnRootViewTabController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import Foundation

import UIKit

class PtnRootViewTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginBtn:UIBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = loginBtn;


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
