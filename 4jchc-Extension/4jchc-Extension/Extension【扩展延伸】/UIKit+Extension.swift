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
// 自定义的log
// 在 BuildSettting 中 搜索 other swift flags 添加一个 `-D DEBUG`

//         __FILE__
//__LINE__
//__FUNCTION__
func printLog<T>(
    message: T,
    file: String = __FILE__,
    line: Int = __LINE__,
    mthName: String = __FUNCTION__
    ) {
        #if DEBUG
            __LINE__
            print("\((file as NSString).lastPathComponent)[\(line)], \(mthName): \(message)")
        #endif
}


