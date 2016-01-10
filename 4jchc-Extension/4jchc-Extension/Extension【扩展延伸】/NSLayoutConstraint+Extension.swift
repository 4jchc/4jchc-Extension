//
//  NSLayoutConstraint.swift
//  WeChat
//
//  Created by 蒋进 on 15/12/22.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit


extension NSLayoutConstraint {
    //重写description.有错误会打印identifier
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
    
    
    func setAsSeparator() {
        self.constant = 1.0 / UIScreen.mainScreen().scale
    }
    
    class func constraintsToFillSuperview(view: UIView) -> [NSLayoutConstraint]{
        view.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[v]|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["v" : view])
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["v" : view])
        
        return constraints
    }
    //MARK: - 建立约束数组
    public class func constraintsWithVisualFormatArray(array: [String], metrics: [String: AnyObject]?, views: [String: AnyObject]) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        for rule in array {
            constraints.appendContentsOf(self.constraintsWithVisualFormat(rule,
                options: .DirectionLeadingToTrailing,
                metrics: metrics,
                views: views) )
        }
        
        return constraints
    }
    /// 建立约束数组
    ///
    /// - parameter formats: VLF 数组
    /// - parameter views:   views 字典
    ///
    /// - returns: 约束数组
    class func constraints(formats: [String], views: [String: AnyObject]) -> [NSLayoutConstraint] {
        
        var cons = [NSLayoutConstraint]()
        
        for format in formats {
            cons += NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        }
        
        return cons
    }
    
    class func constraints(views views: [NSObject : AnyObject], formats: String...) -> [AnyObject] {
        var constraints = [NSLayoutConstraint]()
        
        for format in formats {
            if format.hasPrefix("H:") {
                constraints += NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: views as! [String : AnyObject])
            } else {
                constraints += NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: views as! [String : AnyObject])
            }
        }
        
        return constraints
    }
    
    
    public func activate() {
        NSLayoutConstraint.activateConstraints([self])
    }
    
    public func deactivate() {
        NSLayoutConstraint.deactivateConstraints([self])
    }
    
    
    @available(iOS 8.0, *)
    func setMultiplier(multiplier:CGFloat) {
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        newConstraint.active = self.active
        
        NSLayoutConstraint.deactivateConstraints([self])
        NSLayoutConstraint.activateConstraints([newConstraint])
    }
    
    class func simpleConstrain(format: String, views vws: NSDictionary) -> [AnyObject] {
        
        return NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: vws as! [String : AnyObject])
    }
    
    
    class func constraintsWithVisualFormat(visualFormat: String, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: [], metrics: nil, views: views)
    }
    
    class func constraintsWithVisualFormat(visualFormat: String,  metrics: [String : AnyObject]?, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: [], metrics: metrics, views: views)
    }
    
    class func constraintsWithVisualFormat(visualFormat: String,  options: NSLayoutFormatOptions, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: options, metrics: nil, views: views)
    }
    
    

    
    

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
