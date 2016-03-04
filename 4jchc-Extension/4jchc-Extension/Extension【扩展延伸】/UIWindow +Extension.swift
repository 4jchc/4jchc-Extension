

import Foundation
import UIKit
extension UIWindow{

    func switchRootViewController(){
        
        /// 设置根控制器
        let key:NSString = "CFBundleVersion"
        // 上一次的使用版本（存储在沙盒中的版本号）
        let lastVersion = NSUserDefaults.standardUserDefaults().objectForKey(key as String) as? String
        
        // 当前软件的版本号（从Info.plist中获得）
        let infoDict:NSDictionary = NSBundle.mainBundle().infoDictionary!
        
        let currentVersion = infoDict.objectForKey(key as String) as! String
        
        
        ////*****✅ 加class是类方法类方法无法使用self  所以改为实例方法
        if (currentVersion == lastVersion) { // 版本号相同：这次打开和上次打开的是同一个版本
            
           // self.rootViewController = HWTabBarViewController()
            
        } else { // 这次打开的版本和上一次不一样，显示新特性
            
            //self.rootViewController = HMNewfeatureViewController()
            // 将当前的版本号存进沙盒
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: key as String)
            
            NSUserDefaults.standardUserDefaults().synchronize()

        }
        
}

}
class BaseWindow : UIWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let orientation:UIInterfaceOrientation = UIApplication.sharedApplication().statusBarOrientation
        
        switch orientation {
        case .LandscapeLeft:
            fallthrough
        case .LandscapeRight:
            // LandscapeLeft | LandscapeRight
            self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.height, UIScreen.mainScreen().bounds.width)
        default:
            // Unknown | Portrait | PortraitUpsideDown
            self.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        }
        
        self.backgroundColor = UIColor.clearColor()
        self.windowLevel = UIWindowLevelAlert + 1
        
        self.makeKeyWindow()
        
        self.makeKeyAndVisible()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIWindow {
    /// EZSE: Creates and shows UIWindow. The size will show iPhone4 size until you add launch images with proper sizes. TODO: Add to readme
    convenience init(viewController: UIViewController, backgroundColor: UIColor) {
        self.init(frame: UIScreen.mainScreen().bounds)
        self.rootViewController = viewController
        self.backgroundColor = backgroundColor
        self.makeKeyAndVisible()
    }
}