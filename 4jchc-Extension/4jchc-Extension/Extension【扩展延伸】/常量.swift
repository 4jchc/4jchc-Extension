//
//  常量.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/18.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit


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


