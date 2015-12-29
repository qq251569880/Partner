//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnRegPassViewController: UIViewController,PduDelegate {
    


    //注册成功即登录，否则失败
    var loginPdu:PtnLoginPDU?
    var changePassPdu:PtnNoBodyPDU?
    var forgetPassPdu:PtnNoBodyPDU?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.


    }
    func returnSuccess(actionId:String){
        
    }

    
    
}

