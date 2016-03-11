//
//  常量.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/18.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

//MARK: - 苹果尺寸判断

//MARK:-小写
public var isIOS7: Bool = !isIOS8
public let isIOS8: Bool = floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1

public var screenWidth: CGFloat { return UIScreen.mainScreen().bounds.size.width }
public var screenHeight: CGFloat { return UIScreen.mainScreen().bounds.size.height }

public var screenSize: CGSize { return UIScreen.mainScreen().bounds.size }
public var screenBounds: CGRect { return UIScreen.mainScreen().bounds }



public var isIpad: Bool { return UIDevice.currentDevice().userInterfaceIdiom == .Pad }

public var is3_5InchScreen: Bool { return screenHeight ~= 480.0 }
public var is4InchScreen: Bool { return screenHeight ~= 568.0 }
public var isIphone6: Bool { return screenHeight ~= 667.0 }
public var isIphone6Plus: Bool { return screenHeight ~= 736.0 }
public var is320ScreenWidth: Bool { return screenWidth ~= 320.0 }




let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let ScreenSize = UIScreen.mainScreen().bounds.size
let ScreenBounds = UIScreen.mainScreen().bounds



let Screen_Max_Length = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let Screen_Min_Length = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let Is_Iphone = UIDevice.currentDevice().userInterfaceIdiom == .Phone
let Is_Iphone_4_Or_Less =  IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let Is_Iphone_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let Is_Iphone_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let Is_Iphone_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

let Is_Ipad = UIDevice.currentDevice().userInterfaceIdiom == .Pad

let Is_Retina = UIScreen.mainScreen().scale>=2.0 //&& UIScreen.mainScreen().respondsToSelector("scale")

//MARK:-大写
/*
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)


let IS_IPHONE = UIDevice.currentDevice().userInterfaceIdiom == .Phone
let IS_IPHONE_4_OR_LESS =  IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0

let IS_IPAD = UIDevice.currentDevice().userInterfaceIdiom == .Pad

let IS_RETINA = UIScreen.mainScreen().scale>=2.0 //&& UIScreen.mainScreen().respondsToSelector("scale")
*/

let kFontSize = ((IS_IPAD) ? 40 : 14)

//MARK: - 微博常量
/// tabBar底部栏 颜色
let JDAppearanceTintColor = UIColor.orangeColor()

let XMGGlobalBg:UIColor = UIColor.RGB(223, 223, 223)

let XMGMessageFont:UIFont = UIFont.systemFontOfSize(12)

/// 用户账户本地存储文件名
let JDAccountNameLocal = "account.plist"

/// 沙盒 版本号
let JDSandboxVersionKey = "sandboxVersionKey"


//MARK: 闭包通知常量

/// 用户请求是否成功的 闭包
typealias JDSuccessedCallBack = (isSuccess: Bool) -> ()
public typealias ProgressHandler = (data: NSData) -> Void
/// 界面切换 给appDelegate的通知
let JDNotificationSwithInAppDelegate = "JDNotificationSwithInAppDelegate"


//MARK: - 枚举案例
///  枚举案例
enum Either<T1, T2> {
    case Left(T1)
    case Right(T2)
}

enum Response<T1> {
    case Result(T1)
    case Error(NSError)
}

enum ViewModel < T1 > {
    case Result(T1)
    case Error(NSError)
}


//MARK: - UITabBarItem案例

class MMTabBarItem:UITabBarItem{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.image = self.image?.imageWithRenderingMode(.AlwaysOriginal)
        self.selectedImage = self.selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
    }
}

class MMBarButtonItem:UIBarButtonItem{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.image = self.image?.imageWithRenderingMode(.AlwaysOriginal)
        
    }
}


//MARK: - 💗

var IS_IPAD: Bool {
get {
    if (UIDevice.currentDevice().userInterfaceIdiom == .Pad) {
        return true
    }
    else {
        return false
    }
}
}

var IS_IPHONE: Bool {
get {
    if (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
        return true
    }
    else {
        return false
    }
}
}

var IS_RETINA: Bool {
get {
    if (UIScreen.mainScreen().scale >= 2.0) {
        return true
    }
    else {
        return false
    }
}
}

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

var SCREEN_MAX_LENGTH: CGFloat {
get {
    return SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH
}
}

var SCREEN_MIN_LENGTH: CGFloat {
get {
    return SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH
}
}

