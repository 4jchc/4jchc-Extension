
import UIKit



// MARK: - 扩展UIViewController 描述性的名称:
extension UIViewController {
    
    private struct AssociatedKeys {
        static var DescriptiveName = "xb_DescriptiveName"
    }
    
    ///描述性的名称:
    var descriptiveName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}

// MARK: - 扩展释放的提示
extension UIViewController {
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            let originalSelector = Selector("dealloc")
            let swizzledSelector = Selector("xb_deallocSwizzle")
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            
            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }
    
    // MARK: - Method Swizzling
    func xb_deallocSwizzle() {
        debugPrint("释放了\(self.descriptiveName!)")
    }
}

//private let kLoadingOverlay = MQLoadingOverlay()

public extension UIViewController {
    
//    public func embedChildViewController(childViewController: UIViewController) {
//        self.embedChildViewController(childViewController, fillSuperview: true)
//    }
//    //embed放入
//    public func embedChildViewController(childViewController: UIViewController, fillSuperview: Bool) {
//        self.embedChildViewController(childViewController, toView: self.view, fillSuperview: fillSuperview)
//    }
//    
//    public func embedChildViewController(childViewController: UIViewController, toView superview: UIView, fillSuperview: Bool) {
//        self.addChildViewController(childViewController)
//        
//        if fillSuperview {
//            superview.addSubviewAndFill(childViewController.view)
//        } else {
//            superview.addSubview(childViewController.view)
//        }
//        
//        childViewController.didMoveToParentViewController(self)
//    }
//    
//    public func showLoadingOverlay(show: Bool) {
//        if let appDelegate = UIApplication.sharedApplication().delegate,
//            let someWindow = appDelegate.window,
//            let window = someWindow {
//                if show {
//                    window.addSubviewAndFill(kLoadingOverlay)
//                } else {
//                    kLoadingOverlay.removeFromSuperview()
//                }
//        }
//    }
//    
//    public func dismissKeyboard() {
//        self.view.endEditing(true)
//    }
//    
//    class func instantiateFromStoryboard() -> UIViewController {
//        
//        return UIStoryboard.defaultStoryboard().instantiateViewControllerWithIdentifier(self.className)
//    }
//    
//    func pushViewController(controllerClass: UIViewController.Type, animated: Bool = true) -> UIViewController {
//        
//        let vc = controllerClass.instantiateFromStoryboard()
//        
//        self.navigationController?.pushViewController(vc, animated: animated)
//        
//        return vc
//    }
    

    
    //MARK: - presentedViewController
    
    class func topMostController() -> UIViewController {
        
        var topController = UIApplication.sharedApplication().keyWindow!.rootViewController
        
        while ((topController!.presentedViewController) != nil) {
            
            topController = topController!.presentedViewController;
        }
        
        return topController!
    }
}


extension UIViewController {
    
    @IBAction func popAction() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func dismissAction() {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

//MARK: - 添加提示框
extension UIViewController {
    
    func presentDefaultErrorMsg(text: String) {
        presentDefaultMsg("Error", text: text)
    }
    
    func presentDefaultInfoMsg(text: String) {
        presentDefaultMsg("Info", text: text)
    }
    
    private func presentDefaultMsg(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

public extension UIViewController {
    
    public func show(animated animated: Bool, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.windowLevel = UIWindowLevelNormal
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
        window.rootViewController!.presentViewController(self, animated: animated, completion: completion)
    }
    
}
