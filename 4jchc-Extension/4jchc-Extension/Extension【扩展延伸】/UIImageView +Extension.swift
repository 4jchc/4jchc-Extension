

import UIKit
import Foundation

public extension UIImageView {
    
    public func tintWithColor(color:UIColor) {
        
        self.image = self.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.tintColor = color
    }
    
    public func removeTint() {
        
        self.image = self.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    }
    ///  设置UIImageView图片的便利构造函数
    ///
    ///  - parameter imageName: 图片名称String
    ///
    ///  - returns:  UIImageView对象
    convenience init(imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
    //MARK:  返回round圆的图片
    ///  返回round圆的图片
    func roundImage() {
        assert(self.image?.size.width == self.image?.size.height, "height and width should be same")
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
}


//MARK: - 下载缓存图片
extension UIImageView {
    func printSomething() {
        NSLog("is Downloading")
    }
    
    func imageCacheForUrl(urlString:String) {
        let cache = NSCache()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let data:NSData? = cache.objectForKey(urlString) as? NSData
            let goodData = data
            if ((goodData) != nil) {
                let image = UIImage(data: goodData!)
                self.image = image
            }
            else {
                let downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                    if (error != nil) {
                        // 放一张下载出错图片
                        return
                    }
                    
                    if data != nil {
                        let image = UIImage(data: data!)
                        cache.setObject(data!, forKey: urlString)
                        self.image = image
                        return
                    }
                    
                })
                downloadTask.resume()
            }
        })
    }
    
    
    func imageForUrl(urlString: String, completionHandler:(image: UIImage?, url: String) -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {()in
            let cache = NSCache()
            let data: NSData? = cache.objectForKey(urlString) as? NSData
            
            if let goodData = data {
                let image = UIImage(data: goodData)
                dispatch_async(dispatch_get_main_queue(), {() in
                    completionHandler(image: image, url: urlString)
                })
                return
            }
            
            let downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                if (error != nil) {
                    completionHandler(image: nil, url: urlString)
                    return
                }
                
                if data != nil {
                    let image = UIImage(data: data!)
                    cache.setObject(data!, forKey: urlString)
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



struct ImageCacheManager {
    
    private static var cache = NSCache()
    
    static func loadImage(strUrl: String, completionHandler:(image: UIImage?, url: String) -> ()) {
        if (!strUrl.isEmpty) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
                // Try get from cache
                if let image = self.cache.objectForKey(strUrl) as? UIImage {
                    dispatch_async(dispatch_get_main_queue()) {
                        completionHandler(image: image, url: strUrl)
                    }
                    return
                }
                // Or Load
                if let url = NSURL(string: strUrl),
                    let data = NSData(contentsOfURL: url),
                    let image = UIImage(data: data) {
                        // Success
                        self.cache.setObject(image, forKey: strUrl)
                        dispatch_async(dispatch_get_main_queue()) {
                            completionHandler(image: image, url: strUrl)
                        }
                        return
                } else {
                    // Error
                    completionHandler(image: nil, url: strUrl)
                    return
                }
            }
        }
    }
    
}






