//
//  SwiftDemoCell.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/8.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import SnapKit


class SwiftDemoCell: UITableViewCell {
    
    //发货地
    var titleLabel:UILabel = UILabel()
    //收货地
    var contentLabel:UILabel = UILabel()
    //取货时间
    var timeLabel:UILabel = UILabel()
    //配送费
    var buyMoneyLabel:UILabel = UILabel()
    //物品名称
    var goodsNameLbale:UILabel = UILabel()
    //距您距离
    var adistanceLabel:UILabel = UILabel()
    //距离发货地
    var bdistanceLabel:UILabel = UILabel()
    //顶部线
    var topLineView:UIView = UIView()
    
    
    
    var _model:SwiftDemoModel = SwiftDemoModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if !self.isEqual(nil) {
            
            setupUI()
            
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func setupUI(){
    

        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(timeLabel)
        addSubview(buyMoneyLabel)
        addSubview(goodsNameLbale)
        addSubview(adistanceLabel)
        addSubview(bdistanceLabel)
        addSubview(topLineView)
        
//        titleLabel.backgroundColor = .redColor()
//        contentLabel.backgroundColor = .greenColor()
        
        titleLabel.numberOfLines = 0
        contentLabel.numberOfLines = 0
        timeLabel.numberOfLines = 0
        buyMoneyLabel.numberOfLines = 0
        goodsNameLbale.numberOfLines = 0
        adistanceLabel.numberOfLines = 0
        bdistanceLabel.numberOfLines = 0
        
        //取货时间
        timeLabel.snp_makeConstraints { (make) in
            
            make.left.top.equalTo(5)
            make.height.equalTo(35)
            
        }
        //配送费
        buyMoneyLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(timeLabel.snp_right).offset(5)
            make.top.equalTo(5)
            make.height.equalTo(35)
            make.right.equalTo(-5)
            
        }
        //顶部线
        topLineView.snp_makeConstraints { (make) in
            
            make.top.equalTo(timeLabel.snp_bottom).offset(5)
            make.left.right.equalTo(0)
            
        }
        topLineView.backgroundColor = .redColor()
        //发货地
        titleLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(topLineView.snp_bottom).offset(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
        }
        //距您的距离
        adistanceLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.right.equalTo(-5)
            make.height.equalTo(10)
            
        }
        //收货地
        contentLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(5)
            make.top.equalTo(adistanceLabel.snp_bottom).offset(5)
            make.right.equalTo(self).offset(-5)
            
        }
        //距发货地
        bdistanceLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(contentLabel.snp_bottom).offset(5)
            make.right.equalTo(-5)
            make.height.equalTo(10)
            
        }
        //物品名称
        goodsNameLbale.snp_makeConstraints { (make) in
            
            make.top.equalTo(bdistanceLabel.snp_bottom).offset(5)
            make.left.equalTo(5)
            make.right.equalTo(-1)
            make.height.equalTo(35)
           
        }
        
        
        
        
    
    }
    
    
    func setModel(model: SwiftDemoModel) -> Void {
        
        _model = model
        
       
        adistanceLabel.font = UIFont.systemFontOfSize(11)
        bdistanceLabel.font = UIFont.systemFontOfSize(11)
        
        adistanceLabel.text = "距您的距离:  "
        bdistanceLabel.text = "距发货地距离:  "
        titleLabel.text = "发:  " +  model.buy_shop_address as String
        contentLabel.text = "收:  "  + model.receive_shop_address as String
        
        if model.receive_time .isEqual("1") {
            
            timeLabel.text = "立即取货,取货后一小时内送达"
            
        }else
        {
            timeLabel.text =  SwiftDemoCell .timeStampToString(model.receive_time as String)
        }
        
        buyMoneyLabel.text = model.buy_money as String + "元"
        
        goodsNameLbale.text = "物品名称:  " + (model.goods_name as String) as String
    
        
        
    
    }
    
    
    
   class func heightWithModel(model:SwiftDemoModel) -> CGFloat {
        
        let cell:SwiftDemoCell = SwiftDemoCell(style: UITableViewCellStyle.Default ,reuseIdentifier: "")
        cell .setModel(model)
        cell .layoutIfNeeded()
    
        let frame:CGRect = cell.goodsNameLbale.frame
    
        print(frame)
    
        return frame.origin.y+frame.size.height+5
        
        
    }
    
    
    static func timeStampToString(timeStamp:String)->String {
        
        var string = NSString(string: timeStamp)
        
        var timeSta:NSTimeInterval = string.doubleValue
        var dfmatter = NSDateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        
        var date = NSDate(timeIntervalSince1970: timeSta)
        
        print(dfmatter.stringFromDate(date))
        return dfmatter.stringFromDate(date)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
