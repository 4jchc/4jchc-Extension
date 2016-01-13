

import UIKit

public extension Int {
    

    ///2位小数Decimal:十进的;n.小数
    public func toStringWithDecimalPlaces(decimals:Int) -> String {
        
        return String(format: "%.2f", self)
    }
    
    //MARK: - 保留几位小数
    /// 保留几位小数
    public func toNumberOfDecimal(decimals:Int) -> String {
        
        return String(format: "%.\(decimals)f", self)
    }
    
}