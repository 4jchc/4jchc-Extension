//
//  UIDevice.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation


extension UIDevice {
    
    class var isIPhone6Plus: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(736)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(736)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone6: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(667)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(667)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone5: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(568)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(568)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone: Bool {
        let result = UIDevice.currentDevice().userInterfaceIdiom == .Phone
        return result
    }
    
    class var isIPad: Bool {
        let result = UIDevice.currentDevice().userInterfaceIdiom == .Pad
        return result
    }
    class func isOS8() -> Bool {
        let systemVersion = UIDevice.currentDevice().systemVersion as NSString
        return systemVersion.doubleValue >= 8.0
    }
    //MARK:  current当前Orientation方位
    ///  current当前Orientation方位
    class func currentOrientation() -> UIDeviceOrientation {
        
        return UIDevice.currentDevice().orientation
    }
    //MARK:  is Portrait肖象 Or Flat平坦的
    ///  is Portrait肖象 Or Flat平坦的
    class func isPortraitOrFlat() -> Bool {
        
        return currentOrientation().isPortrait || currentOrientation().isFlat
    }
    
    /**
     获取当前设备的系统版本号.
     
     - Parameter N/A
     - Returns:CGFloat  系统版本号
     */
    class func systemVersion() -> CGFloat {
    
        return UIDevice.currentDevice().systemVersion.toCGFloat()
    }
    /**
     获取当前设备的uuid
     
     - Parameter N/A
     - Returns:String    返回设备的uuid
     */
    class func uuid() -> String {
        return (UIDevice.currentDevice().identifierForVendor?.UUIDString)!
    }
    
    //MARK:设备判断
    //MARK:说明：将当前设备分为3.5寸，4.0寸，4.7寸，5.5寸四种设备，并且3.5寸设备市面上只剩下iPhone4和iPhone4s，而且猜测苹果之后只会再出4.0寸，4.7寸，5.5寸这三种尺寸的设备，3.5寸的设备作为特殊设备，先保留,同时考虑现在也没有了低分辨率设备，所以也未将低分辨率设备考虑其中
    /**
    判断当前设备是否是iPhone
    
    - Parameter N/A
    - Returns:Bool    True或者False
    */
    class func iPhone() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom==UIUserInterfaceIdiom.Phone
    }
    /**
     判断当前设备是否是iPad
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func iPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom==UIUserInterfaceIdiom.Pad
    }
    /**
     判断当前设备是否是3.5寸,例如：iPhone 4,iPhone 4s
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func iPhoneOld() -> Bool {
        return CGSizeEqualToSize(CGSizeMake(640, 960), UIScreen.mainScreen().currentMode!.size)
    }
    /**
     判断当前设备是否是4寸设备,例如：iPhone 5,iPhone 5s
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func iPhoneMini() -> Bool {
        return CGSizeEqualToSize(CGSizeMake(640, 1136), UIScreen.mainScreen().currentMode!.size)
    }
    /**
     判断当前设备是否是4.7寸设备,例如：iPhone 6,iPhone 6s
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func iPhoneNormal() -> Bool {
        return CGSizeEqualToSize(CGSizeMake(750, 1334), UIScreen.mainScreen().currentMode!.size)
    }
    /**
     判断当前设备是否是5.5寸设备,例如：iPhone 6 Plus,iPhone 6s Plus,
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func iPhonePlus() -> Bool {
        return CGSizeEqualToSize(CGSizeMake(1242, 2208), UIScreen.mainScreen().currentMode!.size)
    }
    /**
     判断当前设备是否是高分辨率屏幕
     
     - Parameter N/A
     - Returns:Bool    True或者False
     */
    class func isRetina() -> Bool {
        return (UIScreen.mainScreen().scale>=2.0)
    }
    
    //MARK:设备屏幕的尺寸，宽，高
    /**
    获取设备屏幕的Frame
    
    - Parameter N/A
    - Returns:CGRect    屏幕的Frame
    */
    class func screenBounds() -> CGRect {
        return UIScreen.mainScreen().bounds
    }
    /**
     获取设备屏幕的Size
     
     - Parameter N/A
     - Returns:CGSize    屏幕的Size
     */
    class func screenSize() -> CGSize {
        return self.screenBounds().size
    }
    /**
     获取设备屏幕的宽
     
     - Parameter N/A
     - Returns:CGFloat    屏幕的宽度
     */
    class func screenWidth() -> CGFloat {
        return self.screenSize().width
    }
    /**
     获取设备屏幕的高
     
     - Parameter N/A
     - Returns:CGFloat    屏幕的高度
     */
    class func screenHeight() -> CGFloat {
        return self.screenSize().height
    }
}













