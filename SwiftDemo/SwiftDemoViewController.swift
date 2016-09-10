//
//  SwiftDemoViewController.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/8.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import Alamofire

let SwiftDemoCellID = "SwiftDemoCell"


class SwiftDemoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var model:SwiftDemoModel = SwiftDemoModel()
    
    
    var dataSource:NSMutableArray = []
    
    
    let table:UITableView = UITableView(frame:UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SwiftTableView"
       
        self.view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        table .registerNib(UINib(nibName: SwiftDemoCellID, bundle:nil), forCellReuseIdentifier: SwiftDemoCellID)
        
        
        loadData()
        
        
    }

    
    //下载数据
    func loadData() -> Void {
        
        let url = "http://ceshi21.kuaikuaipaobei.com/api/order_record.php?action=list"
        
        let parameter:NSDictionary = ["lng":"113.608634","lat":"34.801111","user_id":"551"]
        
        
        Alamofire
            .request(.GET, url, parameters: parameter as? [String : AnyObject])
            .responseJSON { (response) in
               
                print(response)
                
                guard response.result.isSuccess else {
                    
                    return
                }
                if let value = response.result.value {
                    
                    print("value:\(value)")
                    
                    let data = value["data"] as!NSArray
                    
                    print(data)
                    
                    for dataDict in data{
                        
                        print("123\(dataDict)")
                        
                        let model:SwiftDemoModel = SwiftDemoModel()
                        
                        model .setValuesForKeysWithDictionary(dataDict as! [String : AnyObject])
                        
                    model .setValue(NSNumber.init(float: Float(SwiftDemoCell .heightWithModel(model))) , forKey: "height")
                        
                        self.dataSource.addObject(model)
                        
                    }
                    print(self.dataSource)

                    }
                self.table .reloadData()
                }
        }

    
    
    
    //实现datasource协议
    //table的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count;
        
    }
    //创建cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:SwiftDemoModel =  dataSource[indexPath.row] as! SwiftDemoModel
        
        
        let cell:SwiftDemoCell = SwiftDemoCell(style: UITableViewCellStyle.Default, reuseIdentifier: SwiftDemoCellID)
        cell._model = model
        cell.sendSubviewToBack(cell.bgIMGView)
//        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell .setModel(model)
        
//        let title :String = Source[indexPath.row].0
//        cell.textLabel!.text = title
//        
//        //每一行有一个按钮
//        let btn:UIButton = UIButton(type: UIButtonType.Custom)
//        btn.frame = CGRectMake(UIScreen.mainScreen().bounds.width-100, 10, 80, 50)
//        btn.setTitle("下载", forState: UIControlState.Normal)
//        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        btn.backgroundColor = UIColor.redColor()
//        btn.tag = indexPath.row
//        btn.addTarget(self, action: #selector(SwiftDemoViewController.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//        
//        cell.contentView.addSubview(btn)
        
        return cell
        
    }
    
    //tableView的行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model:SwiftDemoModel = dataSource[indexPath.row] as! SwiftDemoModel
        
        
        print( model.height)
        
        return CGFloat(model.height .floatValue)
        
    }
    
    
//    func btnClick(sender:UIButton) {
//        
//        
//        let btn = self.view .viewWithTag(sender.tag) as? UIButton
//        
//        print(btn)
//        
//        print("你点击的是第\(sender.tag)个cell上的button");
//        
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
