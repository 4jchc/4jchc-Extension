//
//  UITextField.swift
//  WeChat
//
//  Created by 蒋进 on 15/12/22.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

extension UITextField{
    

    //MARK:  添加文件输入框左边的View,添加图片
    ///  添加文件输入框左边的View,添加图片
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
    
    //MARK: 判断是否为手机号码
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
//MARK: 💗- 自定义💗光标颜色--占位符Placeholder文字颜色

/**
运行时(Runtime):
* 苹果官方一套C语言库
* 能做很多底层操作(比如访问隐藏的一些成员变量\成员方法....)
*/
class XMGTextField: UITextField {
    
    
    let XMGPlacerholderColorKeyPath = "_placeholderLabel.textColor"
    var placeHodelColor:UIColor?{
        
        didSet{
            
            self.setValue(placeHodelColor, forKeyPath: XMGPlacerholderColorKeyPath)
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置光标颜色和文字颜色一致
        self.tintColor = self.textColor;
        
        // KVC 设置placeholder字体颜色
        //setValue(UIColor.whiteColor(), forKeyPath: XMGPlacerholderColorKeyPath)
        // KVC 设置光标颜色
        //setValue(UIColor.whiteColor(), forKeyPath: "tintColor")
        
        // 设置textField边框颜色
        layer.borderColor = UIColor.whiteColor().CGColor
        // 设置textField边框的宽度
        layer.borderWidth = 0.1
        // 设置圆角
        layer.cornerRadius = frame.size.height * 0.3
        // 不成为第一响应者
        self.resignFirstResponder()
        
    }
    
    
    //MARK:  当前文本框聚焦时就会调用
    override func becomeFirstResponder() -> Bool {
        
        // 修改占位文字颜色
        setValue(self.textColor, forKeyPath: XMGPlacerholderColorKeyPath)
        return super.becomeFirstResponder()
    }
    //MARK:  当前文本框失去焦点时就会调用
    override func resignFirstResponder() -> Bool {
        
        // 修改占位文字颜色
        
        //setValue(UIColor.redColor(), forKeyPath: "_placeholderLabel.textColor")
        self.setValue(UIColor(white: 0.4, alpha: 0.8), forKeyPath: XMGPlacerholderColorKeyPath)
        return super.becomeFirstResponder()
        
    }
    /*
    override func drawPlaceholderInRect(rect: CGRect) {
    super.drawPlaceholderInRect(rect)
    //KVC  KVO   OBSERVER
    self.setValue(UIColor.whiteColor(), forKeyPath: XMGPlacerholderColorKeyPath)
    }
    
    */
    
}

