//
//  UIStoryboard.swift
//  WeChat
//
//  Created by 蒋进 on 15/12/23.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit
extension UIStoryboard{
    

    ///1.显示Storybaord的第一个控制器到窗口
   static func showInitialVCWithName(name:String){
        
        let storyboard = UIStoryboard(name: name, bundle: nil)
        UIApplication.sharedApplication().keyWindow!.rootViewController = storyboard.instantiateInitialViewController()
    }
    
   static func initialVCWithName(name:String)->UIViewController{
        
        let storyboard = UIStoryboard(name: name, bundle: nil)

        return storyboard.instantiateInitialViewController()!
    }
    
    

    
    ///💗*************************
    
    class func searchStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Search", bundle: nil)
    }
    
    class func addPhotoStoryboard() -> UIStoryboard {
        return UIStoryboard(name:"AddPhoto", bundle:nil)
    }
    
    class func loginStoryboard() -> UIStoryboard {
        return UIStoryboard(name:"Login", bundle:nil)
    }
    public class func defaultStoryboard() -> UIStoryboard {
        
        return self.mainBundleStoryboard("Main")
    }
    
    public class func mainBundleStoryboard(name: String) -> UIStoryboard {
        
        return UIStoryboard(name: name, bundle: NSBundle.mainBundle())
    }
    
    //MARK: - //判断面板适合ipad或者iPhone
    class func storyboardForCurrentUserInterfaceIdiom() -> UIStoryboard {
        let device = UIDevice.currentDevice().userInterfaceIdiom
        switch device {
        case .Phone:
            return UIStoryboard(name: "Main_iPhone", bundle: nil)
        case .Pad:
            return UIStoryboard(name: "Main_iPad", bundle: nil)
        case .Unspecified:
            return UIStoryboard(name: "Main_iPhone", bundle: nil)
        default:
            break
        }
        return UIStoryboard(name: "Main_iPhone", bundle: nil)
    }
    //MARK: - 单例
    class func mainStoryboard() -> UIStoryboard {
        struct Singleton {
            static let instance = UIStoryboard(name: "Main", bundle: nil)
        }
        
        return Singleton.instance
    }
    //MARK: - 从面板加载控制器
    class func initialTableViewControllerFromStoryboardNamed(name:String)() -> UIViewController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController() as! UITableViewController
    }
    
    class func initialViewControllerFromStoryboardNamed(name:String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController()! as UIViewController
    }
}
