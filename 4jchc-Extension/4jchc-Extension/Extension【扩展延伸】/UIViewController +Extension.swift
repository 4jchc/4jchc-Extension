
import UIKit

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
//    
    
    
    
    
    
    
    
    //MARK: - presentedViewController
    
    class func topMostController() -> UIViewController {
        
        var topController = UIApplication.sharedApplication().keyWindow!.rootViewController
        
        while ((topController!.presentedViewController) != nil) {
            
            topController = topController!.presentedViewController;
        }
        
        return topController!
    }
}