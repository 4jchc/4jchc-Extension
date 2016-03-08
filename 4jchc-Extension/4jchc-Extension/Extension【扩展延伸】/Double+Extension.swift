

import UIKit


//MARK: - Double扩展
public extension Double {
    
    public func isWholeNumber() -> Bool {
        if Double(Int(self)) == self {
            return true
        }
        return false
    }
    ///2位小数
    public func toStringWithDecimalPlaces(decimals:Int) -> String {
        
        return String(format: "%.2f", self)
    }
    
    //MARK: 保留几位小数
    /// 保留几位小数
    public func toNumberOfDecimal(decimals:Int) -> String {
        
        return String(format: "%.\(decimals)f", self)
    }
    //MARK:  round圆的To Places位数
    ///  round圆的To Places位数
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
    
}


//MARK: - Int扩展
public extension Int {
    
    
    
    //MARK:  2位小数Decimal:十进的;n.小数-->字符串String
    ///  2位小数Decimal:十进的;n.小数-->字符串String
    public func toStringWithDecimalPlaces(decimals:Int) -> String {
        
        return String(format: "%.2f", self)
    }
    
    //MARK: 保留几位小数-->字符串String
    /// 保留几位小数-->字符串String
    public func toNumberOfDecimal(decimals:Int) -> String {
        
        return String(format: "%.\(decimals)f", self)
    }
    //MARK:  一个范围的随机数
    ///  一个范围的随机数
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.startIndex < 0 {
            offset = abs(range.startIndex)
        }
        
        let mini = UInt32(range.startIndex + offset)
        let maxi = UInt32(range.endIndex   + offset)
        
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
    

    
}

extension Int {
    
    //MARK:  Even偶数
    ///  Even偶数
    var isEven: Bool     {
        return (self % 2 == 0)
    }
    //MARK:  is Odd奇数的
    ///  is Odd奇数的
    var isOdd:  Bool     {return (self % 2 != 0)}
    //MARK:  is Positive正的正数
    ///  is Positive正的
    var isPositive: Bool {return (self >= 0)}
    //MARK:  is Negative否定负数
    ///  is Negative否定负数
    var isNegative: Bool {return (self < 0)}
    //MARK:  double双点数Value
    ///  double双点数Value
    var doubleValue: Double {return Double(self)}
    //MARK:  float浮点数 Value
    ///  float浮点数 Value
    var floatValue:  Float  {return Float(self)}
}
public extension Int {
    
    /** 毫秒 */
    public var milliseconds: NSTimeInterval { return NSTimeInterval(self) * 0.001 }
    public var millisecond: NSTimeInterval { return self.milliseconds }
    
    public var seconds: NSTimeInterval { return NSTimeInterval(self) * 1.milliseconds * 1000 }
    public var second: NSTimeInterval { return self.seconds }
    
    public var minutes: NSTimeInterval { return NSTimeInterval(self) * 60.seconds }
    public var minute: NSTimeInterval { return self.minutes }
    
    public var hours: NSTimeInterval { return NSTimeInterval(self) * 60.minutes }
    public var hour: NSTimeInterval { return self.hours }
    
    public var days: NSTimeInterval { return NSTimeInterval(self) * 24.hours }
    public var day: NSTimeInterval { return self.days }
    
    public var years: NSTimeInterval { return NSTimeInterval(self) * 365.days }
    public var year: NSTimeInterval { return self.years }
    
    public var weeks: NSTimeInterval {return NSTimeInterval(self * 86400 * 7)}
    public var week: NSTimeInterval {return self.weeks}
    
}

//MARK: - CGFloat扩展
public extension CGFloat {
    
    public var floatValue: Float {
        return Float(self)
    }
}
extension CGFloat
{
    public static func random() -> CGFloat {
        return CGFloat(arc4random() / 0xFFFFFFFF)
    }
    
    public static func random(min minimum: CGFloat, max maximum: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}

//MARK: - Bool扩展
extension Bool {
    
    static func random() -> Bool {
        let randomInt = Int.random(0...1)
        return randomInt != 0
    }
}



//MARK: - import CoreGraphics扩展
import CoreGraphics

// swiftlint:disable variable_name
public protocol CGFloatConvertible {
    var CGFloatValue: CGFloat { get }
}

extension Float: CGFloatConvertible {
    public var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}

extension Double: CGFloatConvertible {
    public var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}

extension Int: CGFloatConvertible {
    public var CGFloatValue: CGFloat {
        return CGFloat(self)
    }
}






