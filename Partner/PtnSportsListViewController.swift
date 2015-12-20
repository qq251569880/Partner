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
/*        let tabImg1:UIImage = UIImage(named: "1")!
        let tabImg:UIImage = UIImage(CGImage: tabImg1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelect1:UIImage = UIImage(named: "1_1")!
        let tabImgSelect:UIImage = UIImage(CGImage: tabImgSelect1.CGImage!, scale: 2, orientation: .Up)
        let tabBtn:UITabBarItem = UITabBarItem(title: "足球天下", image: tabImg.imageWithRenderingMode(.AlwaysOriginal), selectedImage: tabImgSelect.imageWithRenderingMode(.AlwaysOriginal))
        self.tabBarItem = tabBtn;*/
        activePdu = PtnActiveInfoQueryPDU(url: "http://yuyanshu.cn:8001/app.php/active/query");
        activePdu!.delegate = self;
    //activePdu!.setStringParameter("fields",value:"activeid,title,creatorname,creatoravatar,introduce,starttime,country,province,city,area,address,inmember");
        activePdu!.requestHttp();
        sportListTable.delegate = self;
        sportListTable.dataSource = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
        let cellId:String = "sportListCell";
        var sportCell:PtnSportListTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? PtnSportListTableViewCell;
        if(sportCell == nil){
             //sportCell = PtnSportListTableViewCell(newStyle:.Subtitle ,newReuseIdentifier:cellId)
            tableView.registerNib(UINib.init(nibName: "PtnSportListTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
            sportCell = tableView.dequeueReusableCellWithIdentifier(cellId) as? PtnSportListTableViewCell;
            guard (sportCell == nil) else{
                print("sport cell is nil")
                return sportCell!;
            }
        }
        
        sportCell!.sportTitle.text = activePdu!.activeInfo![indexPath.row].title;
        sportCell!.sportCreator.text = activePdu!.activeInfo![indexPath.row].creatorName;
        sportCell!.sportTime.text = activePdu!.activeInfo![indexPath.row].startTime;
        sportCell!.sportPlace.text = activePdu!.activeInfo![indexPath.row].address;
        sportCell!.sportParticipate.text = activePdu!.activeInfo![indexPath.row].inmember;
        sportCell!.sportIntoduce.text = activePdu!.activeInfo![indexPath.row].introduce;
        let imageUrl = activePdu!.activeInfo![indexPath.row].creatorAvatar;
        if(imageUrl != nil){
            let avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl!)!)!)!;
            sportCell!.creatorImage.image = avatarImage;
            sportCell!.creatorImage.contentMode = UIViewContentMode.ScaleAspectFill;
        }
        sportCell!.backgroundColor = indexPath.row % 2 == 1 ? UIColor.greenColor():UIColor.redColor();
        return sportCell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let active = activePdu!.activeInfo {
            print(active.count)
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
        let imageUrl = activePdu!.activeInfo![indexPath.row].creatorAvatar;
        let avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl!)!)!)!;
        cell.creatorImage.image = avatarImage;
        cell.creatorImage.contentMode = UIViewContentMode.ScaleAspectFill;
        cell.backgroundColor = indexPath.row % 2 == 1 ? UIColor.greenColor():UIColor.redColor();
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 110;
    }
    //PduDelegate协议
    func reloadTable(){
		print("viewController reload data!!!");
		sportListTable.reloadData();
	}
}

