//
//  SwiftDemoSecondCell.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/9/9.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit
import  SnapKit


class SwiftDemoSecondCell: UITableViewCell {

    //物品价格
    var goodsMoneyLabel:UILabel = UILabel()
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
    //背景图片
    var bgIMGView:UIImageView = UIImageView()
    //接单按钮
    var orderButton:UIButton = UIButton()
    //查看路线按钮
    var roadButton:UIButton = UIButton()
    //分类图标
    var iconImg:UIImageView = UIImageView()
    
    
    
    
    var _model:SwiftDemoModel = SwiftDemoModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if !self.isEqual(nil) {
            
            createUI()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createUI(){
        
        addSubview(goodsNameLbale)
        addSubview(goodsMoneyLabel)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(timeLabel)
        addSubview(buyMoneyLabel)
        addSubview(adistanceLabel)
        addSubview(bdistanceLabel)
        addSubview(topLineView)
        addSubview(orderButton)
        addSubview(roadButton)
        addSubview(bgIMGView)
        addSubview(iconImg)
        
        titleLabel.numberOfLines = 0
        contentLabel.numberOfLines = 0
        timeLabel.numberOfLines = 0
        buyMoneyLabel.numberOfLines = 0
        goodsNameLbale.numberOfLines = 0
        adistanceLabel.numberOfLines = 0
        bdistanceLabel.numberOfLines = 0
        
        
        //背景图
        bgIMGView.snp_makeConstraints { (make) in
            
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-5)
            
        }
        
        let Img:UIImage = UIImage(named: "buyIcon")!
        
        //分类图标
        iconImg.snp_makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(CGSizeMake(Img.size.width, Img.size.height))
            
        }
        //取货时间
        timeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(iconImg.snp_right).offset(5)
            make.height.equalTo(35)
            
        }
        timeLabel.textAlignment = NSTextAlignment.Center
        //配送费
        buyMoneyLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(timeLabel.snp_right).offset(5)
            make.top.equalTo(5)
            make.height.equalTo(35)
            make.right.equalTo(-10)
            
        }
        //顶部线
        topLineView.snp_makeConstraints { (make) in
            
            make.top.equalTo(timeLabel.snp_bottom).offset(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(1)
            
        }
        //        topLineView.backgroundColor = .grayColor()
        //发货地
        titleLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(topLineView.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        //距您的距离
        adistanceLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.right.equalTo(-15)
            make.height.equalTo(10)
            
        }
        //收货地
        contentLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(10)
            make.top.equalTo(adistanceLabel.snp_bottom).offset(5)
            make.right.equalTo(self).offset(-10)
            
        }
        //距发货地
        bdistanceLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(contentLabel.snp_bottom).offset(5)
            make.right.equalTo(-15)
            make.height.equalTo(10)
            
        }
        //物品名称
        goodsNameLbale.snp_makeConstraints { (make) in
            
            make.top.equalTo(bdistanceLabel.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(25)
            
        }
        
        goodsMoneyLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(goodsNameLbale.snp_bottom).offset(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(25)
            
        }
        
        
        let w = UIScreen.mainScreen().bounds.size.width
        titleLabel.preferredMaxLayoutWidth = w-20
        contentLabel.preferredMaxLayoutWidth = w-20
        
        
        orderButton.snp_makeConstraints { (make) in
            
            make.top.equalTo(goodsMoneyLabel.snp_bottom).offset(5)
            make.left.equalTo(6)
            make.right.equalTo(-120)
            make.height.equalTo(35)
            
        }
        orderButton.layer.cornerRadius = 3
        orderButton.backgroundColor = .redColor()
        
        roadButton.snp_makeConstraints { (make) in
            
            make.top.equalTo(orderButton.snp_top).offset(0)
            make.left.equalTo(orderButton.snp_right).offset(3)
            make.right.equalTo(-10)
            make.height.equalTo(35)
            
        }
        roadButton.layer.cornerRadius = 3;
        roadButton.backgroundColor = .redColor()
        
        
        
    }
    
    func setModel(model:SwiftDemoModel) -> Void {
        
        _model = model
        bgIMGView.image = UIImage(named: "订单背景")
        self.backgroundView?.sendSubviewToBack(bgIMGView)
        
        
        adistanceLabel.font = UIFont.systemFontOfSize(11)
        bdistanceLabel.font = UIFont.systemFontOfSize(11)
        goodsNameLbale.font = UIFont.systemFontOfSize(14)
        timeLabel.font = UIFont.systemFontOfSize(14)
        contentLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.font = UIFont.systemFontOfSize(14)
        buyMoneyLabel.font = UIFont.systemFontOfSize(15)
        goodsMoneyLabel.font = UIFont.systemFontOfSize(14)
        
        orderButton .setTitle("接单", forState: UIControlState.Normal)
        roadButton .setTitle("查看路线", forState: UIControlState.Normal)
        
       
        
        
        adistanceLabel.text = "距您:  " + String(format: "%.2f",model.adistance .doubleValue/1000) + "千米"
        bdistanceLabel.text = "距发货地:  " + String(format: "%.2f",model.bdistance .doubleValue/1000) + "千米"
        titleLabel.text = "发:  " +  model.buy_shop_address as String
        contentLabel.text = "收:  "  + model.receive_shop_address as String
        
        if model.receive_time .isEqual("1") {
            
            timeLabel.text = "立即取货,取货后一小时内送达"
            
        }else
        {
            timeLabel.text =  SwiftDemoCell .timeStampToString(model.receive_time as String)
        }
        
        
        if model.order_type .isEqual("1") {
            
            iconImg.image = UIImage(named: "buyIcon")
            
        }else{
        
            iconImg.image = UIImage(named: "LifeIcon")
            
        }
        
        if model.is_show_money .isEqual("1") {
            
            goodsMoneyLabel.text = "物品总额:  " + (model.goods_moeny as String) as String + "元   (已支付物品费)"
            
        }else{
            
            goodsMoneyLabel.text = "物品总额:  凭小票收取物品费"
            
        }
        
        
        buyMoneyLabel.text = model.buy_money as String + "元"
        
        goodsNameLbale.text = "物品名称:  " + (model.goods_name as String) as String
        
        
        
        
    }
    
    class func heightWithModel(model:SwiftDemoModel) -> CGFloat {
        
        let cell:SwiftDemoSecondCell = SwiftDemoSecondCell(style: UITableViewCellStyle.Default ,reuseIdentifier: "")
        
        cell .setModel(model)
        cell .layoutIfNeeded()
        
        let frame:CGRect = cell.orderButton.frame
        
        print(frame)
        
        return frame.origin.y+frame.size.height+7
        
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
