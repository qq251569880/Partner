//
//  PtnCreateResultPDU.swift
//  Partner
//
//  Created by 张宏台 on 15/12/19.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import Foundation
class PtnCreateResultPDU :PtnPDU
{
    var createBody:PtnCreateBody?
    var objectKey:String?
    //识别操作
    var actionId:String;
    override init(actionid:String=""){
        super.init();
        actionId = actionid;
    }
    init(url:String,id:String,actionid:String=""){
        super.init();
        requestUrl = url;
        objectKey = id;
        actionId = actionid;
    }
    
    override func decodeReturnBody(){
        createBody = PtnCreateBody(decoder:responseJson!.body!,id:objectKey!);
    }
}