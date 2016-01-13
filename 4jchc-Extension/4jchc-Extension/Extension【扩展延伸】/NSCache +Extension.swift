


import Foundation

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


