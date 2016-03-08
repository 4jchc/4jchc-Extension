//
//  UIToolbar.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/3/8.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

public extension UIToolbar {
    
    public func setBarStyle(barStyle: UIBarStyle, animated: Bool) {
        if animated && self.barStyle != barStyle {
            let transition = CATransition()
            transition.duration = 0.2
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            layer.addAnimation(transition, forKey: nil)
        }
        self.barStyle = barStyle
    }
}