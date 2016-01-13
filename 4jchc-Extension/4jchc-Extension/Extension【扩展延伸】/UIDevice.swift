//
//  UIDevice.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation


extension UIDevice {
    
    class var isIPhone6Plus: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(736)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(736)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone6: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(667)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(667)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone5: Bool {
        let screenSize = UIScreen.mainScreen().bounds.size
        let result =
        fabs(Double(screenSize.height) - Double(568)) < DBL_EPSILON ||
            fabs(Double(screenSize.width) - Double(568)) < DBL_EPSILON
        
        return result
    }
    
    class var isIPhone: Bool {
        let result = UIDevice.currentDevice().userInterfaceIdiom == .Phone
        return result
    }
    
    class var isIPad: Bool {
        let result = UIDevice.currentDevice().userInterfaceIdiom == .Pad
        return result
    }
}