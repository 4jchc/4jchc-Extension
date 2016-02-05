//
//  PopoverPresentationController.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/29.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

/*
0.显示标题菜单
1.图片拉升单词:tiles平铺stretches伸长(展开,铺设;adj.弹性的)会填充屏幕
2.默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
如果自定义转场, 那么就不会移除以前控制器的view
3.自定义转场步奏
A1 .设置代理vc?.transitioningDelegate = self
A2 .设置转场的样式modalPresentationStyle.Custom
A3 .实现代理方法, 告诉系统谁来负责转场动画
presentationControllerForPresentedViewController
iOS8推出的专门用于负责转场动画的
*/

/*
1.完善菜单自定义动画
2.默认的锚点是(0.5,0.5)
3.自定义转场的动画
0.1一定要将视图添加到容器上transitionContext.containerView()?.addSubview(toView)
0.2动画执行完毕, 一定要告诉系统.如果不写, 可能导致一些未知错误
transitionContext.completeTransition(true)
*/


class PopoverPresentationController: UIPresentationController {
    
    /**
     初始化方法, 用于创建负责转场动画的对象
     
     :param: presentedViewController  被展现的控制器
     :param: presentingViewController 发起的控制器, Xocde6是nil, Xcode7是野指针
     
     :returns: 负责转场动画的对象
     */
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        
        print(presentedViewController)
        //        print(presentingViewController)
    }
    
    /**
     即将布局转场子视图时调用
     */
    override func containerViewWillLayoutSubviews()
    {
        // 1.修改弹出视图的大小
        //        containerView; // 容器视图
        //        presentedView() // 被展现的视图
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        
        // 2.在容器视图上添加一个蒙版, 插入到展现视图的下面
        // 因为展现视图和蒙版都在都一个视图上, 而后添加的会盖住先添加的
        containerView?.insertSubview(coverView, atIndex: 0)
    }
    
    // MARK: - 懒加载
    private lazy var coverView: UIView = {
        // 1.创建view
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.mainScreen().bounds
        
        // 2.添加监听
        let tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func close(){
        // presentedViewController拿到当前弹出的控制器
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}


/*
func titleBtnClick(btn: TitleButton)
{
// 1.修改箭头方向
btn.selected = !btn.selected

// 2.弹出菜单
let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
let vc = sb.instantiateInitialViewController()
// 2.1设置转场代理
// 默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
// 如果自定义转场, 那么就不会移除以前控制器的view
vc?.transitioningDelegate = self
// 2.2设置转场的样式
vc?.modalPresentationStyle = UIModalPresentationStyle.Custom

presentViewController(vc!, animated: true, completion: nil)

}
*/




/*
func titleBtnClick(btn: TitleButton)
{
// 1.修改箭头方向
btn.selected = !btn.selected

// 2.弹出菜单
let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
let vc = sb.instantiateInitialViewController()
// 2.1设置转场代理
// 默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
// 如果自定义转场, 那么就不会移除以前控制器的view
vc?.transitioningDelegate = self
// 2.2设置转场的样式
vc?.modalPresentationStyle = UIModalPresentationStyle.Custom

presentViewController(vc!, animated: true, completion: nil)

}

func leftItemClick()
{
print(__FUNCTION__)
}

func rightItemClick()
{
print(__FUNCTION__)
}

/// 记录当前是否是展开
var isPresent: Bool = false
}
//MARK: - UIViewControllerTransitioningDelegate
extension HomeTableViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning
{

// 实现代理方法, 告诉系统谁来负责转场动画
// UIPresentationController iOS8推出的专门用于负责转场动画的
func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
{
return PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
}

// MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西都需要程序员自己来实现
/**
告诉系统谁来负责Modal的展现动画

:param: presented  被展现视图
:param: presenting 发起的视图
:returns: 谁来负责
*/
func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
{
isPresent = true
return self
}

/**
告诉系统谁来负责Modal的消失动画

:param: dismissed 被关闭的视图

:returns: 谁来负责
*/
func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
{
isPresent = false
return self
}

// MARK: - UIViewControllerAnimatedTransitioning
/**
返回动画时长

:param: transitionContext 上下文, 里面保存了动画需要的所有参数

:returns: 动画时长
*/
func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
{
return 0.5
}

/**
告诉系统如何动画, 无论是展现还是消失都会调用这个方法

:param: transitionContext 上下文, 里面保存了动画需要的所有参数
*/
func animateTransition(transitionContext: UIViewControllerContextTransitioning)
{
// 1.拿到展现视图
/*
let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
// 通过打印发现需要修改的就是toVC上面的View
print(toVC)
print(fromVC)
*/
if isPresent
{
// 展开
print("展开")
let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
toView.transform = CGAffineTransformMakeScale(1.0, 0.0);

// 注意: 一定要将视图添加到容器上
transitionContext.containerView()?.addSubview(toView)

// 设置锚点
toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)

// 2.执行动画
UIView.animateWithDuration(0.5, animations: { () -> Void in
// 2.1清空transform
toView.transform = CGAffineTransformIdentity
}) { (_) -> Void in
// 2.2动画执行完毕, 一定要告诉系统
// 如果不写, 可能导致一些未知错误
transitionContext.completeTransition(true)
}
}else
{
// 关闭
print("关闭")
let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)

UIView.animateWithDuration(0.2, animations: { () -> Void in
// 注意:由于CGFloat是不准确的, 所以如果写0.0会没有动画
// 压扁
fromView?.transform = CGAffineTransformMakeScale(1.0, 0.000001)
}, completion: { (_) -> Void in
// 如果不写, 可能导致一些未知错误
transitionContext.completeTransition(true)
})
}
}
}
*/







