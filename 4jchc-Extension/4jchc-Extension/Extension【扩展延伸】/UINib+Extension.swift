//
//  UINib.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import UIKit

public extension UINib {
    
    public enum Errors: ErrorType {
        case UnableToFindInstanceOfType(String)
    }
    
    public convenience init(forClass: AnyClass) {
        let name = NSStringFromClass(forClass).componentsSeparatedByString(".").last!
        let bundle = NSBundle(forClass: forClass)
        self.init(nibName: name, bundle: bundle)
    }
    
    public func instantiateWithOwner<T>(ownerOrNil: AnyObject?, optionsOrNil: [NSObject : AnyObject]? = nil) throws -> T {
        let objects = instantiateWithOwner(ownerOrNil, options: optionsOrNil)
        for object in objects {
            if let resultObject = object as? T {
                return resultObject
            }
        }
        throw Errors.UnableToFindInstanceOfType(String(T))
    }
    
}