let IS_IPHONE_4_OR_LESS: Float = 4.0
let IS_IPHONE_5: Float = 5.0
let IS_IPHONE_6: Float = 6.0
let IS_IPHONE_6P: Float = 6.5

var My_Device: Float {
get {
    if (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0) {
        return IS_IPHONE_6P
    }
    else if (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0) {
        return IS_IPHONE_6
    }
    else if (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0) {
        return IS_IPHONE_5
    }
    else {
        return IS_IPHONE_4_OR_LESS
    }
}
}


/* The heights are declared as constants outside of the class so they can be easily referenced elsewhere */
struct CategoryLayoutConstants {
    struct Cell {
        /* The height of the non-featured cell */
        static let standardHeight: CGFloat = 100
        /* The height of the first visible cell */
        static let featuredHeight: CGFloat = 280
    }
}

class CategoryListLayoutDraw: UICollectionViewLayout {
    
    // MARK: Properties and Variables
    
    /* The amount the user needs to scroll before the featured cell changes */
    var dragOffset: CGFloat {
        get {
            if My_Device == IS_IPHONE_4_OR_LESS {
                return 100.0
            }
            else if My_Device == IS_IPHONE_5 {
                return 145.0
            }
            else if My_Device == IS_IPHONE_6 {
                return 130.0
            }
            else {
                return 115.0
            }
        }
    }
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    /* Returns the item index of the currently featured cell */
    var featuredItemIndex: Int {
        get {
            /* Use max to make sure the featureItemIndex is never < 0 */
            return max(0, Int(collectionView!.contentOffset.y / dragOffset))
        }
    }
    
    /* Returns a value between 0 and 1 that represents how close the next cell is to becoming the featured cell */
    var nextItemPercentageOffset: CGFloat {
        get {
            return (collectionView!.contentOffset.y / dragOffset) - CGFloat(featuredItemIndex)
        }
    }
    
    /* Returns the width of the collection view */
    var width: CGFloat {
        get {
            return CGRectGetWidth(collectionView!.bounds)
        }
    }
    
    /* Returns the height of the collection view */
    var height: CGFloat {
        get {
            return CGRectGetHeight(collectionView!.bounds)
        }
    }
    
    /* Returns the number of items in the collection view */
    var numberOfItems: Int {
        get {
            return collectionView!.numberOfItemsInSection(0)
        }
    }
    
    // MARK: UICollectionViewLayout
    
