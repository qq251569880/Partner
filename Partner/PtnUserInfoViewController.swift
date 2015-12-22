//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnUserInfoViewController: UIViewController {
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var upRightBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*        let tabImg1:UIImage = UIImage(named: "3")!
        let tabImg:UIImage = UIImage(CGImage: tabImg1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelect1:UIImage = UIImage(named: "3_3")!
        let tabImgSelect:UIImage = UIImage(CGImage: tabImgSelect1.CGImage!, scale: 2, orientation: .Up)
        let tabBtn:UITabBarItem = UITabBarItem(title: "我的资料", image: tabImg.imageWithRenderingMode(.AlwaysOriginal), selectedImage: tabImgSelect.imageWithRenderingMode(.AlwaysOriginal))
        self.tabBarItem = tabBtn;*/
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func upRightBtnClick(sender: AnyObject) {
    }
    
    
}

