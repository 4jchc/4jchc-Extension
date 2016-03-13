



import UIKit
// MARK: - 将APNS NSData类型token 格式化成字符串
extension NSData {
    
    func apnsToken() -> String {
        return self.description.stringByReplacingOccurrencesOfString("<", withString: "").stringByReplacingOccurrencesOfString(">", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "")
    }
}

public extension NSData {
    
    public func toString() -> String{
        
        return String(NSString(data: self, encoding: NSUTF8StringEncoding)!)
    }
    
    public func base64String() -> String {
        
        return String(self.base64EncodedStringWithOptions(NSDataBase64EncodingOptions()))
    }
    
    func convertDataToNSArray() -> NSArray? {
        let data = self
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray
            return json
        } catch _ {
            
        }
        return nil
    }
    
    func convertDataToNSDictionary() -> NSDictionary? {
        let data = self
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary
            return json
        } catch _ {
            
        }
        return nil
    }
}