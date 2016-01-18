

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
    
}


//MARK: - Int扩展
public extension Int {
    
    
    ///2位小数Decimal:十进的;n.小数
    public func toStringWithDecimalPlaces(decimals:Int) -> String {
        
        return String(format: "%.2f", self)
    }
    
    //MARK: 保留几位小数
    /// 保留几位小数
    public func toNumberOfDecimal(decimals:Int) -> String {
        
        return String(format: "%.\(decimals)f", self)
    }
    
}




//MARK: - CGFloat扩展
public extension CGFloat {
    public var floatValue: Float {
        return Float(self)
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






