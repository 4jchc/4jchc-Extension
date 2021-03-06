


import UIKit

import Foundation
/*
- Documents
- 需要保存由"应用程序本身"产生的文件或者数据，例如：游戏进度、涂鸦软件的绘图
- 目录中的文件会被自动保存在 iCloud
- 注意：不要保存从网络上下载的文件，否则会无法上架！

- Caches
- 保存临时文件，"后续需要使用"，例如：缓存图片，离线数据(地图数据)
- 系统不会清理 cache 目录中的文件
- 就要求程序开发时，"必须提供 cache 目录的清理解决方案"
- Preferences
- 用户偏好，使用 NSUserDefault 直接读写！
- 如果要想数据及时写入磁盘，还需要调用一个同步方法

- tmp
- 保存临时文件，"后续不需要使用"
- tmp 目录中的文件，系统会自动清理
- 重新启动手机，tmp 目录会被清空
- 系统磁盘空间不足时，系统也会自动清理
*/
//MARK: - 转换为基本数据类型
extension String{
    
    /**
     将String类型转换转换为Int类型
     
     - Parameter N/A
     - Returns:Int    String转换后的Int值
     */
    func toInt()->Int{
        return Int(self.toDouble())
    }
    /**
     将String类型转换转换为CGFloat类型
     
     - Parameter N/A
     - Returns:CGFloat    String转换后的CGFloat值
     */
    func toCGFloat()->CGFloat{
        return CGFloat(self.toDouble())
    }
    /**
     将String类型转换转换为Double类型
     
     - Parameter N/A
     - Returns:Double    String转换后的Double值
     */
    func toDouble()->Double{
        let lValue=Double(self)
        if (lValue != nil){
            return lValue!
        }else{
            return 0
        }
    }
    //MARK:  将新字符串按路径的方式拼接到原字符串上，即字符串直接添加'/'字符
    /**
    将新字符串按路径的方式拼接到原字符串上，即字符串直接添加'/'字符
    
    - Parameter str:String 要拼接上的字符串
    - Returns:N/A
    */
    func stringByAppendingPathComponent(str:String) -> String{
        
        return self.stringByAppendingFormat("/%@", str)
    }
}
extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}







//MARK: - 目录
extension String {
    ///  将当前字符串拼接到doc目录后面
    //MARK:  将当前字符串拼接到doc目录后面
    func documentPath() -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
        return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
        
        //let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
        //不可以这样写
        //return (NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path! as NSString).lastPathComponent
        
        //return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
    }
    
    
    //MARK:  将当前字符串拼接到cache目录后面
    ///  将当前字符串拼接到cache目录后面
    func cachePath() -> String {
        
        //         let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!  as NSString
        //         return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
        
        let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last
        
        //最后一个组成部分lastPathComponent
        //不可以这样写
        //return (NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path! as NSString).lastPathComponent
        
        return NSURL(fileURLWithPath: path!).URLByAppendingPathComponent(self).path!
    }
    
    
    //MARK:  将当前字符串拼接到tmp目录后面
    ///  将当前字符串拼接到tmp目录后面
    func tempPath() -> String {
        let path = NSTemporaryDirectory() as NSString
        return path.stringByAppendingPathComponent((self as NSString).lastPathComponent)
        //最后一个组成部分lastPathComponent
        
        // return NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(self).path!
        
    }

}






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
        //self.toData().base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        return self.toData().base64String()
    }
    
    public func base64Decode() -> String {
        //String(NSString(data: NSDataFromBase64String(), encoding: NSUTF8StringEncoding)!)
        return NSDataFromBase64String().toString()
    }
    
    public func toData() -> NSData {
        
        return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public func toDate(format: String) -> NSDate {
        

//            let dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = format
//            return dateFormatter.dateFromString(self)!

        return NSDate.dateFromString(self, format: format)
    }
    
    /** Extension扩展名 */
    var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    /** Deleting正在删除Extension扩展名 */
    var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    
    // MARK:  get characters
    
    public subscript (i: Int) -> Character {
        // advanced高级的上升 By
        return  self[self.startIndex.advancedBy(i)]
    }
    
    public subscript (i: Int) -> String {
        
        return String(self[i] as Character)
    }
    
    public subscript (r: Range<Int>) -> String {
        
        return substringWithRange(Range(start: self.startIndex.advancedBy(r.startIndex), end: self.startIndex.advancedBy(r.endIndex)))
        
    }
    
    
    
    
    // MARK  substring
    public func removeLastCharacter() -> String {
        
        return self.substringToIndex(self.endIndex.predecessor())
    }
    
    
    //MARK:  urlEncoded
    func urlEncoded() -> String {
        if let encoded = self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()){
            
            return encoded
        }
        
        return self
    }
    
 
    
    


    /// - returns: 字符串的长度
    //MARK: - 字符串的长度
    public func length() ->Int {
        return self.characters.count
    }
    
    // MARK: Trim整修 API
    //MARK:  去掉字符串 -前-后 的空格，根据参数确定是否过滤换行符
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
     //MARK:  去掉字符串 -前面 的空格，根据参数确定是否过滤换行符
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
     //MARK:  去掉字符串 -后面 的空格，根据参数确定是否过滤换行符
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
    
    
     //MARK:  获取子串的起始位置
    /// 获取子串的起始位置。
    ///
    /// - parameter substring 待查找的子字符串
    ///
    /// - returns:  如果找不到子串，返回NSNotFound，否则返回其所在起始位置
    public func location(substring: String) ->Int {
        return (self as NSString).rangeOfString(substring).location
    }
     //MARK:  根据起始位置和长度获取子串
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
     //MARK:  根据下标获取对应的字符。若索引正确，返回对应的字符，否则返回nil
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
    
    
    
    
    

    //MARK:  是否包含字符串NSStringCompareOptions
    /// 包含字符串NSStringCompareOptions
    func containsString(aString:String, compareOption: NSStringCompareOptions) -> Bool {
        if((self.rangeOfString(aString, options: compareOption)) != nil) {
            return true
        }
        else {
            return false
        }
    }
    //MARK: 是否包含字符串
    /// 包含字符串
    public func containsString(find: String) -> Bool {
        //return (self as NSString).containsString(find)
        return self.rangeOfString(find) != nil
        
    }
    //MARK: 是否包含小写字母
    /// 是否包含小写字母
    func containsLowercaseString(aString: String) -> Bool {
        
        return self.lowercaseString.rangeOfString(aString.lowercaseString) != nil
    }
    
    //MARK:  是否包含http
    /// 包含http
    func isHttpLocalPath() -> Bool {
        return self.rangeOfString("http") == nil
    }
    //MARK:  是否全是数字组成
    /// 判断字符串是否全是数字组成
    ///
    /// - returns:  若为全数字组成，返回true，否则返回false
    public func isOnlyNumbers() ->Bool {
        let set = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        let range = (self as NSString).rangeOfCharacterFromSet(set)
        
        return range.location == NSNotFound
    }
    //MARK:  是否全是字母组成
    /// 判断字符串是否全是字母组成
    ///
    /// - returns:  若为全字母组成，返回true，否则返回false
    public func isOnlyLetters() ->Bool {
        let set = NSCharacterSet.letterCharacterSet().invertedSet
        let range = (self as NSString).rangeOfCharacterFromSet(set)
        
        return range.location == NSNotFound
    }
    //MARK:  否全是字母和数字组成
    /// 判断字符串是否全是字母和数字组成
    ///
    /// - returns:  若为全字母和数字组成，返回true，否则返回false
    public func isAlphanum() ->Bool {
        let set = NSCharacterSet.alphanumericCharacterSet().invertedSet
        let range = (self as NSString).rangeOfCharacterFromSet(set)
        
        return range.location == NSNotFound
    }
    

    
}

