//
//  MySwiftCell.swift
//  SwiftDemo
//
//  Created by SIMPLE PLAN on 16/5/6.
//  Copyright © 2016年 SIMPLE PLAN. All rights reserved.
//

import UIKit

class MySwiftCell: UITableViewCell {

    //左边label
    var leftOrderNameLabel:UILabel = UILabel()
    //右边label
    var rightOrderDetailLabel:UILabel = UILabel()
    
    var _model:OrderDetailModel = OrderDetailModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if !self .isEqual(nil) {
        
            makeUI()
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeUI() {
        
        addSubview(leftOrderNameLabel)
        addSubview(rightOrderDetailLabel)
        
        leftOrderNameLabel.numberOfLines = 0
        rightOrderDetailLabel.numberOfLines = 0
        leftOrderNameLabel.snp_makeConstraints { (make) in
            
            make.top.equalTo(8);
            make.left.equalTo(15);
            make.width.equalTo(90);
        }
        
        rightOrderDetailLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(leftOrderNameLabel.snp_right).offset(8);
            make.top.equalTo(8);
            make.right.equalTo(-10);
            
        }

        leftOrderNameLabel.backgroundColor = UIColor .redColor()
        rightOrderDetailLabel.backgroundColor = UIColor .redColor()
        let w = UIScreen.mainScreen().bounds.size.width
        rightOrderDetailLabel.preferredMaxLayoutWidth = w-123
 
    }
    
    
    func setModel(model:OrderDetailModel) -> Void {
        
        _model = model
        
        leftOrderNameLabel.text = model.leftTitle as String
        rightOrderDetailLabel.text = model.rightContent as String
        
        if model.rightContent .isEqual("") {
            
            rightOrderDetailLabel.text = "无"
            
        }
        
        
    }
    
    class func heightWithModel(model:OrderDetailModel) -> CGFloat {
        
        let cell:MySwiftCell = MySwiftCell(style: UITableViewCellStyle.Default ,reuseIdentifier: "")
        
        cell .setModel(model)
        cell .layoutIfNeeded()
        
        let frame:CGRect = cell.rightOrderDetailLabel.frame
        
        print(frame)
        
        return frame.origin.y+frame.size.height+7
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
