//
//  NSURL.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation

extension NSURL {
    
    func URLByAppendingQueryString(queryString: String) -> NSURL {
        if queryString.utf16.count == 0 {
            return self
        }
        
        var absoluteURLString = self.absoluteString
        
        if absoluteURLString.hasSuffix("?") {
            absoluteURLString = (absoluteURLString as NSString).substringToIndex(absoluteURLString.utf16.count - 1)
        }
        
        let URLString = absoluteURLString + (absoluteURLString.rangeOfString("?") != nil ? "&" : "?") + queryString
        
        return NSURL(string: URLString)!
    }
    
    
    //MARK: - 包含http
    /// 包含http
    func isHttpLocalPath() -> Bool {
        return self.absoluteString.rangeOfString("http") == nil
    }
    
    
    
    func createDirectoryIfNecesserary() throws {
        if let path = path where !NSFileManager.defaultManager().fileExistsAtPath(path) {
            try NSFileManager.defaultManager().createDirectoryAtURL(self,
                withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    static func temporaryURL() -> NSURL{
        
        return try! NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.CachesDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true).URLByAppendingPathComponent(NSUUID().UUIDString)
    }
    
    static var documentsURL: NSURL{
        
        return try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
    }
    
    
}














