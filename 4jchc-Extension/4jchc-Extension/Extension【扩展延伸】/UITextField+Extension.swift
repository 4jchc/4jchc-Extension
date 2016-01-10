//
//  UITextField.swift
//  WeChat
//
//  Created by 蒋进 on 15/12/22.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

extension UITextField{
    
    ///添加文件输入框左边的View,添加图片
    func addLeftViewWithImage(image:String ){
        
        // 密码输入框左边图片
        let lockIv: UIImageView  = UIImageView()
        
        // 设置尺寸
        var imageBound: CGRect = self.bounds;
        // 宽度高度一样
        imageBound.size.width = imageBound.size.height;
        lockIv.bounds = imageBound;
        
        // 设置图片
        lockIv.image = UIImage(named: image)
        
        // 设置图片居中显示
        lockIv.contentMode = UIViewContentMode.Center;
        
        // 添加TextFiled的左边视图
        
        self.leftView = lockIv;
        
        // 设置TextField左边的总是显示
        self.leftViewMode = UITextFieldViewMode.Always;
        
    }
    
    //MARK: - //判断是否为手机号码
    func isTelphoneNum() ->Bool{
        
        let telRegex: NSString  = "^1[3578]\\d{9}$";
        let prediate: NSPredicate  = NSPredicate(format: "SELF MATCHES %@", telRegex)
        return prediate.evaluateWithObject(self.text)
        
    }
    
    
    class var warningBackgroundColor:UIColor {
        
        get {
            
            return UIColor.yellowColor()
        }
    }
    
    
}