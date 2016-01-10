

import Foundation
import UIKit
extension UITextView{
    //UITextView(光标插入文字或者图片)
    func insertAttributedText(text:NSAttributedString){
        self.insertAttributedText(text, settingBlock: nil)
    }
    
    func insertAttributedText(text:NSAttributedString,settingBlock:((NSMutableAttributedString)->Void)?){
        
        let attributedText=NSMutableAttributedString()
        // 拼接之前的文字（图片和普通文字）
        attributedText.appendAttributedString(self.attributedText)
        
        // 拼接其他文字
        let loc=self.selectedRange.location
        attributedText.replaceCharactersInRange(self.selectedRange, withAttributedString: text)
        
        // 调用外面传进来的代码
        if(settingBlock != nil){
            
            settingBlock!(attributedText)
        }
        
        self.attributedText=attributedText
        
        // 移除光标到表情的后面
        self.selectedRange=NSMakeRange(loc + 1, 0)
    }
    
    func height(width:CGFloat) -> CGFloat {
        
        return self.sizeThatFits(CGSizeMake(width, CGFloat.max)).height
    }


}





