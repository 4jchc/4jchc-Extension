//
//  常量.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/18.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

//MARK: - 苹果尺寸判断

//MARK:-小写
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height


let Screen_Max_Length = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let Screen_Min_Length = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let Is_Iphone = UIDevice.currentDevice().userInterfaceIdiom == .Phone
let Is_Iphone_4_Or_Less =  IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let Is_Iphone_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let Is_Iphone_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let Is_Iphone_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

let Is_Ipad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

let Is_Retina = UIScreen.mainScreen().scale>=2.0 //&& UIScreen.mainScreen().respondsToSelector("scale")


//MARK:-大写

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)


let IS_IPHONE = UIDevice.currentDevice().userInterfaceIdiom == .Phone
let IS_IPHONE_4_OR_LESS =  IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

let IS_IPAD = UIDevice.currentDevice().userInterfaceIdiom == .Pad

let IS_RETINA = UIScreen.mainScreen().scale>=2.0 //&& UIScreen.mainScreen().respondsToSelector("scale")


let kFontSize = ((IS_IPAD) ? 40 : 14)


//MARK: - 微博常量

/// tabBar底部栏 颜色
let JDAppearanceTintColor = UIColor.orangeColor()

/// 用户账户本地存储文件名
let JDAccountNameLocal = "account.plist"

/// 沙盒 版本号
let JDSandboxVersionKey = "sandboxVersionKey"


//MARK: 闭包通知常量

/// 用户请求是否成功的 闭包
typealias JDSuccessedCallBack = (isSuccess: Bool) -> ()
public typealias ProgressHandler = (data: NSData) -> Void
/// 界面切换 给appDelegate的通知
let JDNotificationSwithInAppDelegate = "JDNotificationSwithInAppDelegate"



