//
//  NSBundle.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation

public extension NSBundle {
    public enum Errors: ErrorType {
        case MissedURLForResource(resourceName: String, resourceExtension: String)
    }
    public func URLForResource(resourceName: String, resourceExtension: String) throws -> NSURL {
   
        guard let url = URLForResource(resourceName, withExtension: resourceExtension) else {
            throw NSBundle.Errors.MissedURLForResource(resourceName: resourceName, resourceExtension: resourceExtension)
        }
        return url
    }
}


