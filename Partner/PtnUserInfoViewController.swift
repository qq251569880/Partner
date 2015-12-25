//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnUserInfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PduDelegate {
    

    @IBOutlet weak var userAvatar: UIImageView!


    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var upRightBtn: UIButton!
    @IBOutlet weak var userNickName: UILabel!
    var userPdu:PtnUserInfoPDU?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userPdu = PtnActiveInfoQueryPDU(url: "http://yuyanshu.cn:8001/app.php/user/query");
        userPdu!.delegate = self;
        menuList.delegate = self;
        menuList.dataSource = self;
		let accessToken = getUserInfoString("accesstoken");
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
        let menuCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId,forIndexPath:indexPath);
        let label:UILabel = menuCell!.viewWithTag(1) as! UILabel;
        switch rowNo {
            case 0:
                label.text = "完善资料";
                break;
            case 1:
                label.text = "场地收藏";
                break;
            case 2:
                label.text = "朋友分享";
                break;
            case 3:
                label.text = "联系我们";
                break;
            case 4:
                label.text = "退出登录";
                break;
            default:
                break;
        }
        
        return sportCell!
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
        upRightBtn.visible= false;
        let imageUrl = getUserInfoString("avatar");
        if(imageUrl != nil){
            let avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl!)!)!)!;
            userAvatar.image = avatarImage;
        }
        let nickName = getUserInfoString("nickname");
        if (nickName != nil){
            userNickName.text = nickName;
        }
		//activeList.reloadData();
	}
    func returnSuccess(actionId:String){
        
    }
    @IBAction func upRightBtnClick(sender: AnyObject) {
        
    }
    
    
}

