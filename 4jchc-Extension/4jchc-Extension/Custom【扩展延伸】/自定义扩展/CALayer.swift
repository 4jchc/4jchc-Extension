//
//  CALayer.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/30.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

class CALayer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



// MARK: - CGAffineTransform案例
/*
总得来说，这个类中包含3张不同类型，分别使用如下3个方法创建数值；

1.CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)（平移:设置平移量）

2.CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)（缩放:设置缩放比例）仅通过设置缩放比例就可实现视图扑面而来和缩进频幕的效果。

3.CGAffineTransformMakeRotation(CGFloat angle)（旋转:设置旋转角度）

以上3个都是针对视图的原定最初位置的中心点为起始参照进行相应操作的，在操作结束之后可对设置量进行还原：

view.transform＝CGAffineTransformIdentity;



另外还可以通过CGAffineTransformTranslate等方法对现有的transform进行进一步处理；
*/
