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
    var vcodePdu:PtnNoBodyPDU?
    var userAction:Int = 0;
    var tickDown:Int = 60;
    var timer:NSTimer?;

    @IBOutlet weak var segmentSelect: UISegmentedControl!;

    @IBOutlet weak var regView: UIView!;
    @IBOutlet weak var changePassView: UIView!;
    @IBOutlet weak var resetPassView: UIView!;

    @IBOutlet weak var regUserName: UITextField!;
    @IBOutlet weak var regVerify: UITextField!;
    @IBOutlet weak var regPassword: UITextField!;

    @IBOutlet weak var oldPassword: UITextField!;
    @IBOutlet weak var newPassword1: UITextField!;
    @IBOutlet weak var newPassword2: UITextField!;
    
    @IBOutlet weak var resetUserName: UITextField!;
    @IBOutlet weak var resetVerify: UITextField!;
    @IBOutlet weak var resetNewPassword: UITextField!;
    
    var regVcodeBtn:UIButton;
    var changeVcodeBtn:UIButton;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let viewLoc:CGRect = CGRectMake(20,30,300,200);
        regView.frame = viewLoc;
        changePassView.frame = viewLoc;       
        resetPassView.frame = viewLoc;       
        vcodePdu = PtnNoBodyPDU("\(serverUrl)verify/send",actionid:"vcode");
        forgetPassPdu = PtnNoBodyPDU("\(serverUrl)user/modifypass",actionid:"modifypass");
        changePassPdu = PtnNoBodyPDU("\(serverUrl)user/forgotpass",actionid:"forgotpass");
        loginPdu = PtnLoginPDU("\(serverUrl)user/reg");
        switch userAction {
        case 0:
            changePassView.hidden = true;
            resetPassView.hidden = true;
            regView.hidden = false;
            break;
        case 1:
            resetPassView.hidden = true;
            regView.hidden = true;
            changePassView.hidden = false;
            break;
        case 2:
            changePassView.hidden = true;
            regView.hidden = true;
            resetPassView.hidden = false;
            break;
        default:
            break;
        }
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.


    }
    
    
    @IBAction func segmentBtnClick(sender: AnyObject) {
        let segBtn = sender as! UISegmentedControl
		switch segBtn.selectedSegmentIndex {
        case 0:
            changePassView.hidden = true;
            resetPassView.hidden = true;
            regView.hidden = false;
            break;
        case 1:
            resetPassView.hidden = true;
            regView.hidden = true;
            changePassView.hidden = false;
            break;
        case 2:
            changePassView.hidden = true;
            regView.hidden = true;
            resetPassView.hidden = false;
            break
        default:
            break
		}
    }
    
    @IBAction func regSendVerify(sender: AnyObject) {
        if regUserName.text == nill || regUserName.text == "" {
            var alertController = UIAlertController(title: "提示", message: "请输入用户名", preferredStyle: .Alert);
            var okAction = UIAlertAction(title: "好的", style: .Default, handler: nil);
            alertController.addAction(okAction);
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
            vcodePdu!.setStringParameter(name:"username",value:regUserName.text!);
            vcodePdu!.setStringParameter(name:"action",value:"register");
            vcodePdu!..requestHttp();
        }
    }
    @IBAction func regBtnClick(sender: AnyObject) {
        var okAction = UIAlertAction(title: "好的", style: .Default, handler: nil);
        if regUserName.text == nill || regUserName.text == "" {
            var alertController = UIAlertController(title: "提示", message: "请输入用户名", preferredStyle: .Alert);
            alertController.addAction(okAction);
            self.presentViewController(alertController, animated: true, completion: nil)
                return;
        }
        if regVerify.text == nill || regVerify.text == "" {
            var alertController = UIAlertController(title: "提示", message: "请输验证码", preferredStyle: .Alert);
            alertController.addAction(okAction);
            self.presentViewController(alertController, animated: true, completion: nil)
                return;
        }
        if regPassword.text == nill || regPassword.text == "" {
            var alertController = UIAlertController(title: "提示", message: "请输密码", preferredStyle: .Alert);
            alertController.addAction(okAction);
            self.presentViewController(alertController, animated: true, completion: nil)
                return;
        }
        loginPdu!.setStringParameter(name:"username",value:regUserName.text!);
        loginPdu!.setStringParameter(name:"password",value:regVerify.text);
        loginPdu!.setStringParameter(name:"vcode",value:regPassword.text);
        loginPdu!..requestHttp();

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
		switch segBtn.selectedSegmentIndex {
        case "vcode":
            if userAction == 0 {
                regVcodeBtn.enable = false;
            }else{
                changeVcodeBtn.enable = false;
            }
            tickDown = 60;
            timer = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:Selector("tickDown"),userInfo:nil,repeats:true);

            break;
        case "modifypass":
            var alertController = UIAlertController(title: "提示", message: "注册成功，返回个人信息", preferredStyle: .Alert);
            var cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil);
            var okAction = UIAlertAction(title: "好的", style: .Default, handler: nil);
            alertController.addAction(cancelAction);
            alertController.addAction(okAction);
            self.presentViewController(alertController, animated: true, completion: nil)
            break;
        case "forgotpass":
            break;
        case "login":
            break;
        default:
            break;
        }
        }
    func requestFailed(err: ErrInfo) {
        
    }
    func tickDown(){
        if userAction == 0{
            regVcodeBtn.text = "请\(tickDown)秒后重试";
            if tickDown == 0 {
                timer.invalidate();
                regVcodeBtn.enable = true;
            }
        }else{
            changeVcodeBtn.text = "请\(tickDown)秒后重试";
            if tickDown == 0 {
                timer.invalidate();
                changeVcodeBtn.enable = true;
            }
        }
    }
    
}

