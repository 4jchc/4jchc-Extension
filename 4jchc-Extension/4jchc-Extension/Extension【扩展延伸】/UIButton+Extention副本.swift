//import UIKit
//import Foundation
//
//extension UIButton {
//    
//    // 按钮默认背景色
//    class var defaultBackgroundColor : UIColor {
//        
//        get {
//            
//            return ColorHelper.hexStringToUIColor("#63B8FF")
//        }
//    }
//    Command /Applications/Xcode-7.1.1.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc failed with exit code 1
//    // 按钮不可用默认颜色
//    class var enabledBackgroundColor : UIColor {
//        
//        get {
//            
//            return UIColor.lightGrayColor()
//        }
//    }
//    
//    // 按钮Border默认颜色
//    class var defaultBorderColor : UIColor {
//        
//        get {
//            
//            return ColorHelper.hexStringToUIColor("#E7E7E7")
//        }
//    }
//    
//    func loginBorderStyle() {
//        
//        self.layer.borderColor = UIButton.defaultBorderColor.CGColor
//        self.layer.borderWidth = 1.0
//        self.backgroundColor = UIButton.defaultBackgroundColor
//        self.layer.cornerRadius = 5
//        self.layer.masksToBounds = true
//    }
//    
//    func loginNoBorderStyle() {
//        
//        self.backgroundColor = UIButton.defaultBackgroundColor
//        self.layer.cornerRadius = 5
//        self.layer.masksToBounds = true
//    }
//    
//    
//}