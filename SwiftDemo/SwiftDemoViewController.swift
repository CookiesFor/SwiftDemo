//
//  SwiftDemoViewController.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/8.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import SVProgressHUD

let SwiftDemoCellID = "SwiftDemoCell"
let SwiftDemoSecondCellID = "SwiftDemoSecondCell"


class SwiftDemoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var model:SwiftDemoModel = SwiftDemoModel()
    
    
    var dataSource:NSMutableArray = []
    
    var orderIDSource:NSMutableArray = []
    
    var currentPage:NSInteger = NSInteger()
    
    
    let table:UITableView = UITableView(frame:UIScreen.mainScreen().bounds,style:UITableViewStyle.Plain)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SwiftTableView"
       
        self.view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        table .registerNib(UINib(nibName: SwiftDemoCellID, bundle:nil), forCellReuseIdentifier: SwiftDemoCellID)
        table .registerNib(UINib(nibName: SwiftDemoSecondCellID,bundle:nil), forCellReuseIdentifier: SwiftDemoSecondCellID)
        
       currentPage = 1
        
        
        table.mj_header = MJRefreshNormalHeader (refreshingBlock: { 
            self.currentPage = 1
            self.dataSource .removeAllObjects()
            self.orderIDSource .removeAllObjects()
            self.loadData(self.currentPage)
            
        })
        table.mj_header .beginRefreshing()
        
        
        let footer:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter (refreshingTarget: self, refreshingAction: #selector(SwiftDemoViewController.loadDataMore))
        footer .setTitle("", forState: MJRefreshState .Idle)
        footer .setTitle("Loading more...", forState: MJRefreshState .Refreshing)
        footer .setTitle("NO more data...", forState: MJRefreshState .NoMoreData)
        table.mj_footer = footer
        
        
    }

    func loadDataMore() -> Void {
        
        currentPage += 1
        loadData(currentPage)
        
    }
    
    
    //下载数据
    func loadData(pageNumber:NSInteger) -> Void {
        
        let url = HostUrl + "api/order_record.php?action=list"
        
        let parameter:NSDictionary = ["lng":"113.608634","lat":"34.801111","user_id":"5","token":"D2FB247AEE1FAE05A1132DE83F2BE4CD","page":pageNumber]
        
        SVProgressHUD .showWithStatus("加载数据...")
        
        Alamofire
            .request(.POST, url, parameters: parameter as? [String : AnyObject])
            .responseJSON { (response) in
               
                print(response)
                
                guard response.result.isSuccess else {
                    
                    SVProgressHUD .showErrorWithStatus("加载失败...")
                    
                    return
                }
                if let value = response.result.value {
                    
                    print("value:\(value)")
                    
                    let data = value["data"] as!NSArray
                    
                    print(data)
                    
                    for dataDict in data{
                        
                        print("123\(dataDict)")
                        
                        self.orderIDSource .addObject((dataDict as! [String : AnyObject])["order_sn"]!)

                        let model:SwiftDemoModel = SwiftDemoModel()
                        
                        model .setValuesForKeysWithDictionary(dataDict as! [String : AnyObject])
                        
                        if model.order_type .intValue==2||model.order_type .intValue==6 {
                            
                           model .setValue(NSNumber.init(float: Float(SwiftDemoCell .heightWithModel(model))) , forKey: "height")
                            
                        }else{
                            
                         model .setValue(NSNumber.init(float: Float(SwiftDemoSecondCell .heightWithModel(model))) , forKey: "height")
                        }

                        self.dataSource.addObject(model)
                        
                    }
                    SVProgressHUD .dismiss()
                    print(self.dataSource)

                    }
                self.table .reloadData()
                self.table.mj_header .endRefreshing()
                self.table.mj_footer .endRefreshing()
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
        
        
        if model.order_type .intValue==2||model.order_type .intValue==6 {
            
            let cell:SwiftDemoCell = SwiftDemoCell(style: UITableViewCellStyle.Default, reuseIdentifier: SwiftDemoCellID)
            cell._model = model
            cell.sendSubviewToBack(cell.bgIMGView)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell .setModel(model)
            return cell
        
        }else{
            
            
            let cell:SwiftDemoSecondCell = SwiftDemoSecondCell(style: UITableViewCellStyle.Default,reuseIdentifier: SwiftDemoSecondCellID)
            cell.selectionStyle  = UITableViewCellSelectionStyle.None
            cell._model = model
            cell.sendSubviewToBack(cell.bgIMGView)
            cell .setModel(model)
            
            return cell
        
        }

        
       
        
    }
    
    //tableView的行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let model:SwiftDemoModel = dataSource[indexPath.row] as! SwiftDemoModel
        
        
        print( model.height)
        
        return CGFloat(model.height .floatValue)
        
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let orderDetailViewController = OrderDetailViewController()
        orderDetailViewController.orderID = orderIDSource[indexPath.row] as! NSString
        self.navigationController!.pushViewController(orderDetailViewController, animated: false)
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
