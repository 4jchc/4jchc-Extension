


import Foundation

public func removeObject<T : Equatable>(object: T, inout fromArray array: [T]){
    
    let index = array.indexOf(object)
    if let index = index {
        array.removeAtIndex(index)
    }
}

//默认是[from to]型.
func getRandomNumber(from:Int,to:Int)->Int{
    //+1,result is [from to]; else is [from, to)
    // 1） 获取一个随机整数范围在：[0,100)包括0，不包括100 int x = arc4random() % 100;
    // 2） 获取一个随机数范围在：[500,1000），包括500，不包括1000 int y = (arc4random() % 501) + 500;
    return from + Int(arc4random()) % (to - from + 1)
}