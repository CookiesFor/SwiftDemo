//
//  OrderDetailModel.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/10.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit

class OrderDetailModel: NSObject {

    
    var leftTitle :NSString
    var rightContent :NSString
    var height:NSString
    
    
    
    override init() {
        
        leftTitle = ""
        rightContent = ""
        height = ""
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
