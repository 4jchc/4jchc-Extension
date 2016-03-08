//
//  2.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/3/7.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation

extension NSTimeInterval{
    
    public static func random() -> NSTimeInterval {
        return NSTimeInterval(arc4random()) / 0xFFFFFFFF
    }
    
    public static func random(min minimum: NSTimeInterval, max maximum: NSTimeInterval) -> NSTimeInterval {
        return NSTimeInterval.random() * (maximum - minimum) + minimum
    }
}
extension NSTimeInterval {
    
    static func days(number: Int) -> NSTimeInterval {
        return NSTimeInterval(number) * 60 * 60 * 24
    }
    //MARK: -  将秒转换为指定格式的字符串MM:ss
    func stringWithTimeInterval()->String?{
        
        let m: Int  = Int(self) / 60;
        let s: Int = Int(self) % 60;
        return NSString(format: "%02d: %02d",  m , s) as String
    }
}