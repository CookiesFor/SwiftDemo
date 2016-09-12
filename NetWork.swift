//
//  NetWork.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/9.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import Alamofire

class NetWork: NSObject {

    
    typealias requestCompleterHandle = (dic:NSDictionary) ->Void
    
    var requestFunc = requestCompleterHandle?()
    
    //一行单例，标准写法
    static let shareNetWork = NetWork()
    
    
    
    func requestData(path:NSString, params:NSDictionary) -> Void{
        
        Alamofire
            .request(.POST, NSURL (fileURLWithPath:path as String ), parameters: params as? [String : AnyObject])
            .responseJSON { (response) in
                
                
                
                guard response.result.isSuccess else {
                    
                    
                    return
                }
                if let value = response.result.value {
                    
                }
        }
        
        
        
    }
    
}
