//
//  CALayer.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/30.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

//import UIKit
//
//class CALayer: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    
//    
    /*
    private func setupIconImageCircle()
    {
    var path = UIBezierPath(ovalInRect: iconImageButton.bounds)
    
    var maskLayer = CAShapeLayer()
    maskLayer.path = path.CGPath
    iconImageButton.layer.mask = maskLayer
    
    var outlineLayer = CAShapeLayer()
    outlineLayer.lineWidth = 10.0
    outlineLayer.fillColor = UIColor.clearColor().CGColor
    outlineLayer.strokeColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0).CGColor
    outlineLayer.path = path.CGPath
    iconImageButton.layer.addSublayer(outlineLayer)
    }
    
    */





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
