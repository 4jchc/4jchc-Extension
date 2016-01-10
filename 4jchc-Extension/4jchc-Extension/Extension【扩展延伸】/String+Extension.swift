


    import UIKit

    import Foundation
    
    public extension String {
        
        public func hasCharactersFromSet(characterSet: NSCharacterSet) -> Bool {
            if let _ = self.rangeOfCharacterFromSet(characterSet) {
                return true
            }
            return false
        }
        

        public func trim() -> String  {
            return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        }
        
        
        
//        public func characterCount() -> Int {
//            
//            return (self.utf16) as Int
//        }
//        
//        public func length() -> Int {
//            
//            return count(self.utf16)
//        }
        
        public func contains(find: String) -> Bool {
            
            if let _ = self.rangeOfString(find) {
                return true
            }
            return false
        }
        
        public func replaceString(string:String, withString:String) -> String {
            
            return self.stringByReplacingOccurrencesOfString(string, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
        }
        
        public func NSDataFromBase64String() -> NSData {
            
            return NSData(base64EncodedString: self, options: NSDataBase64DecodingOptions())!
        }
        
        public func urlEncode() -> String {
            
            return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!
        }
        
        public func urlEncodeUrlComponent() -> String {
            
            return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        }
        
//        public func base64Encode() -> String {
//            
//            return self.toData().base64String()
//        }
//        
//        public func base64Decode() -> String {
//            
//            return NSDataFromBase64String().toString()
//        }
//        
//        public func toData() -> NSData {
//            
//            return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
//        }
//        
//        public func toDate(format: String) -> NSDate {
//            
//            return NSDate.dateFromString(self, format: format)
//        }
//        
        
        
        
        
        // MARK: - get characters
        
//        public subscript (i: Int) -> Character {
//            
//            return self[advancedby(self.startIndex, i)]
//        }
//        
//        public subscript (i: Int) -> String {
//            
//            return String(self[i] as Character)
//        }
//        
//        public subscript (r: Range<Int>) -> String {
//            
//            return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
//        }
        
        
        
        
        // MARK - substring
        
        public func removeLastCharacter() -> String {
            
            return self.substringToIndex(self.endIndex.predecessor())
        }
        
        
        //MARK: - urlEncoded
        func urlEncoded() -> String {
            if let encoded = self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()){
                
                return encoded
            }
            
            return self
        }
        
        
        
        
        
        

  
            ///  在字符串前拼接文档目录
            func documentPath() -> String {
                let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
                //path.stringByAppendingPathComponent(self)
                return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
            }
            
            ///  在字符串前拼接缓存目录
            func cachePath() -> String {
                let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last
                
                return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
            }
            
            ///  在字符串前拼接临时目录
            func tempPath() -> String {
                 //NSTemporaryDirectory().stringByAppendingPathComponent(self)
                return NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(self).path!
            }
      
 
        
        
        
        
        
//        /// 删除字符串中 href 的引用
//        func removeHref() -> String? {
//            
//            // 0. pattern 匹配方案 - 要过滤字符串最重要的依据
//            // <a href="http://www.xxx.com/abc">XXX软件</a>
//            // () 是要提取的匹配内容，不使用括号，就是要忽略的内容
//            let pattern = "<a.*?>(.*?)</a>"
//            
//            // 1. 定义正则表达式
//            // DotMatchesLineSeparators 使用 . 可以匹配换行符
//            // CaseInsensitive 忽略大小写
//            let regex = try! NSRegularExpression(pattern: pattern, options: [NSRegularExpressionOptions.CaseInsensitive , NSRegularExpressionOptions.DotMatchesLineSeparators])
//            
//            // 2. 匹配文字
//            // firstMatchInString 在字符串中查找第一个匹配的内容
//            // rangeAtIndex 函数是使用正则最重要的函数 -> 从 result 中获取到匹配文字的 range
//            // index == 0，取出与 pattern 刚好匹配的内容
//            // index == 1，取出第一个()中要匹配的内容
//            // index 可以依次递增，对于复杂字符串过滤，可以使用多几个 ()
//            let text = self as NSString
//            let length = text.length
//            // 提示：不要直接使用 String.length，包含UNICODE的编码长度，会出现数组越界
//            //        let length = self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
//            
//            if let result = regex.firstMatchInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, length)) {
//                // 匹配到内容
//                
//                print(result.rangeAtIndex(0))
//                print(text.substringWithRange(result.rangeAtIndex(0)))
//                
//                print(result.rangeAtIndex(1))
//                print(text.substringWithRange(result.rangeAtIndex(1)))
//                
//                return text.substringWithRange(result.rangeAtIndex(1))
//            }
//            
//            return nil
//        }
        
        
        
        
    }
    

