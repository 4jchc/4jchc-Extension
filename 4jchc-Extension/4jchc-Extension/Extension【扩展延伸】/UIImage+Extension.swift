
//  Created by 蒋进 on 15/10/10.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit
import CoreImage

import Foundation

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
    
    

    //MARK: - Rotating n.旋转的,旋转性的 ->UIImage
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
    //MARK: - Subtracting减法    ->UIImage
    /// Subtracting减法
    
    func imageBySubtractingImage(maskImage: UIImage, drawnAtPoint drawPoint: CGPoint) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        
        drawAtPoint(CGPointZero)
        maskImage.drawAtPoint(drawPoint, blendMode: CGBlendMode.DestinationOut, alpha: 1.0)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
    //MARK: - Rounding绕行；使变圆；->UIImage
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





class Filter {
    
    var name : String
    var thumbnailImage : UIImage?
    
    init(name: String) {
        self.name = name
    }
    // Jeff's approach
    func createFilterThumbnailFromImage(previewImage: UIImage, completionHandler: (image: UIImage) -> Void) {
        
        let ciImage = CIImage(image: previewImage)
        let filter = CIFilter(name: self.name)
        filter!.setDefaults()
        filter!.setValue(ciImage, forKey: kCIInputImageKey)
        
        let outputImage = filter!.outputImage
        
        let finalImage = UIImage(CIImage: outputImage!)
        completionHandler(image: finalImage)
    }
        /**
         根据CIImage生成指定大小的高清UIImage
    
         :param: image 指定CIImage
         :param: size    指定大小
         :returns: 生成好的图片
         */
         //MARK: - 根据CIImage生成指定大小的高清UIImage
         ///  根据CIImage生成指定大小的高清UIImage
        class func createNonInterpolatedUIImageFormCIImage(image: CIImage, size: CGFloat) -> UIImage {
    
            let extent: CGRect = CGRectIntegral(image.extent)
            let scale: CGFloat = min(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent))
    
            // 1.创建bitmap;
            let width = CGRectGetWidth(extent) * scale
            let height = CGRectGetHeight(extent) * scale
            let cs: CGColorSpaceRef = CGColorSpaceCreateDeviceGray()!
            let bitmapRef = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, cs, 0)!
    
            let context = CIContext(options: nil)
            let bitmapImage: CGImageRef = context.createCGImage(image, fromRect: extent)
    
            CGContextSetInterpolationQuality(bitmapRef,  CGInterpolationQuality.None)
            CGContextScaleCTM(bitmapRef, scale, scale);
            CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
            // 2.保存bitmap到图片
            let scaledImage: CGImageRef = CGBitmapContextCreateImage(bitmapRef)!
    
            return UIImage(CGImage: scaledImage)
        }
    
        //MARK: - 生成二维码图片
        ///  生成二维码图片
        class func creatQRCodeImage() -> UIImage{
    
            // 1.创建滤镜Filter
            let filter = CIFilter(name: "CIQRCodeGenerator")
    
            // 2.还原滤镜的默认属性
            filter?.setDefaults()
    
            // 3.设置需要生成二维码的数据
            filter?.setValue("极客江南".dataUsingEncoding(NSUTF8StringEncoding), forKey: "inputMessage")
    
            // 4.从滤镜中取出生成好的图片
            let ciImage = filter?.outputImage
    
            //        return UIImage(CIImage: ciImage!)
            let bgImage = createNonInterpolatedUIImageFormCIImage(ciImage!, size: 300)
    
            // 5.创建一个头像
            let icon = UIImage(named: "nange.jpg")
            
            // 6.合成图片(将二维码和头像进行合并)
            let newImage = imageBymerge(bgImage, iconImage: icon!)
            
            // 7.返回生成好的二维码
            return newImage
        }
    
    //MARK: - merge合并图片
    /// 合成图片
    class func imageBymerge(bgImage: UIImage, iconImage: UIImage) -> UIImage
    {
        // 1.开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        // 2.绘制背景图片
        bgImage.drawInRect(CGRect(origin: CGPointZero, size: bgImage.size))
        // 3.绘制头像
        let width:CGFloat = 50
        let height:CGFloat = width
        let x = (bgImage.size.width - width) * 0.5
        let y = (bgImage.size.height - height) * 0.5
        iconImage.drawInRect(CGRect(x: x, y: y, width: width, height: height))
        // 4.取出绘制号的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // 5.关闭上下文
        UIGraphicsEndImageContext()
        // 6.返回合成号的图片
        return newImage
    }
    
    //MARK: - 返回居中图片--显示图片和屏幕的比例
    ///  返回居中图片--显示图片和屏幕的比例
    private func displaySize(image: UIImage) -> CGSize
    {
        // 1.拿到图片的宽高比
        let scale = image.size.height / image.size.width
        // 2.根据宽高比计算高度
        let width = UIScreen.mainScreen().bounds.width
        let height =  width * scale
        
        return CGSize(width: width, height: height)
    }
    
}







