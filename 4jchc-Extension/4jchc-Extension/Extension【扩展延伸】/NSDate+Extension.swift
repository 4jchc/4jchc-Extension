//
//  NSDate+Extension.swift
//  4j成才-微博
//
//  Created by 蒋进 on 15/11/30.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit


extension NSDate{
    
    /**
     *  判断某个时间是否为今年
     */
    func isThisYear()->Bool{
        let calendar: NSCalendar  = NSCalendar.currentCalendar()
        // 获得某个时间的年月日时分秒
        let dateCmps: NSDateComponents  = calendar.components(NSCalendarUnit.Year, fromDate:self.dynamicType.init())
       
        let nowCmps: NSDateComponents  = calendar.components(NSCalendarUnit.Year, fromDate: NSDate())

        return dateCmps.year == nowCmps.year;
    }
    
    /**
     *  判断某个时间是否为昨天
     */
    func isYesterday() ->Bool{
        var now: NSDate  = NSDate()
        
        // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
        // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
        let fmt: NSDateFormatter = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd";
        
        // 2014-04-30
        let dateStr: NSString  = fmt.stringFromDate(self)
        // 2014-10-18
        let nowStr: NSString  = fmt.stringFromDate(now)
 
        
        // 2014-10-30 00:00:00
        let date: NSDate = fmt.dateFromString(dateStr as String)!
        // 2014-10-18 00:00:00
        now = fmt.dateFromString(nowStr as String)!
        
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        
        let unit: NSCalendarUnit = [NSCalendarUnit.Year , NSCalendarUnit.Month , NSCalendarUnit.Day]

        let cmps: NSDateComponents  = calendar.components(unit, fromDate: date, toDate: now, options: NSCalendarOptions())
        

        return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
    }
    
    /**
     *  判断某个时间是否为今天
     */
    func isToday()->Bool
    {
        let now: NSDate  = NSDate()
        let fmt: NSDateFormatter  = NSDateFormatter()
        fmt.dateFormat = "yyyy-MM-dd";
        // 2014-04-30
        let dateStr: NSString  = fmt.stringFromDate(self)
        // 2014-10-18
        let nowStr: NSString  = fmt.stringFromDate(now)

        
        return dateStr.isEqualToString(nowStr as String)
    }
    
    
    public func isSameDayAsDate(date: NSDate) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let components: NSCalendarUnit = [.Month, .Day, .Year]
        
        let thisDate = calendar.components(components, fromDate: self)
        let otherDate = calendar.components(components, fromDate: date)
        
        return thisDate.month == otherDate.month &&
            thisDate.day == otherDate.day &&
            thisDate.year == otherDate.year
    }
    
    
    
    public class func dateFromString(dateString:String, format:String) -> NSDate{
        //var s = dateString.stringByReplacingOccurrencesOfString("\\", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil) as String
        //s = dateString.stringByReplacingOccurrencesOfString("T", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(dateString)!
    }
    
    public func toString(format:String?) -> String{
        let f = format != nil ? format : "dd/MM/yyyy HH:mm:ss"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = f
        return dateFormatter.stringFromDate(self)
    }
    
    public func toISOString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return dateFormatter.stringFromDate(self).stringByAppendingString("+00:00Z")
    }
    
    public class func dateFromISOString(string: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter.dateFromString(string)!
    }
    
    
}