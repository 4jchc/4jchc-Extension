
import UIKit

public extension NSTimer {
    /**
     Creates and schedules a one-time `NSTimer` instance.
     
     :param: delay The delay before execution.
     :param: handler A closure to execute after `delay`.
     
     :returns: The newly-created `NSTimer` instance.
     */
    public class func schedule(delay delay: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
    
    /**
     Creates and schedules a repeating `NSTimer` instance.
     
     :param: repeatInterval The interval between each execution of `handler`. Note that individual calls may be delayed; subsequent calls to `handler` will be based on the time the `NSTimer` was created.
     :param: handler A closure to execute after `delay`.
     
     :returns: The newly-created `NSTimer` instance.
     */
    public class func schedule(repeatInterval interval: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
        let fireDate = interval + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
        return timer
    }
}

//// Usage:
//var count = 0
//NSTimer.schedule(repeatInterval: 1) { timer in
//    print(++count)
//    if count >= 10 {
//        timer.invalidate()
//    }
//}
//
//NSTimer.schedule(delay: 5) { timer in
//    print("5 seconds")
//}









/// Empty arguments and non-return value closure
public typealias hyb_VoidClosure = (Void) ->Void

/// Private void closure key
let hyb_private_voidClosureKey = "hyb_private_voidClosureKey"
let hyb_private_countKey = "hyb_private_countKey"

/// Array's useful extensions.
///
/// Author: huangyibiao
/// Github: http://github.com/CoderJackyHuang/
/// Blog:   http://www.hybblog.com/
public extension NSTimer {
    // MARK: Public
    
    ///  This is a very convenience Api for us to create a timer and just call back with a closure.
    ///
    ///  - parameter timeInterval: The interval time for a tick, default is one second.
    ///  - parameter repeats:      Whether to repeat callback when interval time comes
    ///  - parameter callback:     The selector for calling back.
    ///
    ///  - returns: The created timer object.
    public class func hyb_schedule(timeInterval: NSTimeInterval = 1, repeats: Bool, callback: hyb_VoidClosure?) ->NSTimer {
        return NSTimer.hyb_schedule(timeInterval, userInfos: nil, repeats: repeats, callback: callback, count: nil)
    }
    
    ///  This is a very convenience Api for us to create a timer and just call back with a closure.
    ///  We can use count argument to specify how many times to tick. If count is zero, it means repeats.
    ///
    ///  - parameter timeInterval: The interval time for a tick, default is one second.
    ///  - parameter count:        How many counts to call back. Zero means repeats.
    ///  - parameter callback:     The selector for calling back.
    ///
    ///  - returns: The created timer object.
    public class func hyb_schdule(timeInterval: NSTimeInterval = 1, count: Int?, callback: hyb_VoidClosure?) ->NSTimer {
        return NSTimer.hyb_schedule(timeInterval, userInfos: nil, repeats: true, callback: callback, count: count)
    }
    
    // MARK: Private
    internal class func  hyb_private_onTimerCallback(timer: NSTimer) {
        struct private_count {
            static var s_timerCallbackCount: Int = NSNotFound
        }
        
        if private_count.s_timerCallbackCount == NSNotFound {
            if let wrapper = timer.userInfo as? HYBObjectWrapper {
                if let count = wrapper.count {
                    private_count.s_timerCallbackCount = count
                }
            }
        }
        
        if private_count.s_timerCallbackCount != NSNotFound {
            private_count.s_timerCallbackCount--
            if private_count.s_timerCallbackCount < 0 {
                timer.invalidate()
                return
            }
        }
        
        var hasCalled = false
        if let wrapper = timer.userInfo as? HYBObjectWrapper {
            if let callback = wrapper.voidClosure {
                callback()
                hasCalled = true
            }
        }
        
        if !hasCalled {
            timer.invalidate()
        }
    }
    
    private class func hyb_schedule(timeInterval: NSTimeInterval, userInfos: AnyObject?, var repeats: Bool, callback: hyb_VoidClosure?, var count: Int?) ->NSTimer {
        if count == 0 {
            repeats = true
            count = nil
        }
        
        let wrapper = HYBObjectWrapper(closure: callback, userInfos: userInfos, count: count)
        
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
            target: self,
            selector: "hyb_private_onTimerCallback:",
            userInfo: wrapper,
            repeats: repeats)
        
        return timer
    }
}

/// 私有类
private class HYBObjectWrapper: NSObject {
    var voidClosure: hyb_VoidClosure?
    var userInfos: AnyObject?
    var count: Int?
    
    init(closure: hyb_VoidClosure?, userInfos: AnyObject?, count: Int?) {
        self.voidClosure = closure
        self.userInfos = userInfos
        self.count = count
    }
}