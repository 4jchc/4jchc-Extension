//
//  HMSearchBar.swift
//  4jcc微博
//
//  Created by 蒋进 on 15/11/4.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

class HMSearchBar: UITextField {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ///*****✅自定义搜索框
        // 创建搜索框对象
//        self.frame.size.width = 300;
//        self.frame.size.height = 30;
//        self.frame.origin.x = 8
//        self.frame.origin.y = 3
        
        self.font = UIFont.systemFontOfSize(15.0)
        self.placeholder = "请输入搜索条件"
        self.background = UIImage(named: "searchbar_textfield_background")
        
        
        /// 通过init来创建初始化绝大部分控件，控件都是没有尺寸
        let searchIcon:UIImageView = UIImageView()
        ///*****✅搜索图标--UIImageView
        searchIcon.image = UIImage(named: "searchbar_textfield_search_icon")
        searchIcon.frame.size.width = 30;
        searchIcon.frame.size.height = 30;
        searchIcon.contentMode = UIViewContentMode.Center
        ///添加图片到左边
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewMode.Always
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func SeachBar()->HMSearchBar {
        
        return self.init()
    }
    

}
