//
//  UIColor+Extension.swift
//  4j成才-微博
//
//  Created by 蒋进 on 15/12/1.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

///*****✅随机颜色color
extension UIColor {
    
//    class func randomColor() -> UIColor {
//        /*
//        颜色有两种表现形式 RGB RGBA
//        RGB 24
//        R,G,B每个颜色通道8位
//        8的二进制 255
//        R,G,B每个颜色取值 0 ~255
//        120 / 255.0
//        */
//        let r:CGFloat = CGFloat(arc4random_uniform(UInt32(256))) / 255.0
//        let g:CGFloat = CGFloat(arc4random_uniform(UInt32(256))) / 255.0
//        let b:CGFloat = CGFloat(arc4random_uniform(UInt32(256))) / 255.0
//        
//        return UIColor(red: r, green: g, blue: b, alpha: 1)
//    }
    
    // 随机色
    static var randomColor:UIColor{
        get{
            return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber() , alpha: 1.0)
        }
    }
    
//    class func randomColor() -> UIColor {
//        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber() , alpha: 1.0)
//    }
    
    class func randomNumber() -> CGFloat {
        // 0 ~ 255
        return CGFloat(arc4random_uniform(256)) / CGFloat(255)
    }
    
    
    //UIColor(red: <#123#>/255.0, green: <#123#>/255.0, blue: <#123#>/255.0, alpha: 1.0)
    
    class func RGB(r:CGFloat,_ g:CGFloat, _ b:CGFloat, _ alpha:CGFloat)->UIColor{
        
        
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: alpha)
    }
    
    
    
    
    convenience init(hex: Int) {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000ff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    
    
    

    
//    public convenience init(hex: String) {
//        
//        self.init(hex: hex, alpha: CGFloat(1.0))
//    }
//    
//    public convenience init(hex: String, alpha: CGFloat) {
//        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
//        
//        if (cString.hasPrefix("#")) {
//            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
//        }
//        
//        if (count(cString) != 6) {
//            
//            self.init(red: 0, green: 0, blue: 0, alpha: 0)
//        }
//        else {
//            
//            var rgbValue:UInt32 = 0
//            NSScanner(string: cString).scanHexInt(&rgbValue)
//            
//            self.init(
//                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//                alpha: alpha
//            )
//        }
//    }
//    
    
}


