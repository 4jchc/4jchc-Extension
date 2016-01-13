
//  Created by 蒋进 on 15/10/10.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit
///*****✅返回一个截屏图片-剪切的头像
extension UIImage {
    
    

    //MARK: - ✅返回一个截屏图片
    /// ✅返回一个截屏图片
   func imageWithCaptureView(view:UIView) -> UIImage{
        
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0);
    
    // 获取上下文
    let ctx:CGContextRef = UIGraphicsGetCurrentContext()!

    // 渲染控制器view的图层到上下文
    // 图层只能用渲染不能用draw
    view.layer.renderInContext(ctx)

    // 获取截屏图片
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()

    // 关闭上下文
    UIGraphicsEndImageContext();
    
    ////*****✅/ 把图片转换成png格式的二进制数据
    //   let d:NSData = UIImagePNGRepresentation(newImage)!
    
    ////*****✅/ 写入桌面
    //还没实现
    //   d.writeToFile("/Users/jiangjin/Desktop/newImage.png", atomically: true)
    return newImage;
    
}
    
    
    

    //MARK: - ✅返回一个剪切的头像 border:
    /// ✅返回一个剪切的头像 border:
    func imageWithHeader(name:NSString, border:CGFloat,borderColor color:UIColor) ->UIImage{

        // 圆环的宽度
        let borderW:CGFloat = border;
        
        // 加载旧的图片
        let oldImage:UIImage =  UIImage(named: name as String)!
        
        // 新的图片尺寸
        
        let imageW:CGFloat = oldImage.size.width + 2 * borderW;
        let imageH:CGFloat  = oldImage.size.height + 2 * borderW;
        
        // 设置新的图片尺寸
        let circirW:CGFloat  = imageW > imageH ? imageH : imageW;
        
        // 开启上下文
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(circirW, circirW), false, 0.0);
        
        // 画大圆
        let path:UIBezierPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, circirW, circirW))
   
        // 获取当前上下文
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // 添加到上下文
        CGContextAddPath(ctx, path.CGPath);
        
        // 设置颜色
        color.set()
        
        // 渲染
        CGContextFillPath(ctx);
        
        let clipR:CGRect = CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height);
        
        // 画圆：正切于旧图片的圆
        let clipPath:UIBezierPath = UIBezierPath(ovalInRect: clipR)
 
        // 设置裁剪区域
        clipPath.addClip()
    
        // 画图片
        oldImage.drawAtPoint(CGPointMake(borderW, borderW))

        // 获取新的图片
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭上下文
        
        UIGraphicsEndImageContext();
        
        ////*****✅/ 把图片转换成png格式的二进制数据
     //   let d:NSData = UIImagePNGRepresentation(newImage)!
        
        ////*****✅/ 写入桌面
        //还没实现
     //   d.writeToFile("/Users/jiangjin/Desktop/\(name).png", atomically: true)
        
        return newImage;
        }
    

    //MARK: - UIColor 转UIImage
    /// UIColor 转UIImage
     func imageWithColor(color:UIColor) ->UIImage  {
        let  rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect);
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage;
        
    }
    
    //MARK: - 返回中心拉伸的图片
    ///返回中心拉伸的图片stretched
   static func imageWithStretchedName(name:String)->UIImage{
        
        let image: UIImage  = UIImage(named: name)!
        let leftCap: Int  = Int(image.size.width * 0.5)
        
        let topCap: Int  = Int(image.size.height * 0.5)
        return image.stretchableImageWithLeftCapWidth(leftCap, topCapHeight: topCap)
    
    }

    

    //MARK: - 将图片等比例缩放Equal scaling, 缩放到图片的宽度等屏幕的宽度
    /// 将图片等比例缩放Equal scaling, 缩放到图片的宽度等屏幕的宽度
    func imageWithEqualScalingUiscreenWidth() -> CGSize {
        // 新的高度 / 新的宽度 = 原来的高度 / 原来的宽度
        
        // 新的宽度
        let newWidth = UIScreen.width()
        
        // 新的高度
        let newHeight = newWidth * size.height / size.width
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        return newSize
    }
    
    //MARK: - 根据传入的宽度生成一张图片 按照图片的宽高比来压缩以前的图片
    /// 根据传入的宽度生成一张图片 按照图片的宽高比来压缩以前的图片

    ///  - width 制定宽度
    func imageWithScale(width: CGFloat) -> UIImage
    {
        // 1.根据宽度计算高度
        let height = width *  size.height / size.width
        
        // 2.按照宽高比绘制一张新的图片
        let currentSize = CGSize(width: width, height: height)
        UIGraphicsBeginImageContext(currentSize)
        drawInRect(CGRect(origin: CGPointZero, size: currentSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
  }
public extension UIImage {
    
    //MARK: - 返回一个固定尺寸图片
    /// 返回一个固定尺寸图片
    func imageWithSize(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    //MARK: - 返回一个固定尺寸图片的颜色
    /// 返回一个固定尺寸图片的颜色
    class func imageFromColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
    
//        let rect = CGRect(origin: CGPointZero, size: size)
//        UIGraphicsBeginImageContext(rect.size);
//        let context = UIGraphicsGetCurrentContext();
//        
//        CGContextSetFillColorWithColor(context, color.CGColor);
//        CGContextFillRect(context, rect);
        
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// Instantiate UIImage or nil if data is nil or image canot be instantiated.
    /// - parameter dataOrNil: Image data or nil.
    convenience init?(dataOrNil: NSData?) {
        if let d = dataOrNil {
            self.init(data: d)
        } else {
            return nil
        }
    }
}
extension UIImage {
    
    convenience init(color: UIColor, size: CGSize, transparentInsets:UIEdgeInsets = UIEdgeInsetsZero) {
        var coloredRect = CGRect()
        coloredRect.origin.x = transparentInsets.left
        coloredRect.origin.y = transparentInsets.top
        coloredRect.size.width = size.width - transparentInsets.left - transparentInsets.right
        coloredRect.size.height = size.height - transparentInsets.top - transparentInsets.bottom
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(coloredRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(CGImage: image.CGImage!)
    }
    
    convenience init(fromView view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(CGImage:image.CGImage!)
    }
    
    

    //MARK: - Rotating n.旋转的,旋转性的
    /// Rotating n.旋转的,旋转性的
    func imageByRotatingFor(angle: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(context, size.width / 2.0, size.height / 2.0)
        CGContextRotateCTM(context, angle)
        self.drawInRect(CGRect(origin: CGPoint(x: -size.width / 2.0, y: -size.height / 2.0), size: size))
        
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        
        return result
    }
    //MARK: - Subtracting减法
    /// Subtracting减法
    
    func imageBySubtractingImage(maskImage: UIImage, drawnAtPoint drawPoint: CGPoint) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        
        drawAtPoint(CGPointZero)
        maskImage.drawAtPoint(drawPoint, blendMode: CGBlendMode.DestinationOut, alpha: 1.0)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
    //MARK: - Rounding绕行；使变圆；
    /// Rounding绕行；使变圆；
    func imageByRoundingCorners(cornerRadius: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        
        UIBezierPath(roundedRect: CGRect(origin: CGPointZero, size: size), cornerRadius: cornerRadius).addClip()
        drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
    
}
