

import UIKit

public extension Int {
    

    ///2位小数
    public func toStringWithDecimalPlaces(decimals:Int) -> String {
        
        return String(format: "%.2f", self)
    }
    
    
}