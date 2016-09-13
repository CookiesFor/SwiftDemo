//
//  OrderDetailViewController.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/10.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let MySwiftCellID = "MySwiftCell"



class OrderDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {

    var orderID:NSString = NSString()

    let detailTableView:UITableView = UITableView(frame:UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
    let model:SwiftDemoModel = SwiftDemoModel()
    
    var SourceData:NSMutableArray = []
    
    var dataMary:NSMutableArray = []
    
    let _model:OrderDetailModel = OrderDetailModel()
    
    var signData:NSMutableArray = NSMutableArray()
    
    var sectionDataDic:NSMutableDictionary = NSMutableDictionary()
    
    var rowData:NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "订单详情"
        
        self.view.backgroundColor = UIColor .whiteColor()
        
        self.view .addSubview(detailTableView)
        detailTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView .registerNib(UINib(nibName: MySwiftCellID,bundle:nil), forCellReuseIdentifier: MySwiftCellID)
        
        getOrderData()
        
    }

    
    func getOrderData() {
        
        let url = HostUrl + "api/send_order.php?action=selete"
        
        let parameter:NSDictionary = ["token":"D2FB247AEE1FAE05A1132DE83F2BE4CD","express_id":"5","order_sn":orderID]
        
        
        Alamofire
            .request(.GET, url, parameters: parameter as? [String : AnyObject])
            .responseJSON { (response) in
                
//                print(response)
                
                guard response.result.isSuccess else {
                    
                    return
                }
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    
                    let codeStr = json["code"]
                    
                    
                    if (codeStr .intValue == 200) {
                        
                        let data:NSDictionary = value["data"] as!NSDictionary
                        
                        
//                        print(data)
                        
                        self.SourceData .addObject(["sign":"1","name":"订单编号","intro":data["order_sn"] as!NSString])
                        self.SourceData .addObject(["sign":"1","name": "发布时间","intro": data["pay_time"] as!NSString])
                        self.SourceData .addObject(["sign":"2","name":"取货地址","intro":data["send_shop_address"] as!NSString])
                        self.SourceData .addObject(["sign":"2","name":"收货地址","intro":data["receive_shop_address"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"物品名称","intro":data["goods_name"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"取货时间","intro":data["receive_time"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"配送要求","intro":data["remark"] as!NSString])
                        self.SourceData .addObject(["sign":"4","name":"配送费","intro":data["send_money"] as!NSString])
                        
                        
//                        print(self.SourceData)
                        
                        
                        
                        for dataDict in self.SourceData{
                            
                            let model:OrderDetailModel = OrderDetailModel()
                            model.rightContent = dataDict["intro"] as! NSString
                            model.leftTitle = dataDict["name"] as! NSString
                            model .setValue(NSNumber.init(float: Float(MySwiftCell .heightWithModel(model))) , forKey: "height")
                            
                            self.dataMary .addObject(model)
                            
                            
                            if !self.signData .containsObject(dataDict["sign"] as! NSString) {
                            
                                self.signData .addObject(dataDict["sign"] as! NSString)
                                
                            }
                            
                            print(self.sectionDataDic .objectForKey(dataDict["sign"] as! NSString))
                            
                            let sectionStr = self.sectionDataDic .objectForKey(dataDict["sign"] as! NSString)
                            print(sectionStr)
                            if ((sectionStr) != nil){
                            
                                let arr:NSMutableArray = self.sectionDataDic .objectForKey(dataDict["sign"] as! NSString) as! NSMutableArray
                                
                                arr .addObject(model)
                            
                            }else
                            {
                                let arr:NSMutableArray = NSMutableArray()
                                self.sectionDataDic .setObject(arr, forKey: dataDict["sign"] as! NSString)
                                
                                arr .addObject(model)
                                
                                
                            }
                            
                        }
                        
                        
                        for index in 0 ..< self.signData.count {
                            
                            print(self.sectionDataDic)
                            print(self.signData)
                            
                            print(self.sectionDataDic[self.signData[index] as! NSString])
                            
                            let ar:NSArray = self.sectionDataDic[self.signData[index] as! NSString] as! NSArray
                            self.rowData .addObject(ar)
                            print("index is \(self.rowData)")
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return signData.count
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowData[section].count
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        
      }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print(rowData)
        
        let model:OrderDetailModel = rowData[indexPath.section].objectAtIndex(indexPath.row) as! OrderDetailModel
        
        let cell:MySwiftCell = MySwiftCell(style: UITableViewCellStyle.Default,reuseIdentifier: MySwiftCellID)
        cell.layer.cornerRadius = 3
        cell._model = model
        cell .setModel(model)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model:OrderDetailModel = rowData[indexPath.section].objectAtIndex(indexPath.row) as! OrderDetailModel
        
        
        print( model.height)
        
        return CGFloat(model.height .floatValue)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
