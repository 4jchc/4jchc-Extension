//
//  NSOperationQueue.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation


public extension NSOperationQueue {
    
    public class func addMainQueOperation(block: () -> Void) {
        mainQueue().addOperationWithBlock(block)
    }
}

    public func doInMainQueue(block: () -> Void) {
        
        NSOperationQueue.mainQueue().addOperationWithBlock(block)
}