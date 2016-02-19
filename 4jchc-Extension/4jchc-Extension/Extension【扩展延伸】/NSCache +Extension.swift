


import Foundation
// NS Cache
extension NSCache {
    
    class var sharedNSCache : NSCache {
        struct Static {
            
            static let instance : NSCache = NSCache()
        }
        return Static.instance
    }
    
    final func fetchObjectForKey(key: AnyObject, withConstructor handle: Void -> AnyObject) -> AnyObject {
        var object: AnyObject? = self.objectForKey(key)
        if object == nil { object = handle(); self.setObject(object!, forKey: key) }
        
        return object!
    }
    
    
    
    
    private struct Static {
        
        
        static var AssociationKey: UInt8 = 0
    }
    private var _delegate: NSCache_Delegate? {
        
        get { return objc_getAssociatedObject(self, &Static.AssociationKey) as? NSCache_Delegate }
        
        set {
            objc_setAssociatedObject(self, &Static.AssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        }
    }
    
    private var ce: NSCache_Delegate {
        
        if let obj = _delegate {
            return obj
        }
        if let obj: AnyObject = self.delegate {
            if obj is NSCache_Delegate {
                return obj as! NSCache_Delegate
            }
        }
        let obj = getDelegateInstance()
        _delegate = obj
        return obj
    }
    
    private func rebindingDelegate() {
        let delegate = ce
        self.delegate = nil
        self.delegate = delegate
    }
    
    internal func getDelegateInstance() -> NSCache_Delegate {
        return NSCache_Delegate()
    }
    
    public func ce_willEvictObject(handle: (cache: NSCache, obj: AnyObject) -> Void) -> Self {
        ce._willEvictObject = handle
        rebindingDelegate()
        return self
    }
    
}

internal class NSCache_Delegate: NSObject, NSCacheDelegate {
    
    var _willEvictObject: ((NSCache, AnyObject) -> Void)?
    
    
    override func respondsToSelector(aSelector: Selector) -> Bool {
        
        let funcDic1: [Selector : Any?] = [
            "cache:willEvictObject:" : _willEvictObject,
        ]
        if let f = funcDic1[aSelector] {
            return f != nil
        }
        
        return super.respondsToSelector(aSelector)
    }
    
    
    @objc func cache(cache: NSCache, willEvictObject obj: AnyObject) {
        _willEvictObject!(cache, obj)
    }
}

public extension NSCache {
    subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        set {
            if let value: AnyObject = newValue {
                setObject(value, forKey: key)
            } else {
                removeObjectForKey(key)
            }
        }
    }
    public func setFloat(value: Float, forKey: AnyObject) {
        setObject(value, forKey: forKey)
    }
    public func floatForKey(forKey: AnyObject) -> Float? {
        return objectForKey(forKey) as? Float
    }
    public func setData(value: NSData, forKey: AnyObject) {
        setObject(value, forKey: forKey)
    }
    public func dataForKey(forKey: AnyObject) -> NSData? {
        return objectForKey(forKey) as? NSData
    }
}



import UIKit
//MARK: - 图片缓存案例
class ImageLoader {
    
    var cache = NSCache()
    
    class var sharedLoader : ImageLoader {
        struct Static {
            static let instance : ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    func imageForUrl(urlString: String, completionHandler:(image: UIImage?, url: String) -> ()) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {()in
            // 读取数据
            let data: NSData? = self.cache.objectForKey(urlString) as? NSData
            
            if let goodData = data {
                let image = UIImage(data: goodData)
                dispatch_async(dispatch_get_main_queue(), {() in
                    completionHandler(image: image, url: urlString)
                })
                return
            }

            
            let downloadTask:NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                if (error != nil) {
                    completionHandler(image: nil, url: urlString)
                    return
                }
                
                if data != nil {
                    let image = UIImage(data: data!)
                    // 保存数据
                    self.cache.setObject(data!, forKey: urlString)
                    dispatch_async(dispatch_get_main_queue(), {() in
                        completionHandler(image: image, url: urlString)
                    })
                    return
                }
            })
            

            downloadTask.resume()
        })
        
    }
}
/*

    // MARK: 微博行高的缓存, 利用字典作为容器. key就是微博的id, 值就是对应微博的行高
    var rowCache: [Int: CGFloat] = [Int: CGFloat]()
    // 1.取出对应行的模型
    let height = rowCache[status.id]
    // 5.缓存行高
    rowCache[status.id] = rowHeight
    //MARK: 内存警告
    override func didReceiveMemoryWarning() {
    // 清空缓存
    rowCache.removeAll()

    }

*/








