//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnSportsListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var sportListTable: UITableView!
    var activePdu:PtnActiveInfoQueryPDU?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tabImg1:UIImage = UIImage(named: "60/1.png")!
        let tabImg:UIImage = UIImage(CGImage: tabImg1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelect1:UIImage = UIImage(named: "60/1_1.png")!
        let tabImgSelect:UIImage = UIImage(CGImage: tabImgSelect1.CGImage!, scale: 2, orientation: .Up)
        let tabBtn:UITabBarItem = UITabBarItem(title: "足球天下", image: tabImg.imageWithRenderingMode(.AlwaysOriginal), selectedImage: tabImgSelect.imageWithRenderingMode(.AlwaysOriginal))
        self.tabBarItem = tabBtn;
        activePdu = PtnActiveInfoQueryPDU(url: "http://yuyanshu.cn:8001/app.php/active/query");
        activePdu!.requestHttp();
        sportListTable.delegate = self;
        sportListTable.dataSource = self;
        sportListTable.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        let cellId:String = "sportCell";
        var sportCell:PtnSportListTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? PtnSportListTableViewCell;
        if(sportCell == nil){
             //sportCell = PtnSportListTableViewCell(newStyle:.Subtitle ,newReuseIdentifier:cellId)
            tableView.registerNib(UINib.init(nibName: "PtnSportListTableViewCell", bundle: nil), forCellReuseIdentifier: "sportListCell")
            sportCell = tableView.dequeueReusableCellWithIdentifier(cellId) as? PtnSportListTableViewCell;
        }
        return sportCell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let active = activePdu!.activeInfo {
            return active.count
        }
        return 0;
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //start a Chat
        
    }
    func tableView(tableView: UITableView, willDisplayCell cell:PtnSportListTableViewCell, indexPath: NSIndexPath){
        cell.sportTitle.text = activePdu!.activeInfo![indexPath.row].title;
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 130;
    }
}

