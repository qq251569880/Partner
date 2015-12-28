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
    var userPdu:PtnUserInfoPDU?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userPdu = PtnUserInfoPDU(url: "http://yuyanshu.cn:8001/app.php/user/query");
        userPdu!.delegate = self;
        menuList.delegate = self;
        menuList.dataSource = self;
		let accessToken = getLocalUserString("accesstoken");
        if accessToken == nil{
            let avatarImage:UIImage = UIImage(named: "default.png")!
		    userAvatar.image = avatarImage;
            userNickName.text = "请登录";
        }else{
            self.reloadTable();
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
		//activeList.reloadData();
	}
    func returnSuccess(actionId:String){
        
    }
    @IBOutlet weak var upRightBtnClick: UIButton!

    
    
}

