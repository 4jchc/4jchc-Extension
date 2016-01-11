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
    
    
   
    
    //MARK: - 新增2
    class func dateWithStr(time: String) ->NSDate {
        
        // 1.将服务器返回给我们的时间字符串转换为NSDate
        // 1.1.创建formatter
        let formatter = NSDateFormatter()
        // 1.2.设置时间的格式
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        // 1.3设置时间的区域(真机必须设置, 否则可能不能转换成功)
        formatter.locale = NSLocale(localeIdentifier: "en")
        // 1.4转换字符串, 转换好的时间是去除时区的时间
        let createdDate = formatter.dateFromString(time)!
        
        return createdDate
    }
    
    /**
     刚刚(一分钟内)
     X分钟前(一小时内)
     X小时前(当天)
     昨天 HH:mm(昨天)
     MM-dd HH:mm(一年内)
     yyyy-MM-dd HH:mm(更早期)
     */
    var descriptionDate:String{
        
        let calendar = NSCalendar.currentCalendar()
        
        // 1.判断是否是今天
        if calendar.isDateInToday(self)
        {
            // 1.0获取当前时间和系统时间之间的差距(秒数)
            let since = Int(NSDate().timeIntervalSinceDate(self))
            // 1.1是否是刚刚
            if since < 60
            {
                return "刚刚"
            }
            // 1.2多少分钟以前
            if since < 60 * 60
            {
                return "\(since/60)分钟前"
            }
            
            // 1.3多少小时以前
            return "\(since / (60 * 60))小时前"
        }
        
        // 2.判断是否是昨天
        var formatterStr = "HH:mm"
        if calendar.isDateInYesterday(self)
        {
            // 昨天: HH:mm
            formatterStr =  "昨天:" +  formatterStr
        }else
        {
            // 3.处理一年以内
            formatterStr = "MM-dd " + formatterStr
            
            // 4.处理更早时间
            let comps = calendar.components(NSCalendarUnit.Year, fromDate: self, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
            if comps.year >= 1
            {
                formatterStr = "yyyy-" + formatterStr
            }
        }
        
        // 5.按照指定的格式将时间转换为字符串
        // 5.1.创建formatter
        let formatter = NSDateFormatter()
        // 5.2.设置时间的格式
        formatter.dateFormat = formatterStr
        // 5.3设置时间的区域(真机必须设置, 否则可能不能转换成功)
        formatter.locale = NSLocale(localeIdentifier: "en")
        // 5.4格式化
        
        return formatter.stringFromDate(self)
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