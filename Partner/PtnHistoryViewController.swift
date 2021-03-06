//
//  ViewController.swift
//  Partner
//
//  Created by 张宏台 on 15/12/6.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

class PtnHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,PduDelegate{

    @IBOutlet weak var activeList: UITableView!
    var activePdu:PtnActiveHistoryPDU?
    var timer:NSTimer?;
    override func viewWillAppear(animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        activePdu = PtnActiveHistoryPDU(url: "\(serverUrl)active/query");
        activePdu!.delegate = self;
        activePdu!.setStringParameter("fields",value:"activeid,title");
        activePdu!.setStringParameter("creatorid",value:"userid");
        activePdu!.requestHttp();
        activeList.delegate = self;
        activeList.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell{
		let rowNo = indexPath.row;
        let cellId:String = (rowNo % 2 == 0) ? "activeCell1" : "activeCell2";
        let sportCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId,forIndexPath:indexPath);
        let label:UILabel = sportCell!.viewWithTag(1) as! UILabel;
        label.text = activePdu!.historyInfo![indexPath.row].title;
        let msg:UILabel = sportCell!.viewWithTag(2) as! UILabel;
        msg.text = PtnSqlite.getLastChat(activePdu!.historyInfo![indexPath.row].activeId);
        return sportCell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let active = activePdu!.historyInfo {
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
    //PduDelegate协议
    func reloadTable(){
		print("viewController reload data!!!");
        timer = NSTimer.scheduledTimerWithTimeInterval(5,target:self,selector:Selector("updateChatMessage"),userInfo:nil,repeats:true);
		activeList.reloadData();
	}
    @IBAction func segmentClick(sender: AnyObject) {
		switch sender.selectedSegmentIndex {
			case 0:
				activePdu!.setUrl("\(serverUrl)active/query");
				activePdu!.setStringParameter("creatorid",value:getLocalUserString("userid"));
				activePdu!.setStringParameter("sort",value:"nindex desc");
				break;
			case 1:
				activePdu!.setUrl("\(serverUrl)parti/query");
		        activePdu!.setStringParameter("sort",value:"nindex desc");
				break;
            default:
                break
		}
		activePdu!.requestHttp();
    }
    func returnSuccess(actionId: String) {
        
    }
    func requestFailed(err: ErrInfo) {
        
    }
    func updateChatMessage(){
    }
}

