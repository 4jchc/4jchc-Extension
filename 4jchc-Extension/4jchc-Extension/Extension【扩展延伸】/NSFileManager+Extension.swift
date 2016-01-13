//
//  NSFileManager.swift
//  WaveLabs
//
//  Created by Vlad Gorlov on 25.10.15.
//  Copyright © 2015 WaveLabs. All rights reserved.
//

import Foundation

public extension NSFileManager {

	public class var applicationDocumentsDirectory: NSURL {
		let urls = defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
		return urls[urls.count-1]
	}

	public func directoryExistsAtPath(path: String) -> Bool {
		let isDir = UnsafeMutablePointer<ObjCBool>.alloc(1)
		let isExists = fileExistsAtPath(path, isDirectory: isDir)
		return isExists && isDir.memory.boolValue
	}

	public func regularFileExistsAtPath(path: String) -> Bool {
		let isDir = UnsafeMutablePointer<ObjCBool>.alloc(1)
		let isExists = fileExistsAtPath(path, isDirectory: isDir)
		return isExists && !isDir.memory.boolValue
	}
    
    class func localDocumentsPath() -> String
    {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as String
    }
    
    
    ///  获取文件的大小
    ///
    ///  - parameter path: 文件完整路径
    ///
    ///  - returns: 文件的大小。如果失败，返回0
    public func j_fileSize(atPath path: String) ->Int {
        do {
            let attributes: NSDictionary = try NSFileManager.defaultManager().attributesOfItemAtPath(path)
            
            return Int(attributes.fileSize())
        } catch {
            return 0
        }
    }
}
