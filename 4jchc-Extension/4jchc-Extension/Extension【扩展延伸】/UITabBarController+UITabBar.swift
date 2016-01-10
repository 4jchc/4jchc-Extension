

import Foundation
import UIKit
extension UITabBarController{
    
    ///  添加视图控制器
    ///
    ///  - parameter name:      sb name
    ///  - parameter title:     标题
    ///  - parameter imageName: 图像名称
    ///  - parameter highlight: 高亮名称
    //MARK: - UITabBarController+UITabBar封装
    //MARK:   💗添加子控制器
    func addchildController(name: String, _ title: String, _ imageName: String, _ highlight: String) {
        
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


    
}