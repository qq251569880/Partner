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
            guard let _ = sportCell  else{
                print("sport cell is nil")
                return sportCell!;
            }
        }
        
        sportCell!.sportTitle.text = activePdu!.activeInfo![indexPath.row].title;
        sportCell!.sportCreator.text = activePdu!.activeInfo![indexPath.row].creatorName;
        sportCell!.sportTime.text = "开始时间:\(activePdu!.activeInfo![indexPath.row].startTime!)";
        sportCell!.sportPlace.text = "进行地点：\(activePdu!.activeInfo![indexPath.row].address!)";
        if let num = activePdu!.activeInfo![indexPath.row].inmember {
			if(num > 0){
				sportCell!.sportParticipate.text = "已经有\(activePdu!.activeInfo![indexPath.row].inmember)人参与";
			}else{
				sportCell!.sportParticipate.text = "暂无人参与";
			}
        }else{
			sportCell!.sportParticipate.text = "暂无人参与";
        }
        
        sportCell!.sportIntoduce.text = activePdu!.activeInfo![indexPath.row].introduce;
        let imageUrl = activePdu!.activeInfo![indexPath.row].creatorAvatar;
        if(imageUrl != nil){
            let avatarImage:UIImage = UIImage(data:NSData(contentsOfURL:NSURL(string:imageUrl!)!)!)!;
            sportCell!.creatorImage.image = avatarImage;
            
        }else{
			let avatarImage:UIImage = UIImage(named: "default.png")!
			sportCell!.creatorImage.image = avatarImage;
        }
        sportCell!.creatorImage.contentMode = UIViewContentMode.ScaleAspectFill;
        sportCell!.layer.cornerRadius = 12;
        sportCell!.layer.masksToBounds = true;
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
        cell.backgroundColor = indexPath.row % 2 == 1 ? UIColor.greenColor():UIColor.redColor();
    }
    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat{
        return 110;
    }

    @IBAction func orderBtnClick(sender: AnyObject) {
    }
    //PduDelegate协议
    func reloadTable(){
		print("viewController reload data!!!");
		sportListTable.reloadData();
	}
}