extension UIImage {
    func average() -> UIColor {
        var bitmap = [UInt8](count: 4, repeatedValue: 0)
        
        if #available(iOS 9.0, *) {
            // Get average color.
            let context = CIContext()
            let inputImage = CIImage ?? CoreImage.CIImage(CGImage: CGImage!)
            let extent = inputImage.extent
            let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
            let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
            let outputImage = filter.outputImage!
            let outputExtent = outputImage.extent
            assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
            
            // Render to bitmap.
            context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: kCIFormatRGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        } else {
            // Create 1x1 context that interpolates pixels when drawing to it.
            let context = CGBitmapContextCreate(&bitmap, 1, 1, 8, 4, CGColorSpaceCreateDeviceRGB(), CGBitmapInfo.ByteOrderDefault.rawValue | CGImageAlphaInfo.PremultipliedLast.rawValue)!
            let inputImage = CGImage ?? CIContext().createCGImage(CIImage!, fromRect: CIImage!.extent)
            
            // Render to bitmap.
            CGContextDrawImage(context, CGRect(x: 0, y: 0, width: 1, height: 1), inputImage)
        }
        
        // Compute result.
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return result
    }
}



extension UIImage {
    //MARK:  thumbnail简略的(拇指甲大小的,小型的)
    ///  thumbnail简略的(拇指甲大小的,小型的)
    func thumbnail(size: CGSize) -> UIImage {
        
        // crop the biggest square we can=
        let heightOriginal = self.size.height
        let widthOriginal = self.size.width
        var requestedCrop: CGRect
        if (heightOriginal > widthOriginal) {
            let cropX = (heightOriginal - widthOriginal) / 2
            requestedCrop = CGRectMake(cropX, 0, widthOriginal, widthOriginal)
        } else {
            let cropX = (widthOriginal - heightOriginal) / 2
            requestedCrop = CGRectMake(cropX, 0, heightOriginal, heightOriginal)
        }
        var thumbnail = crop(requestedCrop)
        
        // scale it
        thumbnail = scale(thumbnail, newSize: size)
        
        // make it circle
        thumbnail = circleImage(thumbnail)
        
        return thumbnail
    }
    //MARK:  crop收获
    ///  <#照片浏览的 cell#>
    private func crop(var rect: CGRect) -> UIImage {
        rect.origin.x*=self.scale
        rect.origin.y*=self.scale
        rect.size.width*=self.scale
        rect.size.height*=self.scale
        
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, rect)
        let image = UIImage(CGImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        
        return image
    }
    //MARK:  scale比例在原始图片上画出新的图片
    ///  scale比例在原始图片上画出新的图片
    private func scale(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    //MARK:  circle圆(圆形物,周期;vt.环绕Image
    ///  scale比例在原始图片上画出新的图片
    private func circleImage(image: UIImage) -> UIImage {
        let newImage = image
        let cornerRadius = image.size.height/2
        UIGraphicsBeginImageContextWithOptions(image.size, false, 1.0)
        let bounds = CGRect(origin: CGPointZero, size: image.size)
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).addClip()
        newImage.drawInRect(bounds)
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return finalImage
    }
}

