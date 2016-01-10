
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



    