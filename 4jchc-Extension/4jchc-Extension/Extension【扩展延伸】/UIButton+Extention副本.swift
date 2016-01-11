


import UIKit

extension UIButton {
    
    /**
     便利构造函数
     
     - parameter imageName:       图片名称
     - parameter backgroundImageName: 背景图片名称
     
     - returns: Button (图片-背景图片)
     */
    convenience init(Nor_Hig_Name: String, Nor_Hig_BG_Name: String){
        self.init()
        
        setImage(UIImage(named: Nor_Hig_Name), forState: UIControlState.Normal)
        setImage(UIImage(named: Nor_Hig_Name + "_highlighted"), forState: UIControlState.Highlighted)
        setBackgroundImage(UIImage(named: Nor_Hig_BG_Name), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: Nor_Hig_BG_Name + "_highlighted"), forState: UIControlState.Highlighted)
        
        //根据图片 自动适应大小
        sizeToFit()
    }
    
    /**
     设置Button背景图片 便利构造函数
     
     - parameter title:      标题
     - parameter titleColor: 标题颜色
     - parameter backgroundImageName: 背景图片名称
     
     - returns:  Button(标题-背景图片)
     */
    convenience init(title: String, titleColor:UIColor, backgroundImageName:String) {
        self.init()
        
        setTitle(title, forState: .Normal)
        setTitleColor(titleColor, forState: .Normal)
        setBackgroundImage(UIImage(named: backgroundImageName), forState: .Normal)
        
    }
    
    /**
     设置Button图片 便利构造函数
     
     - parameter title:      标题
     - parameter titleColor: 标题颜色
     - parameter fontSize:   标题字体大小
     - parameter ImageName:  图片名称
     
     - returns: Button(标题-图片)
     */
    convenience init(title: String, titleColor:UIColor,fontSize: CGFloat, ImageName:String) {
        self.init()
        
        setTitle(title, forState: .Normal)
        setTitleColor(titleColor, forState: .Normal)
        setImage(UIImage(named: ImageName), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
    
}














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