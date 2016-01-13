//
//  NSObject.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/11.
//  Copyright © 2016年 sijichcai. All rights reserved.

//  NSObject+Extension.swift
//  swift_属性遍历


import Foundation

extension NSObject {
    
    /// 对象成员变量列表 - 计算型属性 - 运行时
    var propertyList: [String] {
        var properties = [String]()
        
        var count: UInt32 = 0
        let ivarList: UnsafeMutablePointer<Ivar> = class_copyIvarList(self.dynamicType, &count)
        
        for var i = 0; i < Int(count); i++ {
            let ivar = ivarList[i]
            let ivarName = NSString(UTF8String: ivar_getName(ivar)) as! String
            
            properties.append(ivarName)
        }
        
        return properties
    }
    
    ///  对象所有的属性描述 的计算型属性
    /// - 需要父类为NSObject
    /// - ViewModel需要遵守-CustomStringConvertible Protocal   使用另一种description 属性
    var descriptionWithPropertyList: String {
        get {
            return dictionaryWithValuesForKeys(propertyList).description
        }
    }
    
    /**
     # 文件归档
     
     - parameter coder:	编码器
     */
    func encode(coder: NSCoder) {
        let pL = propertyList
        for p in pL {
            coder.encodeObject(self.valueForKey(p), forKey: p)
        }
    }
    
    /**
     解码 归档文件
     
     - parameter coder: 解码器
     */
    func decode(coder: NSCoder) {
        let pL = propertyList
        for p in pL {
            if let value = coder.decodeObjectForKey(p) {
                self.setValue(value, forKey: p)
            }
        }
    }
    
//    public class func getClassName() -> String {
//        
//        return reflect(self).summary.componentsSeparatedByString(".").last!
//    }
    
    /// 延迟指定的时长后执行闭包
    ///
    /// - parameter delayTimeInterval 延迟多少秒
    /// - parameter completion 延迟到指定的秒数后回调的闭包
    public class func delay(delayTimeInterval: NSTimeInterval, completion: () ->Void) {
        let timeinterval = UInt64(delayTimeInterval) * NSEC_PER_SEC
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(timeinterval))
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            completion()
        }
    }
    
    
}