    /* Return the size of all the content in the collection view */
    override func collectionViewContentSize() -> CGSize {
        let contentHeight = CGFloat(numberOfItems - 1) * dragOffset + CategoryLayoutConstants.Cell.featuredHeight
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepareLayout() {
        cache.removeAll(keepCapacity: false)
        
        let standardHeight = CategoryLayoutConstants.Cell.standardHeight
        let featuredHeight = CategoryLayoutConstants.Cell.featuredHeight
        
        var frame = CGRectZero
        var y: CGFloat = 0
        
        for item in 0 ..< numberOfItems {
            let indexPath = NSIndexPath(forItem: item, inSection: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            
            /* Important because each cell has to slide over the top of the previous one */
            attributes.zIndex = item
            /* Initially set the height of the cell to the standard height */
            var height = standardHeight
            if indexPath.item == featuredItemIndex {
                /* The featured cell */
                let yOffset = standardHeight * nextItemPercentageOffset
                y = collectionView!.contentOffset.y - yOffset
                height = featuredHeight
            } else if indexPath.item == (featuredItemIndex + 1) && indexPath.item != numberOfItems {
                /* The cell directly below the featured cell, which grows as the user scrolls */
                let maxY = y + standardHeight
                height = standardHeight + max((featuredHeight - standardHeight) * nextItemPercentageOffset, 0)
                y = maxY - height
            }
            
            frame = CGRect(x: 0, y: y, width: width, height: height)
            attributes.frame = frame
            cache.append(attributes)
            y = CGRectGetMaxY(frame)
        }
    }
    
    /* Return all attributes in the cache whose frame intersects with the rect passed to the method */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if CGRectIntersectsRect(attributes.frame, rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    /* Return the content offset of the nearest cell which achieves the nice snapping effect, similar to a paged UIScrollView */
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let itemIndex = round(proposedContentOffset.y / dragOffset)
        let yOffset = itemIndex * dragOffset
        return CGPoint(x: 0, y: yOffset)
    }
    
    /* Return true so that the layout is continuously invalidated as the user scrolls */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
}



//MARK: - 常用函数
/*
rand() ----随机数

abs() / labs() ----整数绝对值

fabs() / fabsf() / fabsl() ----浮点数绝对值

floor() / floorf() / floorl() ----向下取整

ceil() / ceilf() / ceill() ----向上取整

round() / roundf() / roundl() ----四舍五入

sqrt() / sqrtf() / sqrtl() ----求平方根

fmax() / fmaxf() / fmaxl() ----求最大值

fmin() / fminf() / fminl() ----求最小值

hypot() / hypotf() / hypotl() ----求直角三角形斜边的长度

fmod() / fmodf() / fmodl() ----求两数整除后的余数

modf() / modff() / modfl() ----浮点数分解为整数和小数

frexp() / frexpf() / frexpl() ----浮点数分解尾数和二为底的指数

sin() / sinf() / sinl() ----求正弦值

sinh() / sinhf() / sinhl() ----求双曲正弦值

cos() / cosf() / cosl() ----求余弦值

cosh() / coshf() / coshl() ----求双曲余弦值

tan() / tanf() / tanl() ----求正切值

tanh() / tanhf() / tanhl() ----求双曲正切值

asin() / asinf() / asinl() ----求反正弦值

asinh() / asinhf() / asinhl() ----求反双曲正弦值

acos() / acosf() / acosl() ----求反余弦值

acosh() / acoshf() / acoshl() ----求反双曲余弦值

atan() / atanf() / atanl() ----求反正切值

atan2() / atan2f() / atan2l() ----求坐标值的反正切值

atanh() / atanhf() / atanhl() ----求反双曲正切值
*/

//MARK: - 动画相关
class animation {
    // vanish消失 OrAppear
    class func vanishOrAppear(target: UIView, time: CFTimeInterval, from: CGFloat, to: CGFloat) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = from
        animation.toValue = to
        animation.duration = CFTimeInterval(time)
        target.layer.addAnimation(animation, forKey: "Image-opacity")
        target.alpha = 0
    }
    
    func setScale(toScale:Float!, duration:Double!) -> CABasicAnimation {
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.toValue = toScale
        scale.duration = duration
        scale.removedOnCompletion = false
        scale.fillMode = kCAFillModeForwards
        return scale
    }
    // Opacity不透明
    func setOpacity(fromOpacity:Float!, toOpacity:Float!, duration:Double!) -> CABasicAnimation {
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = fromOpacity
        opacity.toValue = toOpacity
        opacity.duration = duration
        opacity.removedOnCompletion = false
        opacity.fillMode = kCAFillModeForwards
        return opacity
    }
    //MARK: -  == 永久闪烁的动画 === opacity不透明CABasicACnimation
    func opacityForever_Animation(time:CGFloat)->CABasicAnimation{
        
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")//必须写opacity才行。
        
        animation.fromValue = NSNumber(float: 1.0)
        animation.toValue = Float(0.0) //这是透明度。
        animation.autoreverses = true
        animation.duration = Double(time);
        animation.repeatCount = MAXFLOAT;
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards;
        //animation.timingFunction=[CAMediaTimingFunctionfunctionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
        return animation;
        
    }
    
}
extension UIView {
    // 脉冲pulse
    func pulse() {
        self.layer.removeAnimationForKey("pulsingAnimation")
        let pulsingAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulsingAnimation.fromValue = NSNumber(float: 1.0)
        pulsingAnimation.toValue = NSNumber(float: 2.0)
        
        let alphaAnimation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = NSNumber(float: 0.5)
        alphaAnimation.toValue = NSNumber(float: 0.0)
        
        let group: CAAnimationGroup = CAAnimationGroup()
        group.duration = 2.0
        group.repeatCount = Float.infinity
        group.removedOnCompletion = false
        group.animations = [pulsingAnimation, alphaAnimation]
        
        self.layer.addAnimation(group, forKey: "pulsingAnimation")
    }
}

extension UIImageView {
    func maskInCircle() {
        let circle: UIBezierPath = UIBezierPath(ovalInRect: self.bounds)
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.path = circle.CGPath
        shapeLayer.frame = self.bounds;
        self.layer.mask = shapeLayer;
    }
}

















