//
//  NSString+Emoji.swift
//  WeiBo
//
//  Created by 叶锋雷 on 15/10/8.
//  Copyright © 2015年 叶锋雷. All rights reserved.
//

import Foundation
import UIKit

extension NSString{
    
    //MARK: - emoji字符
    ///  将十六进制的编码转为emoji字符
    ///
    ///  - parameter intCode: 十六进制的编码
    ///
    ///  - returns: emoji字符
    static func emojiWithIntCode(intCode:Int)->NSString{
        var symbol:Int=EmojiCodeToSymbol(intCode)
        var str=NSString(bytes: &symbol, length: sizeofValue(symbol), encoding: NSUTF8StringEncoding)
        if(str == nil){
            // 新版Emoji
            str=NSString(format: "%C", intCode)
        }
        str = str?.stringByReplacingOccurrencesOfString("\0", withString: "")
        return str!
    }
    //MARK:  将十六进制的编码转为emoji字符
    ///  将十六进制的编码转为emoji字符
    ///
    ///  - parameter stringCode: 十六进制的编码
    ///
    ///  - returns:emoji字符
    static func emojiWithStringCode(stringCode:NSString)->NSString{
        let charCode=stringCode.UTF8String
        let intCode=strtol(charCode, nil, 16)
        return self.emojiWithIntCode(intCode)
    }
    
    func emoji()->NSString{
        return NSString.emojiWithStringCode(self)
    }
    
    static func EmojiCodeToSymbol(c:Int)->Int{
        let num=NSNumber(unsignedInt: 0x808080F0).integerValue
        return ((((num | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)
    }
    
  
    //MARK: 判断是否是emoji表情
    /// 判断是否是emoji表情
    var isEmoji:Bool{
        var returnValue=false
        
        let hs:unichar = self.characterAtIndex(0)
        // surrogate pair
        if(0xd800 <= hs && hs <= 0xdbff){
            if(self.length>1){
                let ls:unichar = self.characterAtIndex(1)
                let a = hs - 0xd800
                let uc:Int = NSNumber(unsignedShort: a * 0x400).integerValue + NSNumber(unsignedShort: ls - 0xdc00).integerValue + 0x10000
                if(0x1d000 <= uc && uc <= 0x1f77f){
                    returnValue=true
                }
            }
        }else if(self.length>1){
            let ls=self.characterAtIndex(1)
            if(ls == 0x20e3){
                returnValue=true
            }
        }else{
            // non surrogate
            if(0x2100 <= hs && hs <= 0x27ff){
                returnValue = true
            }else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = true;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = true;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = true;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = true;
            }

        }
        
        return returnValue
    }
    
    
    
    
    
    //countElements(text)改为text.characters.count
    class func attributedStringForText(text: String) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSStrokeColorAttributeName, value: UIColor.blackColor(), range: NSRange(location: 0, length: (text.characters.count)))
        attributeString.addAttribute(NSStrokeWidthAttributeName, value: -2, range: NSRange(location: 0, length: (text.characters.count)))
        
        return attributeString
    }
    
    
    
    
    
    
    
}