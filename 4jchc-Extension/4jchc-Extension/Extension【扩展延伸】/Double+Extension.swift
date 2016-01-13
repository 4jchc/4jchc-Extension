

import UIKit

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

    //MARK: - 保留几位小数
    /// 保留几位小数
    public func toNumberOfDecimal(decimals:Int) -> String {
        
        return String(format: "%.\(decimals)f", self)
    }
    
}