//
//  NSMutableAttributedString.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import Foundation
import UIKit
extension NSMutableAttributedString{
    
    func setLineHeight(height:CGFloat){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight =  height
        paragraphStyle.maximumLineHeight =  height
        
        self.addAttribute(NSParagraphStyleAttributeName,
            value: paragraphStyle,
            range: NSMakeRange(0, self.string.characters.count))
    }
    
    func setFont(font:UIFont){
        self.addAttribute(NSFontAttributeName,
            value: font,
            range: NSMakeRange(0, self.string.characters.count))
    }
    
    func setColor(color:UIColor){
        self.addAttribute(NSForegroundColorAttributeName,
            value: color,
            range: NSMakeRange(0, self.string.characters.count))
    }
    //MARK: - 字距调整
    /// 字距调整
    func setKerning(kerning:Float){
        self.addAttribute(NSKernAttributeName, value: NSNumber(float:kerning), range: NSMakeRange(0, self.string.characters.count))
        
    }
    //MARK: - 下面画线
    /// 下面画线
    func setUnderline(style:NSUnderlineStyle){
        self.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(long:style.rawValue), range: NSMakeRange(0,self.string.characters.count))
    }
}
