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
    @IBOutlet weak var segmentSelect: UISegmentedControl!
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var changePassView: UIView!
    @IBOutlet weak var resetPassView: UIView!

    @IBOutlet weak var regUserName: UITextField!
    @IBOutlet weak var regVerify: UITextField!
    @IBOutlet weak var regPassword: UITextField!

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword1: UITextField!
    @IBOutlet weak var newPassword2: UITextField!
    
    @IBOutlet weak var resetUserName: UITextField!
    @IBOutlet weak var resetVerify: UITextField!
    @IBOutlet weak var resetNewPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.


    }
    
    
    @IBAction func segmentBtnClick(sender: AnyObject) {
    }
    
    @IBAction func regSendVerify(sender: AnyObject) {
    }
    @IBAction func regBtnClick(sender: AnyObject) {
    }
    @IBAction func modifyPassBtnClick(sender: AnyObject) {
    }
    
    @IBAction func resetPassSendVerify(sender: AnyObject) {
    }
    @IBAction func resetPassBtnClick(sender: AnyObject) {
    }
    
    func reloadTable(){
        print("viewController reload data!!!");
    }
    func returnSuccess(actionId: String) {
        
    }
    func requestFailed(err: ErrInfo) {
        
    }
    
    
}

