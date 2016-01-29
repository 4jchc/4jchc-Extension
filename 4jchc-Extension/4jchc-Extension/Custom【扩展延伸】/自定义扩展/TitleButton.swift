//
//  TitleButton.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/29.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit
//MARK: - 转换图片和文字的位置
class TitleButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "<#navigationbar_arrow_down#>"), forState: UIControlState.Normal)
        setImage(UIImage(named: "<#navigationbar_arrow_down#>"), forState: UIControlState.Selected)
        self.sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*
        print("-----------")
        titleLabel?.frame.offsetInPlace(dx: -imageView!.bounds.width * 0.5, dy: 0)
        imageView?.frame.offsetInPlace(dx: titleLabel!.bounds.width * 0.5 , dy: 0)
        */
        
        // Swift中可以这样写
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}