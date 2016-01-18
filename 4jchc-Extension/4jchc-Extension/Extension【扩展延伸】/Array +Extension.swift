//
//  Array.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/10.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit


extension Array {
    
    func indexOf<T: Equatable>(x: T) -> Int? {
        for i in 0...self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }
    
    /// 安全移除指定索引位置的元素.
    ///
    /// - parameter index 指定移除元素的索引
    ///
    /// - returns:  如果移除成功，返回被移除元素，否则返回nil
    public mutating func safeRemoveAtIndex(index: Int) ->Element? {
        if index < 0 || index >= self.count {
            return nil
        }
        
        return self.removeAtIndex(index)
    }
    
    /// 判断数组中是否包含某元素。
    ///
    /// - parameter object 遵守Equatable协议的元素
    ///
    /// - returns:  如果包含，返回true,否则返回false。
    public func isContain<T where T: Equatable>(object: T) ->Bool {
        let filterResults = self.filter { (element) -> Bool in
            if let e = element as? T {
                return e == object
            }
            
            return false
        }
        
        return filterResults.count > 0
    }
    
    ///  更安全地获取元素
    ///
    ///  - parameter index: 索引
    ///
    ///  - returns: 如果索引正确，返回对应的元素，否则返回nil
    public func safeElement(atIndex index: Int) ->Element? {
        if index < 0 || index > self.count {
            return nil
        }
        
        let array = self
        
        return array[index]
    }
}



extension Array {
    
    func toDictionary<Key: Hashable>(extractDictionaryId: (Element) -> (Key)) -> [Key: Element] {
        // prepare dict
        var dict = [Key: Element]()
        
        for item in self {
            let key = extractDictionaryId(item)
            dict[key] = item
        }
        return dict
    }
    
    mutating func removeObject<U: Equatable>(object: U) {
        let index = indexOfObject(object)
        
        if let uIndex = index {
            self.removeAtIndex(uIndex)
        }
    }
    
    func indexOfObject<U: Equatable>(object: U) -> Int? {
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    return idx
                }
            }
        }
        return nil
    }
}


extension Array {
    func pick(index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
    
    func pick(subRange: Range<Int>) -> ArraySlice<Element>? {
        if count == 0 {
            return nil
        }
        
        let cappedRange = max(subRange.startIndex, 0)..<min(subRange.endIndex - subRange.startIndex, count)
        
        return self[cappedRange]
    }
    
    func sample() -> Element? {
        let index = Int(arc4random_uniform(UInt32(count)))
        
        return self.pick(index)
    }
    
    func find(callback: (Element) -> Bool) -> Element? {
        for item in self {
            if callback(item) {
                return item
            }
        }
        
        return nil
    }
    
    mutating func prepend(newElement: Element) {
        insert(newElement, atIndex: 0)
    }
}
