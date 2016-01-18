


import Foundation
import UIKit
public func removeObject<T : Equatable>(object: T, inout fromArray array: [T]){
    
    let index = array.indexOf(object)
    if let index = index {
        array.removeAtIndex(index)
    }
}


//MARK: - 获取随机数范围默认是[from to]型.
///  获取随机数范围默认是[from to]型.
func getRandomNumber(from:Int,to:Int)->Int{
    //+1,result is [from to]; else is [from, to)
    // 1） 获取一个随机整数范围在：[0,100)包括0，不包括100 int x = arc4random() % 100;
    // 2） 获取一个随机数范围在：[500,1000），包括500，不包括1000 int y = (arc4random() % 501) + 500;
    return from + Int(arc4random()) % (to - from + 1)
}


func getImageURLString(imageUrl: String, width: Int, height: Int) -> String {
    
    var exactUrl = ""
    var urlArr = imageUrl.componentsSeparatedByString("/")
    
    for i in 0..<urlArr.count - 1  {
        if i == 2 {
            exactUrl = exactUrl.stringByAppendingString("image.kiklink.com")
        } else {
            exactUrl = exactUrl.stringByAppendingString(urlArr[i])
        }
        
        exactUrl = exactUrl.stringByAppendingString("/")
    }
    
    exactUrl = exactUrl.stringByAppendingFormat("@%dw_%dh_1e_1c_1o_100Q.png", width, height)
    
    return exactUrl
}


func convertDateFormater(date: String) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.timeZone = NSTimeZone(name: "UTC")
    let date = dateFormatter.dateFromString(date)
    
    
    dateFormatter.dateFormat = "EEE HH:mm"
    dateFormatter.timeZone = NSTimeZone(name: "UTC")
    let timeStamp = dateFormatter.stringFromDate(date!)
    
    
    return timeStamp
}

//MARK: - cell选中时颜色的改变
///  cell选中时颜色的改变
func animateCellSelection(cell:UITableViewCell) {
    
    //fade cell background blue to white
    cell.backgroundColor = UIColor.redColor()//cellSelectionColor
    UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
        cell.backgroundColor = UIColor.whiteColor()
        }) { (done:Bool) -> Void in
    }
}

//MARK: - 延时执行闭包
///  延时执行闭包
func delay(delay:Double, closure:()->()) {
    
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure
    )
}


