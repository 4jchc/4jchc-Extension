


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

//MARK: - 弧度
///弧度
func radians(degrees:CGFloat) ->CGFloat {
    
    return ( degrees * 3.14159265 ) / 180.0;
    
}

//MARK: - 延迟在主线程执行函数
///  延迟在主线程执行函数
///
/// - parameter delta:    延迟时间
/// - parameter callFunc: 要执行的闭包方法
func delay(delta: Double, callFunc: ()->()) {
    
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, Int64(delta * Double(NSEC_PER_SEC))),
        dispatch_get_main_queue()) {
            
            callFunc()
    }
}


//MARK: - 自定义在DEBUG下的打印print
/// 自定义的DEBUG下的打印print
//MARK: - 在 BuildSettting 中 搜索 other swift flags 里DEBUG项
//MARK: 而不是在主的列表添加,那样release也添加了 `-D DEBUG`

/**
- parameter message: 需要输入的信息
- parameter file:    文件名
- parameter method:  调用print的方法
- parameter line:    打印函数 所在的行号
*/

func printLog<T>(message: T,
    file: String = __FILE__,
    method: String = __FUNCTION__,
    line: Int = __LINE__)
{
    #if DEBUG
        __LINE__
        print("\((file as NSString).lastPathComponent)[\(line)行], \(method): \(message)")
    #else
        //print("\(message)")
    #endif
    
}



class WBLog{
    static func Log(message:String){
        #if DEBUG
            NSLog(message)
        #endif
    }
    
    static func Log(format: String, args: CVarArgType){
        #if DEBUG
            NSLog(format, args)
        #endif
    }
}


