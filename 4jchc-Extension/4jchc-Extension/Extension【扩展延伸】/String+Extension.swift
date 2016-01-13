


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
//            
//            return Int(self.utf16)//(self.utf16) as Int
//        }
        
        public func lengthUTF16() -> Int {
            
            return self.utf16.count//count(self.utf16)
        }
        //MARK: - 包含字符串
        /// 包含字符串
        public func contains(find: String) -> Bool {
            
//            if let _ = self.rangeOfString(find) {
//                return true
//            }
//            return false
             return self.rangeOfString(find) != nil
            
        }
        //MARK: 是否包含小写字母
        /// 是否包含小写字母
        func containsLowercaseString(aString: String) -> Bool {
            
            return self.lowercaseString.rangeOfString(aString.lowercaseString) != nil
        }
        
        //MARK: - 替换字符串
        /// 替换字符串
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
        
        public func base64Encode() -> String {
            
            return self.toData().base64String()
        }
        
        public func base64Decode() -> String {
            
            return NSDataFromBase64String().toString()
        }
        
        public func toData() -> NSData {
            
            return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
        }
        
        public func toDate(format: String) -> NSDate {
            
            return NSDate.dateFromString(self, format: format)
        }
//
        
        
        
        
        // MARK: - get characters
        
        public subscript (i: Int) -> Character {
           
            return  self[self.startIndex.advancedBy(i)]
        }
        
        public subscript (i: Int) -> String {
            
            return String(self[i] as Character)
        }
        
        public subscript (r: Range<Int>) -> String {
            
           return substringWithRange(Range(start: self.startIndex.advancedBy(r.startIndex), end: self.startIndex.advancedBy(r.endIndex)))
           
        }
        
        
        
        
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
        
        
        


        

  
            ///  将当前字符串拼接到doc目录后面
            func documentPath() -> String {
                
//                let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
//                return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
                
                let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
                //path.stringByAppendingPathComponent(self)
                return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
            }
            
            ///  将当前字符串拼接到cache目录后面
            func cachePath() -> String {
                
//                let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
//                return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
                let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last
                
                return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
            }
            
            ///  将当前字符串拼接到tmp目录后面
            func tempPath() -> String {
//                let path = NSTemporaryDirectory() as NSString
//                return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
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
        
        //MARK: - 包含http
        /// 包含http
        func isHttpLocalPath() -> Bool {
            return self.rangeOfString("http") == nil
        }
        
        
        
        
        
        
        /// Get the length of a string
        ///
        /// - returns: 字符串的长度
        public func length() ->Int {
            return self.characters.count
        }
        
        // MARK: Trim整修 API
        
        /// 去掉字符串前后的空格，根据参数确定是否过滤换行符
        ///
        /// - parameter trimNewline 是否过滤换行符，默认为false
        ///
        /// - returns:   处理后的字符串
        public func trim(trimNewline: Bool = false) ->String {
            if trimNewline {
                return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
            }
            
            return self.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
        }
        
        /// 去掉字符串前面的空格，根据参数确定是否过滤换行符
        ///
        /// - parameter trimNewline 是否过滤换行符，默认为false
        ///
        /// - returns:   处理后的字符串
        public func trimLeft(trimNewline: Bool = false) ->String {
            if self.isEmpty {
                return self
            }
            
            var index = self.startIndex
            while index != self.endIndex {
                let ch = self.characters[index]
                if ch == Character(" ") {
                    index++
                    continue
                } else if ch == Character("\n") {
                    if trimNewline {
                        index++
                        continue
                    } else {
                        break
                    }
                }
                
                break
            }
            
            return self.substringFromIndex(index)
        }
        
        /// 去掉字符串后面的空格，根据参数确定是否过滤换行符
        ///
        /// - parameter trimNewline 是否过滤换行符，默认为false
        ///
        /// - returns:   处理后的字符串
        public func trimRight(trimNewline: Bool = false) ->String {
            if self.isEmpty {
                return self
            }
            
            var index = self.endIndex.predecessor()
            while index != self.startIndex {
                let ch = self.characters[index]
                if ch == Character(" ") {
                    index--
                    continue
                } else if ch == Character("\n") {
                    if trimNewline {
                        index--
                        continue
                    } else {
                        index++
                        break
                    }
                }
                
                break
            }
            
            return self.substringToIndex(index)
        }
        
        // MARK: Substring子串 API
        
        /// 获取子串的起始位置。
        ///
        /// - parameter substring 待查找的子字符串
        ///
        /// - returns:  如果找不到子串，返回NSNotFound，否则返回其所在起始位置
        public func location(substring: String) ->Int {
            return (self as NSString).rangeOfString(substring).location
        }
        
        /// 根据起始位置和长度获取子串。
        ///
        /// - parameter location  获取子串的起始位置
        /// - parameter length    获取子串的长度
        ///
        /// - returns:  如果位置和长度都合理，则返回子串，否则返回nil
        public func substring(location: Int, length: Int) ->String? {
            if location < 0 && location >= self.length() {
                return nil
            }
            
            if length <= 0 || length >= self.length() {
                return nil
            }
            
            return (self as NSString).substringWithRange(NSMakeRange(location, length))
        }
        
        /// 根据下标获取对应的字符。若索引正确，返回对应的字符，否则返回nil
        ///
        /// - parameter index 索引位置
        ///
        /// - returns: 如果位置正确，返回对应的字符，否则返回nil
        public subscript(index: Int) ->Character? {
            get {
                if let str = substring(index, length: 1) {
                    return Character(str)
                }
                
                return nil
            }
        }
        
        /// 判断字符串是否包含子串。
        ///
        /// - parameter substring 子串
        ///
        /// - returns:  如果找到，返回true,否则返回false
        public func isContain(substring: String) ->Bool {
            return (self as NSString).containsString(substring)
        }
        
        // MARK: Alpha+num API
        
        /// 判断字符串是否全是数字组成
        ///
        /// - returns:  若为全数字组成，返回true，否则返回false
        public func isOnlyNumbers() ->Bool {
            let set = NSCharacterSet.decimalDigitCharacterSet().invertedSet
            let range = (self as NSString).rangeOfCharacterFromSet(set)
            
            return range.location == NSNotFound
        }
        
        /// 判断字符串是否全是字母组成
        ///
        /// - returns:  若为全字母组成，返回true，否则返回false
        public func isOnlyLetters() ->Bool {
            let set = NSCharacterSet.letterCharacterSet().invertedSet
            let range = (self as NSString).rangeOfCharacterFromSet(set)
            
            return range.location == NSNotFound
        }
        
        /// 判断字符串是否全是字母和数字组成
        ///
        /// - returns:  若为全字母和数字组成，返回true，否则返回false
        public func isAlphanum() ->Bool {
            let set = NSCharacterSet.alphanumericCharacterSet().invertedSet
            let range = (self as NSString).rangeOfCharacterFromSet(set)
            
            return range.location == NSNotFound
        }
        
        // MARK: Validation 确认 API
        
        /// 判断字符串是否是有效的邮箱格式
        ///
        /// - returns:  若为有效的邮箱格式，返回true，否则返回false
        public func isValidEmail() ->Bool {
            let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
            
            return predicate.evaluateWithObject(self)
        }
        
        
        
        
        
        
    }
    
