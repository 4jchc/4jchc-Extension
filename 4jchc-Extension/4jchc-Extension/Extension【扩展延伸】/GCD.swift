//
//  GCD.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit
import Foundation

//MARK: - Thread
class Thread: NSObject {
    
    private static let queue = dispatch_queue_create("serial-worker", DISPATCH_QUEUE_SERIAL)
    // dispatch_ async
    class func run(block:()->(), completion:(()->())? = nil) {
        dispatch_async(Thread.queue) {
            block()
            if let c = completion {
                dispatch_async(dispatch_get_main_queue(), c)
            }
        }
    }
    
    class func run<T>(block:()->T, completion:(result:T)->()) {
        dispatch_async(Thread.queue) {
            let result = block()
            dispatch_async(dispatch_get_main_queue(), {
                completion(result: result)
            })
        }
    }
    
}
extension NSObject {
    // async calls
    
    func doInBackground(block:() -> Void) {
        let queue = dispatch_queue_create(self.description, DISPATCH_QUEUE_SERIAL)
        dispatch_async(queue, {
            block()
        })
    }
    
    func doInMainground(block:() -> Void) {
        dispatch_async(dispatch_get_main_queue(), {
            block()
        })
    }
}




//let queue = dispatch_queue_create("workQueue", DISPATCH_QUEUE_CONCURRENT);
//let group = dispatch_group_create();
//
//for count in 0 ..< 100 {
//    dispatch_group_async(group, queue, {() in
//
//
//    });
//}
//
//dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//
//print(" items were backed up");


func GCDDispatchMain(closure:()->())
{
    dispatch_async(dispatch_get_main_queue(), closure)
}

func GCDDispatchAsyncHigh(closure: ()->())
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), closure)
}

func GCDDispatchAsyncDefault(closure: ()->())
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), closure)
}

func GCDDispatchAsyncLow(closure: ()->())
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), closure)
}

func GCDDispatchAsyncBackground(closure: ()->())
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), closure)
}



public class Downloader : NSObject{
    private let operation: NSOperation
    
    public init(operation:NSOperation)
    {
        self.operation = operation
    }
    
    public convenience init(imageAtUrl imageUrl:NSURL, completion: ((image:UIImage?,error:NSError?)->())?)
    {
        let newOperation = NSBlockOperation()
        newOperation.addExecutionBlock { () -> Void in
//            ImageManager.getImageSynchronously(imageUrl, cancelableOperation:newOperation) { (image, error) -> () in
//                if let callback = completion
//                {
//                    callback(image: image, error: error)
//                }
//            }
        }
        self.init(operation: newOperation)
    }
    
    public func cancel()
    {
        if !operation.cancelled
        {
            operation.cancel()
        }
    }
    
    public func start()
    {
        let blockOperation = operation
        if blockOperation.ready
        {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                blockOperation.start()
            }
        }
    }
    
}








