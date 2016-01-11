//
//  UIKit.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 15/12/26.
//  Copyright © 2015年 sijichcai. All rights reserved.
//
//import Foundation
import UIKit

///弧度
func radians(degrees:CGFloat) ->CGFloat {
    
    return ( degrees * 3.14159265 ) / 180.0;
    
}

/// tabBar底部栏 颜色
let JDAppearanceTintColor = UIColor.orangeColor()

/// 用户账户本地存储文件名
let JDAccountNameLocal = "account.plist"

/// 沙盒 版本号
let JDSandboxVersionKey = "sandboxVersionKey"

/// 用户请求是否成功的 闭包
typealias JDSuccessedCallBack = (isSuccess: Bool) -> ()

/// 界面切换 给appDelegate的通知
let JDNotificationSwithInAppDelegate = "JDNotificationSwithInAppDelegate"






///  延迟在主线程执行函数
///
/// - parameter delta:    延迟时间
/// - parameter callFunc: 要执行的闭包方法
func delay(delta: Double, callFunc: ()->()) {
    
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, Int64(delta * Double(NSEC_PER_SEC))),
        dispatch_get_main_queue()) {
            
            callFunc()
    }
}



/// 自定义的log
/// 在 BuildSettting 中 搜索 other swift flags 里DEBUG项 而不是在主的列表添加,那样release也添加了 `-D DEBUG`

/**
DEBUG下打印函数
 
 - parameter message: 需要输入的信息
 - parameter file:    文件名
 - parameter method:  调用print的方法
 - parameter line:    打印函数 所在的行号
 */

func printLog<T>(message: T,
    file: String = __FILE__,
    method: String = __FUNCTION__,
    line: Int = __LINE__)
{
    #if DEBUG
        __LINE__
        print("\((file as NSString).lastPathComponent)[\(line)行], \(method): \(message)")
    #else
        //print("\(message)")
    #endif

}