extension String {
    
    var length1: Int {
        
        return self.characters.count
    }
//    var length: Int {
//        
//        return self.characters.count
//    }
    // MARK: - Localization
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedWithArgs(args: CVarArgType...) -> String {
        switch (args.count) { // temporary fix until swift not know how to pass variadic parameters
        case 0: return String.localizedStringWithFormat(self.localized())
        case 1: return String.localizedStringWithFormat(self.localized(), args[0])
        case 2: return String.localizedStringWithFormat(self.localized(), args[0], args[1])
        case 3: return String.localizedStringWithFormat(self.localized(), args[0], args[1], args[2])
        case 4: return String.localizedStringWithFormat(self.localized(), args[0], args[1], args[2], args[3])
        case 5: return String.localizedStringWithFormat(self.localized(), args[0], args[1], args[2], args[3], args[4])
        default: fatalError("Too much arguments")
        }
    }
    
    // MARK: - Regex
    
    func match(pattern: String, options: NSRegularExpressionOptions = NSRegularExpressionOptions(rawValue: 0)) -> Bool
    {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, length1)) != nil
    }
    
    func matches(pattern: String, options: NSRegularExpressionOptions = NSRegularExpressionOptions(rawValue: 0)) -> [NSTextCheckingResult]
    {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return []
        }
        return regex.matchesInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, length1))//length
    }
    
    func stringByReplacingMatches(pattern: String, options: NSRegularExpressionOptions = NSRegularExpressionOptions(rawValue: 0), template: String) -> String {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return self
        }
        return regex.stringByReplacingMatchesInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, length1), withTemplate: template)
    }
    
}





extension String {
    // MARK:
    // MARK: public. Instance
    
//    func componentsSeparatedByCharacter(separator: Character) -> [String] {
//        // prepare array of components
//        let componentsArray = split(self, maxSplit: Int.max, allowEmptySlices: false, isSeparator: { $0 == separator})
//        return componentsArray
//    }
    
//    func MD5() -> String {
//        let data = (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)
//        if let hash = data?.MD5() {
//            return hash
//        }
//        
//        return self
//    }
    
    func stringByReplacingTokensWithStrings(tokenValuePairs: (token: String, value: String)...) -> String {
        // find all tokens and then replace them with provided values
        var result = self
        for pair in tokenValuePairs {
            result = result.stringByReplacingOccurrencesOfString("{\(pair.token)}", withString: pair.value, options: .CaseInsensitiveSearch)
        }
        return result
    }
    
    func trimFirst(n: Int) -> String {//advance(self.startIndex, n)
        return self.substringFromIndex(self.startIndex.advancedBy(n))
    }
    
    func trimLast(n: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(-1*n))
    }
    
    func sizeWithFont(font: UIFont, maxWidth: CGFloat) -> CGSize {
        let nsString = self as NSString
        let attributes = [NSFontAttributeName: font]
        let size = nsString.boundingRectWithSize(CGSize(width: maxWidth, height: CGFloat.max),
            options: .UsesLineFragmentOrigin,
            attributes: attributes,
            context: nil).size
        
        return size
    }
    
    // MARK: static
    
    static func uniqueString() -> String {
        return NSProcessInfo.processInfo().globallyUniqueString
    }
    
}






