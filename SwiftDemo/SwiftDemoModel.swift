//
//  SwiftDemoModel.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/9.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit


class SwiftDemoModel: NSObject {
    
    var title :NSString
    var content :NSString
    var height:NSString
    var buy_shop_address:String
    var receive_shop_address:String
    var adistance:NSString
    var bdistance:NSString
    var buy_money:NSString
    var goods_name:NSString
    var is_show_in:NSString
    var order_sn:NSString
    var order_type:NSString
    var receive_time:NSString
    var goods_moeny:NSString
    var is_show_money:NSString
    
    
    override init() {
        
        self.title = ""
        self.content = ""
        self.height = ""
        self.buy_shop_address = ""
        self.receive_shop_address = ""
        self.adistance = ""
        self.bdistance = ""
        self.buy_money = ""
        self.goods_name = ""
        self.is_show_in = ""
        self.order_sn = ""
        self.order_type = ""
        self.receive_time = ""
        self.goods_moeny = ""
        self.is_show_money = ""
    }
    
    override func valueForUndefinedKey(key: String) -> AnyObject? {
        
        return key
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    
}
