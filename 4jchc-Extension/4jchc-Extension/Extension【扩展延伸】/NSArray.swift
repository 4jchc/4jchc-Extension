//
//  NSArray.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/18.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation

extension NSArray {
    
    
    func stringValue() -> NSString {
        var string = ""
        self.enumerateObjectsUsingBlock { (object:AnyObject!, index:Int, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
            if object is NSString || object is String {
                string += "," + ((object as! NSString) as String)
            }
        }
        return string.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: ","))
    }
    
    /**
     Flattens--弄平(使...无光泽,飞机拉平) a multidimensional--多面的,多维的 NSArray to a [AnyObject].
     
     :returns: Flattened--弄平(使...无光泽,飞机拉平) array
     */
    func flattenAnyObject() -> [AnyObject] {
        var result = [AnyObject]()
        
        for item in self {
            if let array = item as? NSArray {
                result += array.flattenAnyObject()
            } else {
                result.append(item)
            }
        }
        
        return result
    }
    //MARK: - 把嵌套数组夷为平地
    ///  把嵌套数组夷为平地
    func flattenedArray() -> NSArray {
        let array = NSMutableArray()
        
        for object : AnyObject in self {
            if object.isKindOfClass(NSArray) {
                array.addObjectsFromArray(object.flattenedArray() as [AnyObject])
            }
            else {
                array.addObject(object)
            }
        }
        
        return array
    }
    //MARK: - 唯一的--Array
    ///  唯一的--Array
    func uniquedArray() -> NSArray {
        return NSOrderedSet(array: self as [AnyObject]).array
    }
    
    //MARK: - 分类的;分选的--Array
    ///  分类的;分选的--Array
    func sortedArray() -> NSArray {
        return self.sortedArrayUsingSelector(Selector("compare"))
    }
    
    //MARK: - reverse-颠倒--Array
    ///  reverse-颠倒--Array
    func reversedArray() -> NSArray {
        return self.reverseObjectEnumerator().allObjects
    }
    
}

