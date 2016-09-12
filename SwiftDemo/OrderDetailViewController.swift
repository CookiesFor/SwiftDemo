//
//  OrderDetailViewController.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/10.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import Alamofire

let MySwiftCellID = "MySwiftCell"



class OrderDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {

    var orderID:NSString = NSString()

    let detailTableView:UITableView = UITableView(frame:UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
    let model:SwiftDemoModel = SwiftDemoModel()
    
    var SourceData:NSMutableArray = []
    
    var dataMary:NSMutableArray = []
    
    let _model:OrderDetailModel = OrderDetailModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "订单详情"
        
        self.view.backgroundColor = UIColor .whiteColor()
        
        self.view .addSubview(detailTableView)
//        detailTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView .registerNib(UINib(nibName: MySwiftCellID,bundle:nil), forCellReuseIdentifier: MySwiftCellID)
        
        getOrderData()
        
    }

    
    func getOrderData() {
        
        let url = "http://ceshi21.kuaikuaipaobei.com/api/send_order.php?action=selete"
        
        let parameter:NSDictionary = ["token":"D5D6C909BC5A830CCB7633F1AE7FB7A5","express_id":"5","order_sn":orderID]
        
        
        Alamofire
            .request(.GET, url, parameters: parameter as? [String : AnyObject])
            .responseJSON { (response) in
                
                print(response)
                
                guard response.result.isSuccess else {
                    
                    return
                }
                if let value = response.result.value {
                    
                    
                    if ("\(value["code"] as?NSNumber)" == "200") {
                        
                        let data:NSDictionary = value["data"] as!NSDictionary
                        
                        
                        print(data)
                        
                        self.SourceData .addObject(["sign":"1","name":"订单编号","intro":data["order_sn"] as!NSString])
                        self.SourceData .addObject(["sign":"1","name": "发布时间","intro": data["pay_time"] as!NSString])
                        self.SourceData .addObject(["sign":"2","name":"取货地址","intro":data["send_shop_address"] as!NSString])
                        self.SourceData .addObject(["sign":"2","name":"收货地址","intro":data["receive_shop_address"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"物品名称","intro":data["goods_name"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"取货时间","intro":data["receive_time"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"配送要求","intro":data["remark"] as!NSString])
                        self.SourceData .addObject(["sign":"41","name":"配送费","intro":data["send_money"] as!NSString])
                        
                        
                        print(self.SourceData)
                        
                        
                        
                        for dataDict in self.SourceData{
                            
                            let model:OrderDetailModel = OrderDetailModel()
                            model.rightContent = dataDict["intro"] as! NSString
                            model.leftTitle = dataDict["name"] as! NSString
                            model .setValue(NSNumber.init(float: Float(MySwiftCell .heightWithModel(model))) , forKey: "height")
                            
                            self.dataMary .addObject(model)
                        }
                        self.detailTableView .reloadData()

                    }else{
                    
                        
                        let alertController = UIAlertController (title: "", message: "请重新登录", preferredStyle: UIAlertControllerStyle.Alert)
                        let cancelAction = UIAlertAction (title: "取消", style: UIAlertActionStyle.Default, handler: { (action) in
                            
                            print("点击了取消")
                            
                            
                        })
                        
                        let sureAction = UIAlertAction (title: "确定", style: UIAlertActionStyle.Default, handler: { (action) in
                            
                            print("点击了确定")
                            
                            
                        })
                        
                        alertController .addAction(cancelAction)
                        alertController .addAction(sureAction)
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
//                        let alertView:UIAlertView = UIAlertView()
//                        alertView.title = "系统提示"
//                        alertView.message = "请重新登录"
//                        alertView.addButtonWithTitle("取消")
//                        alertView.addButtonWithTitle("确定")
//                        alertView.cancelButtonIndex=0
//                        alertView.delegate=self;
//                        alertView.alertViewStyle = UIAlertViewStyle.Default
//                        alertView.show()
                    }
                    
                }
        }
        
    }
    
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        
//        print("点击")
//        
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataMary.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:OrderDetailModel = dataMary[indexPath.row] as! OrderDetailModel
        
        let cell:MySwiftCell = MySwiftCell(style: UITableViewCellStyle.Default,reuseIdentifier: MySwiftCellID)
        cell._model = model
        cell .setModel(model)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model:OrderDetailModel = dataMary[indexPath.row] as! OrderDetailModel
        
        
        print( model.height)
        
        return CGFloat(model.height .floatValue)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
