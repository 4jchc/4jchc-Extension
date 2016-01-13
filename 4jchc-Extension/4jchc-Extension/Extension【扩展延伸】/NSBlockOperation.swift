//
//  NSBlockOperation.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit


import Foundation

extension NSBlockOperation {
    
    class func operationWithAsyncBlock(asyncBlock: (finish: () -> Void) -> Void) -> NSBlockOperation {
        let operation = NSBlockOperation()
        operation.addExecutionAsyncBlock(asyncBlock)
        return operation
    }
    
    func addExecutionAsyncBlock(asyncBlock: (finish: () -> Void) -> Void) {
        let semaphore = dispatch_semaphore_create(0)
        addExecutionBlock {
            asyncBlock {
                dispatch_semaphore_signal(semaphore)
            }
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        }
    }
    
}

extension NSOperationQueue {
    
    func addOperationWithAsyncBlock(asyncBlock: (finish: () -> Void) -> Void) {
        addOperation(NSBlockOperation.operationWithAsyncBlock(asyncBlock))
    }
    
}