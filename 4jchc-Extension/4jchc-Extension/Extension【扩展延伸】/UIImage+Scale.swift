//
//  UIImage+Scale.swift
//  GZWeibo05
//
//  Created by zhangping on 15/11/9.
//  Copyright © 2015年 zhangping. All rights reserved.
//

import UIKit

extension UIImage {
    
    /*
        将图片等比例缩放, 缩放到图片的宽度等屏幕的宽度
    */
    func displaySize() -> CGSize {
        // 新的高度 / 新的宽度 = 原来的高度 / 原来的宽度
        
        // 新的宽度
        let newWidth = UIScreen.width()
        
        // 新的高度
        let newHeight = newWidth * size.height / size.width
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        return newSize
    }
}
