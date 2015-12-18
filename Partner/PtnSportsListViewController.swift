//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnSportsListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PduDelegate {
    
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
        activePdu!.delegate = self;
        activePdu!.setStringParameter(name:"fields",value:"activeid,title,creatorname,creatoravatar,introduce,starttime,country,province,city,area,address,inmember");
        activePdu!.requestHttp();
        sportListTable.delegate = self;
        sportListTable.dataSource = self;
        
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
            tableView.registerNib(UINib.init(nibName: "PtnSportListTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
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
        cell.sportCreator.text = activePdu!.activeInfo![indexPath.row].creatorName;
        cell.sportTime.text = activePdu!.activeInfo![indexPath.row].startTime;
        cell.sportPlace.text = activePdu!.activeInfo![indexPath.row].address;
        cell.sportParticipate.text = activePdu!.activeInfo![indexPath.row].inmember;
        cell.sportIntoduce.text = activePdu!.activeInfo![indexPath.row].introduce;
        var imageUrl = activePdu!.activeInfo![indexPath.row].creatorAvatar;
        var avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl)));
        cell.creatorImage.image = avatarImage;
        cell.creatorImage.contentMode = .AspectFill;
        cell.backgroundColor = indexPath%2 ? greenColor:redColor;
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 130;
    }
    //PduDelegate协议
    func reloadTable(){
		print("viewController reload data!!!");
		sportListTable.reloadData();
	}
}