//MARK:  - 正则表达式
extension String {
    
    

    // MARK: 判断字符串是否是有效的邮箱格式Validation 确认
    /// 若为有效的邮箱格式，返回true，否则返回false
    public func isValidEmail() ->Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        
        return predicate.evaluateWithObject(self)
    }
    
    ///  :returns:  href
    func hrefLink() -> (href: String, linkText: String)? {
        
        // 1. 匹配方案
        let pattern = "<a.*?href=\"(.*?)\".*?>(.*?)</a>"
        
        // 2. 实例化表达式
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.DotMatchesLineSeparators)
        
        // 3. 匹配
        if let result = regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, length())) {
            
            // href
            let range1 = result.rangeAtIndex(1)
            // link text
            let range2 = result.rangeAtIndex(2)
            
            let href = (self as NSString).substringWithRange(range1)
            let linkText = (self as NSString).substringWithRange(range2)
            
            return (href, linkText)
        }
        return nil
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /**
     正则表达式,判断邮箱格式
     
     - parameter address: 邮箱地址
     
     - returns: true or false
     */
    static func validateEmail(email address:String)->Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        guard let regex = RegexHelper(emailRegex) else{
            return false
        }
        return regex.match(address)
    }
    
    /**
     正则表达式 判断手机格式
     
     - parameter number: 手机号码
     
     - returns: ture or false
     */
    static func validatePhone(phone number:String)->Bool{
        let phoneRegex = "1[3|5|7|8|][0-9]{9}"
        guard let regex = RegexHelper(phoneRegex) else{
            print("init failed")
            return false
        }
        return regex.match(number)
    }
    
    //MARK:  结构体类
    ///  结构体类
    struct RegexHelper {
        let regex: NSRegularExpression?
        init?(_ pattern: String) {
            do{
                regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
            }catch{
                return nil
            }
        }
        
        func match(input: String) -> Bool {
            guard let res = regex?.matchesInString(input,options: [], range: NSMakeRange(0, input.characters.count)) else{
                return false
            }
            return res.count > 0
        }
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


//MARK: - ASCII格式
extension String {
    
    //MARK: ASCII格式
    func convertString(string: String) -> String {
        let data = string.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        return NSString(data: data!, encoding: NSASCIIStringEncoding) as! String
    }

    //MARK:  printable可印刷的 Ascii
    ///  printable可印刷的 Ascii
    func printableAscii() -> String {
    
    //return String(bytes: ((self.utf8).forEach({$0 >= 32})), encoding: NSUTF8StringEncoding) ?? ""
    return String(bytes: (self.utf8).filter{$0  >= 32 }, encoding: NSUTF8StringEncoding) ?? ""
    }//'filter' is unavailable: call the 'filter()' method on the sequence


    
}




// MARK: - Localization
extension String {
    
    var length1: Int {
        
        return self.characters.count
    }
    //    var length: Int {
    //
    //        return self.characters.count
    //    }
    
    
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
    
    // MARK:  Regex
    
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

    //MARK:  返回字符串的CGsiae
    ///  返回字符串的CGsiae
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





