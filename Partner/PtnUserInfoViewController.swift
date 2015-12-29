//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnUserInfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PduDelegate {
    



    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var upRightBtn: UIButton!
    @IBOutlet weak var upRightBtnClick: UIButton!
    var userPdu:PtnUserInfoPDU?
    var loginPdu:PtnLoginPDU?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuList.delegate = self;
        menuList.dataSource = self;
		let accessToken = getLocalUserString("accesstoken");
        if accessToken == nil{
            let avatarImage:UIImage = UIImage(named: "default.png")!
		    userAvatar.image = avatarImage;
            userNickName.text = "请登录";
        }else{
            self.displayUserInfo();
        }
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
		let rowNo = indexPath.row;
        let cellId:String = "menuCell";
        var menuCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId)
        //let label:UILabel = menuCell!.viewWithTag(1) as! UILabel;
        if menuCell == nil {
            menuCell = UITableViewCell(style:.Subtitle,reuseIdentifier:cellId)
        }
        switch rowNo {
            case 0:
                menuCell?.textLabel!.text = "完善资料";
                break;
            case 1:
                menuCell?.textLabel!.text = "场地收藏";
                break;
            case 2:
                menuCell?.textLabel!.text = "朋友分享";
                break;
            case 3:
                menuCell?.textLabel!.text = "联系我们";
                break;
            case 4:
                menuCell?.textLabel!.text = "退出登录";
                break;
            default:
                break;
        }
        
        return menuCell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 5;
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //start a Chat
        
    }

    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 30;
    }
    //PduDelegate协议
    func reloadTable(){
		//activeList.reloadData();
        let userid = getLocalUserString("userid");
        for userinfo in userPdu!.userInfo! {
            if(userinfo.userId == userid){
                if let nickname = userinfo.nickName {
                    setLocalUserString("nickname",nickname);
                }
                if let avatar = userinfo.avatar {
                    setLocalUserString("avatar",avatar);
                }
                if let country = userinfo.country {
                    setLocalUserString("country",country);
                }
                if let province = userinfo.province {
                    setLocalUserString("province",province);
                }
                if let city = userinfo.city {
                    setLocalUserString("city",city);
                }
                if let introduce = userinfo.introduce {
                    setLocalUserString("introduce",introduce);
                }
                break;
            }
        }
        self.displayUserInfo();
	}
    func displayUserInfo(){
		print("viewController reload data!!!");
        upRightBtn.hidden = true;
        let imageUrl = getLocalUserString("avatar");
        if(imageUrl != nil){
            let avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl!)!)!)!;
            userAvatar.image = avatarImage;
        }
        let nickName = getLocalUserString("nickname");
        if (nickName != nil){
            userNickName.text = nickName;
        }
    }
    func returnSuccess(actionId:String){
        if(actionId == "login"){
            setLocalUserString("accesstoken",loginPdu!.loginBody!.accessToken!);
            setLocalUserString("userid",loginPdu!.loginBody!.userId!);
            userPdu = PtnUserInfoPDU(url: "\(serverUrl)user/query");
            userPdu!.setHeader("accesstoken",loginPdu!.loginBody!.accessToken!);
            userPdu!.delegate = self;
            userPdu!.requestHttp();
        }
    }
    func regAction(){
        //进入注册页面
    }
    func loginAction(){
        let alert = UIAlertView(title:"登录",message:"请输入用户名和密码",delegate:self,cancelButtonTitle:"登录",otherButtonTitle:"忘记密码",nil);
        alert.alertViewStyle = .LoginAndPasswordInput;
        alert.textFieldAt(1).keyboardType = .NumberPad;
        alert.show();
    }
    func alertView(alertView:UIAlertView,clickedButtonAtIndex:buttonIndex){
        if（buttonIndex == 0){
            let nameField = alertView.textFieldAtIndex(0);
            let passField = alertView.textFieldAtIndex(1);
            loginPdu = PtnLoginPDU(url: "\(serverUrl)login");
            loginPdu!.delegate = self;
            loginPdu!.setStringParameter("username",nameField.text);
            loginPdu!.setStringParameter("password",passField.text);
            loginPdu!.requestHttp();
        }else{
            //进入忘记密码页面
        }
    }
    func willPresentAlertView(alertView:UIAlertView){
        for view in alertView.subViews{
            if view.isKindOfClass(UILabel.class) {
                let label = view;
                label.textAligenment = .Left;
            }
        }
    }
}

