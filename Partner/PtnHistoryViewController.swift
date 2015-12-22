//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnHistoryViewController: UIViewController {
    
    @IBOutlet weak var activeList: UITableView!
    override func viewWillAppear(animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
/*        let tabImg1:UIImage = UIImage(named: "2.png")!
        let tabImg:UIImage = UIImage(CGImage: tabImg1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelect1:UIImage = UIImage(named: "2_2.png")!
        let tabImgSelect:UIImage = UIImage(CGImage: tabImgSelect1.CGImage!, scale: 2, orientation: .Up)
        let tabBtn:UITabBarItem = UITabBarItem(title: "我的赛事", image: tabImg.imageWithRenderingMode(.AlwaysOriginal), selectedImage: tabImgSelect.imageWithRenderingMode(.AlwaysOriginal))
        self.tabBarItem = tabBtn;*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func segmentClick(sender: AnyObject) {
    }
    
    
}

