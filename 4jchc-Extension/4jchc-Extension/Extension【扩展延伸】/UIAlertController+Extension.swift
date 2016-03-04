
//

import Foundation
import UIKit

///*****✅提示框扩展
extension UIAlertController{
        ///*****✅快速创建提示框
        static func showAlert(
            presentController: UIViewController!,
            title: String!,
            message: String!,
            cancelButtonTitle: String?,
            okButtonTitle: String?,
            otherButtonTitle: String?) {
                let alert = UIAlertController(title: title!, message: message!, preferredStyle: UIAlertControllerStyle.Alert)

                
                if (cancelButtonTitle != nil) {
                    alert.addAction(UIAlertAction(title: cancelButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
                }
                if (okButtonTitle != nil) {
                    alert.addAction(UIAlertAction(title: okButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
                }
                if (otherButtonTitle != nil) {
                    alert.addAction(UIAlertAction(title: otherButtonTitle!, style: UIAlertActionStyle.Default, handler: nil))// do not handle cancel, just dismiss
                }
                
                presentController!.presentViewController(alert, animated: true, completion: nil)
        }

    
    func alertControllerWithLogin(){
        // 危险操作:弹框提醒
        // 1.UIAlertView
        // 2.UIActionSheet
        // iOS8开始:UIAlertController == UIAlertView + UIActionSheet
        let alert:UIAlertController = UIAlertController(title: "警告", message: "你真的要放弃swift吗", preferredStyle: UIAlertControllerStyle.Alert)
        
        // 添加按钮
        weak var weakalert = alert
        alert.addAction(UIAlertAction(title: "sure", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
            weakalert?.textFields?.first?.text
            weakalert?.textFields?.last?.text
            NSLog("点击了确定按钮");
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            
            NSLog("点击了取消按钮");
        }))
        
        // 添加文本框
        alert.addTextFieldWithConfigurationHandler { (textField) in
            
            textField.placeholder = "放弃swift"
            
        }
        alert.addTextFieldWithConfigurationHandler { (textField) in
            
            textField.placeholder = "你真的要放弃swift吗"
            textField.secureTextEntry = true
            textField.textColor = UIColor.redColor()
            textField.addTarget(self, action: "usernameDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func usernameDidChange(username:UITextField){
        
        NSLog("%@", username.text!);
        
    }

    
    }

public extension UIAlertController {
    
    public  override func show(animated animated: Bool, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.windowLevel = UIWindowLevelAlert
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
        window.rootViewController!.presentViewController(self, animated: animated, completion: completion)
    }
    
}



import Foundation
import UIKit

///  Determine the sequence of ok button and cancel.
///
///  - OkCancel: ok button is on the left and cancel button on the right
///  - CancelOk: cancel button is on the left and ok button on the right
public enum AlertOKCancelDirection: Int {
    case OkCancel
    case CancelOk
}

private var sg_hyb_alert_actionsheet_controller: UIAlertController?
private var sg_default_ok_button_title = "确定"
private var sg_default_cancel_button_title = "取消"
private var sg_ok_cancel_button_direction = AlertOKCancelDirection.CancelOk

public extension UIViewController {
    /// Get/Set the default ok button title
    public var hyb_defaultOkTitle: String {
        get { return sg_default_ok_button_title }
        set { sg_default_ok_button_title = newValue }
    }
    
    /// Get/Set the default cance button title
    public var hyb_defaultCancelTitle: String {
        get { return sg_default_cancel_button_title }
        set { sg_default_cancel_button_title = newValue }
    }
    
    /// Get/Set the defaul direction between ok button and cancel button. Default is CacelOk.
    public var hyb_okCancelDirection: AlertOKCancelDirection {
        get { return sg_ok_cancel_button_direction }
        set { sg_ok_cancel_button_direction = newValue }
    }
    
    // MARK: Ok Alert
    
    ///  Only Show Alert View in current controller
    ///
    ///  - parameter title: title
    public func hyb_showOkAlert(title: String?) {
        self.hyb_showOkAlert(title, message: nil)
    }
    
    ///  Show Alert view in current controller with a ok button
    ///
    ///  - parameter title:   alert view's title
    ///  - parameter message: show the message
    public func hyb_showOkAlert(title: String?, message: String?) {
        self.hyb_showAlertActionSheet(title, message: nil, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultOkTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
        })])
    }
    
    ///  Show title and an ok button of Alert
    ///
    ///  - parameter title: alert's title
    ///  - parameter ok:    ok button call back
    public func hyb_showOkAlert(title: String?, ok: () ->Void) {
        self.hyb_showAlertActionSheet(title, message: nil, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultOkTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
            ok()
        })])
    }
    
    ///  Show title, message and an ok button of Alert
    ///
    ///  - parameter title:   title
    ///  - parameter message: message
    ///  - parameter ok:      ok button call back
    public func hyb_showOkAlert(title: String?, message: String?, ok: () ->Void) {
        self.hyb_showAlertActionSheet(title, message: message, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultOkTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
            ok()
        })])
    }
    
    // MARK: Cancel Alert
    ///  Only Show Alert View in current controller
    ///
    ///  - parameter title: title
    public func hyb_showCancelAlert(title: String?) {
        self.hyb_showCancelAlert(title, message: nil)
    }
    
    ///  Show Alert view in current controller with a cancel button
    ///
    ///  - parameter title:   alert view's title
    ///  - parameter message: show the message
    public func hyb_showCancelAlert(title: String?, message: String?) {
        self.hyb_showAlertActionSheet(title, message: nil, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultCancelTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
        })])
    }
    
    ///  Show title and an ok button of Alert
    ///
    ///  - parameter title:  alert's title
    ///  - parameter cancel: cancel button call back
    public func hyb_showCancelAlert(title: String?, cancel: () ->Void) {
        self.hyb_showAlertActionSheet(title, message: nil, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultCancelTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
            cancel()
        })])
    }
    
    ///  Show title, message and an ok button of Alert
    ///
    ///  - parameter title:   title
    ///  - parameter message: message
    ///  - parameter cancel:  cancel button call back
    public func hyb_showCancelAlert(title: String?, message: String?, cancel: () ->Void) {
        self.hyb_showAlertActionSheet(title, message: message, preferredStyle: .Alert, alertActions: [UIAlertAction(title: self.hyb_defaultCancelTitle, style: .Default, handler: { (e) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
            cancel()
        })])
    }
    
    // MARK: Ok And Cancel Alert
    
    ///  Show Ok and cancel alert view
    ///
    ///  - parameter title: title
    public func hyb_showAlert(title: String?) {
        self.hyb_showAlert(title, message: nil)
    }
    
    ///  Show Ok and cancel alert view with title and message
    ///
    ///  - parameter title:   title
    ///  - parameter message: message
    public func hyb_showAlert(title: String?, message: String?) {
        var buttonTitles: [String]!
        
        if self.hyb_okCancelDirection == .OkCancel {
            buttonTitles = [self.hyb_defaultOkTitle, self.hyb_defaultCancelTitle]
        } else {
            buttonTitles = [self.hyb_defaultCancelTitle, self.hyb_defaultOkTitle]
        }
        
        self.hyb_showAlert(title, message: message, buttonTitles: buttonTitles) { (index) -> Void in
            sg_hyb_alert_actionsheet_controller = nil
        }
    }
    
    ///  Show alert view with title, message and custom button titles.
    ///
    ///  - parameter title:         title
    ///  - parameter message:       message
    ///  - parameter buttonTitles:  custom button titles
    ///  - parameter buttonClosure: call back
    public func hyb_showAlert(title: String?, message: String?,
        buttonTitles: [String]?, buttonClosure: ((index: Int) ->Void)?) {
            var buttonArray: [UIAlertAction]?
            if let titles = buttonTitles {
                buttonArray = []
                
                for (index, item) in titles.enumerate() {
                    buttonArray?.append(UIAlertAction(title: item, style: .Default, handler: { (e) -> Void in
                        if let callback = buttonClosure {
                            sg_hyb_alert_actionsheet_controller = nil
                            callback(index: index)
                        }
                    }))
                }
            }
            
            self.hyb_showAlertActionSheet(title, message: message, preferredStyle: .Alert, alertActions: buttonArray)
    }
    
    // MARK: ActionSheet
    ///  Show action sheet
    ///
    ///  - parameter title:       title
    ///  - parameter message:     message
    ///  - parameter cancel:      cancel button title
    ///  - parameter otherTitles: other button titles
    ///  - parameter closure:     call back for button responds
    public func hyb_showActionSheet(title: String?, message: String?, cancel: String?,
        otherTitles: String..., closure: ((index: Int) ->Void)?) {
            self._hyb_showActionSheet(title, message: message, cancel: cancel,
                destructive: nil,
                otherTitles: otherTitles, closure: closure)
    }
    
    ///  Show action sheet in current controller.
    ///
    ///  - parameter title:       title
    ///  - parameter message:     message
    ///  - parameter cancel:      cancel button title
    ///  - parameter destructive: destructive button title
    ///  - parameter otherTitles: other button titles
    ///  - parameter closure:     callback with index start with zero
    public func hyb_showActionSheet(title: String?, message: String?, cancel: String?,
        destructive: String?, otherTitles: String..., closure: ((index: Int) ->Void)?) {
            self._hyb_showActionSheet(title, message: message, cancel: cancel,
                destructive: destructive, otherTitles: otherTitles, closure: closure)
    }
    
    // MARK: Private
    
    private func hyb_showAlertActionSheet(title: String?, message: String?,
        preferredStyle: UIAlertControllerStyle, alertActions: [UIAlertAction]?) {
            // prevent show too many times
            guard sg_hyb_alert_actionsheet_controller == nil else {
                return
            }
            
            let alertController = UIAlertController(title: title,
                message: message, preferredStyle: preferredStyle)
            
            if let actions = alertActions {
                for alertAction in actions {
                    alertController.addAction(alertAction)
                }
            }
            
            sg_hyb_alert_actionsheet_controller = alertController
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.presentViewController(alertController, animated: true, completion: nil)
            }
    }
    
    private func _hyb_showActionSheet(title: String?, message: String?, cancel: String?,
        destructive: String?, otherTitles: [String]?, closure: ((index: Int) ->Void)?) {
            let actionsheet = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            var index: Int = 0
            if cancel != nil {
                actionsheet.addAction(UIAlertAction(title: cancel, style: .Cancel, handler: { (e) -> Void in
                    if let callback = closure {
                        callback(index: 0)
                    }
                }))
                
                index++
            }
            
            if otherTitles != nil {
                for item in otherTitles! {
                    let itemIndex = index
                    
                    actionsheet.addAction(UIAlertAction(title: item, style: .Default, handler: { (e) -> Void in
                        if let callback = closure {
                            callback(index: itemIndex)
                        }
                    }))
                    
                    index++
                }
            }
            
            if destructive != nil {
                actionsheet.addAction(UIAlertAction(title: destructive, style: .Destructive, handler: { (e) -> Void in
                    
                }))
            }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.presentViewController(actionsheet, animated: true, completion: nil)
            }
    }
}

    