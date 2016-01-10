

import Foundation
import UIKit

class WBLog{
    static func Log(message:String){
        
       // #if DEBUG
            print("\(__FUNCTION__) \(__LINE__)\n\(message)")
       // #endif
    }
    
    static func Log(format: String, args: CVarArgType){
        #if DEBUG
            NSLog(format, args)
        
        #endif
    }
    
//    static func debugLog<T>(@autoclosure v:()->T) {
//        
//        print("\(v())")
//    }


}


/**
 `println` «wrapper» that will only print to console
 when `-D DEBUG` is set on `Other Swift Flags`.
 */
//func fprint(object: Any) {
//    #if DEBUG
//        Swift.print(object, terminator: "\n")
//    #endif
//}


//public func print(value:Any...){
//    #if DEBUG
//        var message = ""
//        for element in value {
//            var eachMessage = "\(element)"
//            let pattern = "Optional\\((.+)\\)"
//            eachMessage = eachMessage
//                .stringByReplacingOccurrencesOfString(pattern,
//                    withString:"$1",
//                    options:.RegularExpressionSearch,
//                    range: nil)
//            message += eachMessage
//        }
//        Swift.print(message)
//    #endif
//}








