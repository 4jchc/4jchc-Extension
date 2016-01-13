//
//  NSDateFormatter.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation

// singletons
private var _singletonFormatters = [String: NSDateFormatter]()
private let _lockQueue = dispatch_queue_create("com.teamua.FormattersQueue", DISPATCH_QUEUE_SERIAL)

public let CONSOLE_DATE_FORMAT = "yy-MM-dd HH:mm:ss.sss"
public let ISO_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
public let FULL_DATE_FORMAT = "d MMMM yyyy"
public let SHORTEN_DATE_FORMAT = "d MMMM"


extension NSDateFormatter {
    
    convenience init(dateFormat: String) {
        self.init()
        
        self.dateFormat = dateFormat
    }
    
    class func sharedDateFormatterWithFormat(format: String) -> NSDateFormatter {
        // we need to dispatch new queue where fetch/add of formatters
        // to avoid BAD_ACCESS risk
        var formatter: NSDateFormatter?
        
        dispatch_sync(_lockQueue) {
            if (_singletonFormatters[format] != nil) {
                formatter = _singletonFormatters[format]!
            }
            else {
                formatter = NSDateFormatter(dateFormat: format)
                formatter!.locale = NSLocale(localeIdentifier: NSLocale.preferredLanguages()[0] )
                _singletonFormatters[format] = formatter
            }
        }
        
        return formatter!
    }
}