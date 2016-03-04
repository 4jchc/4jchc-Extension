//
//  Animation.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/29.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit
// 动画案例
class Animation: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var view1:UIView = UIView()

    //MARK: - 360旋转动画
    private func startAnimation(){
        // 1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        
        // 该属性默认为YES, 代表动画只要执行完毕就移除
        anim.removedOnCompletion = false
        // 3.将动画添加到图层上
        view1.layer.addAnimation(anim, forKey: nil)
    }
    
    
    //MARK: - 开始动画=从上往下展开,结束动画=从下往上消失
    /// 记录当前是否是展开
    var isPresent: Bool = false

    
    private func startOverAnimation(){
        
        if isPresent{//开始=从上往下展开
            
            // 设置锚点anchor
            self.view1.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            // 2.执行动画
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                // 2.1清空transform改变 Identity.同一性(恒等式,本体)
                self.view1.transform = CGAffineTransformIdentity
            })
            
        }else{//结束=从下往上消失
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                // 注意:由于CGFloat是不准确的, 所以如果写0.0会没有动画
                // 压扁
                self.view1.transform = CGAffineTransformMakeScale(1.0, 0.000001)
            })
        }

        UIView.animateWithDuration(0.25) { () -> Void in
            self.view1.transform =  self.isPresent ? CGAffineTransformMakeScale(1.3, 1.3) :CGAffineTransformIdentity
            self.view1.transform =  self.isPresent ? CGAffineTransformMakeScale(1.3, 1.3) :CGAffineTransformIdentity
        }
    }
    
    
    
    //MARK: -  == 永久闪烁的动画 === opacity不透明CABasicACnimation
    func opacityForever_Animation(time:CGFloat)->CABasicAnimation{
        
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")//必须写opacity才行。
        
        animation.fromValue = NSNumber(float: 1.0)
        animation.toValue = Float(0.0) //这是透明度。
        animation.autoreverses = true
        animation.duration = Double(time);
        animation.repeatCount = MAXFLOAT;
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards;
        //animation.timingFunction=[CAMediaTimingFunctionfunctionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
        return animation;
        
    }

}



import UIKit
import QuartzCore

class HelperAnimation: NSObject {
    
    let logSwitch:Bool = false
    
    class func startPulse (view:UIView) {
        //println("[Animation] Pulse")
        let changeAlpha:CABasicAnimation = CABasicAnimation(keyPath:"opacity") as CABasicAnimation
        changeAlpha.fromValue = 0.3
        changeAlpha.toValue = 0.8
        changeAlpha.duration = 0.8
        changeAlpha.repeatCount = 999
        changeAlpha.autoreverses = true
        view.layer.addAnimation(changeAlpha, forKey: "ChangeAlpha")
        view.layer.speed = 1.0;
    }
    
    class func stopPulse (view:UIView) {
        //println("[Animation] Stop Pulse")
        view.layer.removeAllAnimations()
    }
    
    class func pulse (view:UIView, loops:Float) {
        //println("[Animation] Pulse")
        let changeAlpha:CABasicAnimation = CABasicAnimation(keyPath:"opacity") as CABasicAnimation
        changeAlpha.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        changeAlpha.fromValue = 0.15
        changeAlpha.toValue = 0.45
        changeAlpha.duration = 1.2
        changeAlpha.repeatCount = loops
        changeAlpha.autoreverses = true
        view.layer.addAnimation(changeAlpha, forKey: "ChangeAlpha")
        view.layer.speed = 1.0;
    }
    
}
