//
//  UINavigationController.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/2/16.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit


class HMNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    // 当第一次使用这个类的时候会调用一次
    override class func initialize(){
        
        let bar:UINavigationBar = UINavigationBar.appearance()
        bar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置naviBar背景图片--全局有效
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
        //设置title的字体
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont.systemFontOfSize(20)]
        
        //设置naviBar背景图片
        navigationBar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
        
        self.interactivePopGestureRecognizer?.delegate = self
        // bug: 如果在根控制器按住边缘向右滑,再次 push 新控制器的话,push 失败
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let view: UIViewController = segue.destinationViewController as UIViewController
        view.hidesBottomBarWhenPushed = true
        
    }
    // 更改左上角的返回按钮
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        
        // 如果当前导航控制器里面有1个子控制器,那么执行到这个地方的时候,就代表
        // 将要push进来第2个,把 push 进来 的控制器的左边按钮改成第一个控制器的title
        
        // 判断内部如果已经存在过控制器,才执行逻辑
        if childViewControllers.count != 0 {
            var title: String = "返回"
            
            // 如果当前导航控制器里面有1个子控制器,那么做特殊处理
            if childViewControllers.count == 1 {
                // push 第2个
                title = childViewControllers.first!.title ?? title
            }
            
            // 判断如果当前push进来的是rootviewcontroller,就不设置
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.ItemWithBarButtonItemBackTitle("返回", image: "navigationButtonReturn", target: self, action: "back")
            
            
            // 隐藏底部 tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    
    @objc private func back(){
        popViewControllerAnimated(true)
    }
    
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        printLog("哈哈")
        // 判断,如果是根控制器,就不要识别这个手势
        //        if childViewControllers.count == 1 {
        //            return false
        //        }
        //        return true
        
        return childViewControllers.count != 1
    }
}