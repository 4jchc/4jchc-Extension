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


extension NSFileManager {
    func URLForDirectory(directory: NSSearchPathDirectory, withPathComponent pathComponent: String, isDirectory: Bool = false) -> NSURL {
        if let documentURL = URLsForDirectory(directory, inDomains: .UserDomainMask).last {
            return documentURL.URLByAppendingPathComponent(pathComponent)
        }
        
        return NSURL()
    }
    
    func URLForPrivateDocumentsDirectory() -> NSURL {
        let url = URLForDirectory(.LibraryDirectory, withPathComponent: "Private Documents", isDirectory: true)
        var error: NSError?
        
        do {
            // Create directory if it doesn't exist
            try createDirectoryAtURL(url, withIntermediateDirectories: true, attributes: nil)
        } catch let error1 as NSError {
            error = error1
        }
        
        if error != nil {
            fatalError("Failed to create Private Documents directory in Library Directory")
        }
        
        return url
    }
}

/*
//写入数据Documents目录
- (BOOL)writeApplicationData:(NSData *)data toFile:(NSString *)fileName {

NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *docDir = [paths objectAtIndex:0];
if (!docDir) {
NSLog(@"Documents directory not found!");
return NO;
}
NSString *filePath = [docDir stringByAppendingPathComponent:fileName];
return [data writeToFile:filePath atomically:YES];
}

//读取数据Documents目录
- (NSData *)applicationDataFromFile:(NSString *)fileName {
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *docDir = [paths objectAtIndex:0];
NSString *filePath = [docDir stringByAppendingPathComponent:fileName];
NSData *data = [[[NSData alloc] initWithContentsOfFile:filePath] autorelease];
return data;
}
*/





