

import Foundation
import UIKit
extension UITabBarController{
    


    //MARK:  添加子控制器+UITabBar封装-UIStoryboard版
    /// 添加子控制器+UITabBar封装-UIStoryboard版
    func addchildSbVc(name: String, _ title: String, _ imageName: String, _ highlight: String) {
        
        let sb = UIStoryboard(name: name, bundle: nil)
        let vc = sb.instantiateInitialViewController() as! UINavigationController
        // 添加图标&文字
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: highlight)?.imageWithRenderingMode(.AlwaysOriginal)
        
        vc.title = title
        
        /// 设置文字颜色，在 UIKit 框架中，大概有 7~9 个头文件是以 NS 开头的，都是和文本相关的
        // NSAttributedString 中定义的文本属性，主要用在"图文混排"
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orangeColor()], forState: UIControlState.Selected)
        
        self.addChildViewController(vc)
    }

    //MARK:  添加子控制器+UITabBar封装-UIViewController版
    /// 添加子控制器+UITabBar封装-UIViewController版
    func addChildVc(title:String ,image:String, selectedImage:String,childVc:UIViewController){
        // 设置文字的样式
        let normalcolor = UIColor(red: 123/255.0, green: 123/255.0, blue: 123/255.0, alpha: 1.0)
        let selectedcolor = UIColor.orangeColor()
        // 设置子控制器的文字
        childVc.title = title  // 同时设置tabbar和navigationBar的文字
        // 设置tabbar的文字
        //        childVc.tabBarItem.title = title as String
        // 设置navigationBar的文字
        //        childVc.navigationItem.title = title as String
        childVc.tabBarItem.image = UIImage(named: image)
        // 声明：这张图片按照原始的样子显示出来，不要自动渲染成其他颜色（比如蓝色）
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        // 设置子控制器的文字和图片
        childVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: normalcolor], forState: UIControlState.Normal)
        childVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: selectedcolor], forState: UIControlState.Selected)
        ///view的颜色创建就会同时加载所有视图
        // childVc.view.backgroundColor = UIColor.random()
        
        //MARK: ✅ 先给外面传进来的小控制器 包装 一个导航控制器
        let nav:UINavigationController = UINavigationController(rootViewController: childVc)
        
        /// 添加为子控制器
        self.addChildViewController(nav)
        
    }
    
    
    //MARK: - 动态获取命名空间来加载子控制器
    
     //MARK: - 动态加载子控制器
     ///  动态加载子控制器
    private func addChildViewControllers() {
        
        // 从本地JSON加载控制器按钮图片
        // 1.获取json文件的路径
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        // 2.通过文件路径创建NSData
        if let jsonPath = path{
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do{
                // 有可能发生异常的代码放到这里
                // 3.序列化json数据 --> Array
                // try : 发生异常会跳到catch中继续执行
                // try! : 发生异常程序直接崩溃
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                //                print(dictArr)
                // 4.遍历数组, 动态创建控制器和设置数据
                // 在Swift中, 如果需要遍历一个数组, 必须明确数据的类型
                for dict in dictArr as! [[String: String]]
                {
                    // 报错的原因是因为addChildViewController参数必须有值, 但是字典的返回值是可选类型
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
                
            }catch
            {    //如果失败在正常加载按钮图片
                // 发生异常之后会执行的代码
                print(error)
                
                // 从本地创建控制器
                addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
                addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
                // 再添加一个占位控制器
                addChildViewController("NullViewController", title: "", imageName: "")
                addChildViewController("DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
                addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
            }
        }
        
    }
    

    //   private func addChildViewController(childController: UIViewController, title:String, imageName:String) {
    private func addChildViewController(childControllerName: String, title:String, imageName:String) {
        
        //MARK:  -1.动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        // 0.0将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! UIViewController.Type
        // 0.2.2通过class创建对象
        let vc = vcCls.init()
        
        // 0.1通过类创建一个对象
        
        
        // 1设置首页对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        vc.title = title
        
        // 2.给首页包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        // 3.将导航控制器添加到当前控制器上
        addChildViewController(nav)
        
    }
    
    
    
}