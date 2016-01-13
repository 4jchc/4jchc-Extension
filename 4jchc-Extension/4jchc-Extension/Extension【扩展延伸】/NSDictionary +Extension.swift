


import Foundation

import Foundation

//TODO make it template
public typealias JDictMappingBlock = (key : AnyObject, object : AnyObject) -> AnyObject

//TODO make it template
public typealias JDictOptionMappingBlock = (key : AnyObject, object : AnyObject) -> AnyObject?

//TODO make it template
public typealias JDictMappingWithErrorBlock = (key : AnyObject, object : AnyObject, outError : NSErrorPointer) -> AnyObject?

//TODO make it template
public typealias JDictPredicateBlock = (key : AnyObject, object : AnyObject) -> Bool













public extension NSDictionary {
    
    func dictionaryByAddingObjectsFromDictionary(dictionary: NSDictionary) -> NSDictionary {
        
        let result = mutableCopy() as! NSMutableDictionary
        
        dictionary.enumerateKeysAndObjectsUsingBlock({ (key: AnyObject!, value: AnyObject!, stop: UnsafeMutablePointer<ObjCBool>) -> () in
            result[key as! NSCopying] = value
        })
        
        return result.copy() as! NSDictionary
    }
    
    
    
    func toString(keyValueSeparator: String, elementSeparator: String)->String{
        
        let paraStr = NSMutableString()
        
        self.enumerateKeysAndObjectsUsingBlock({ (key, obj, stop) -> Void in
            if paraStr.length == 0{
                paraStr.appendString("\(key)\(keyValueSeparator)\(obj)")
            }else{
                paraStr.appendString("\(elementSeparator)\(key)\(keyValueSeparator)\(obj)")
            }
        })
        return paraStr as String
    }
    
    
    
    
    
    
    func map(block: JDictMappingBlock) -> NSDictionary {
        
        let result = NSMutableDictionary(capacity : count)
        
        enumerateKeysAndObjectsUsingBlock({(key : AnyObject!, object : AnyObject!, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            
            let newObject : AnyObject = block(key: key, object: object)
            result[key as! NSCopying] = newObject
        })
        
        return result.copy() as! NSDictionary
    }
    
    func forceMap(block: JDictOptionMappingBlock) -> NSDictionary {
        
        let result = NSMutableDictionary(capacity : count)
        
        enumerateKeysAndObjectsUsingBlock({(key : AnyObject!, object : AnyObject!, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            
            let newObject : AnyObject? = block(key : key, object : object)
            if let value : AnyObject = newObject {
                result[key as! NSCopying] = value
            }
        })
        
        return result.copy() as! NSDictionary
    }
    
    func map(block: JDictMappingWithErrorBlock, outError: NSErrorPointer) -> NSDictionary? {
        
        var result: NSMutableDictionary? = NSMutableDictionary(capacity: count)
        
        enumerateKeysAndObjectsUsingBlock({(key: AnyObject!, object: AnyObject!, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            let newObject : AnyObject? = block(key: key, object: object, outError: outError)
            
            if let value : AnyObject = newObject {
                
                result![key as! NSCopying] = value
            } else {
                
                if stop != nil {
                    stop.memory = true
                }
                result = nil
            }
        })
        
        return result?.copy() as? NSDictionary
    }
    
    func mapKey(block: JDictMappingBlock) -> NSDictionary {
        
        let result = NSMutableDictionary(capacity : count)
        
        enumerateKeysAndObjectsUsingBlock({(key : AnyObject!, object : AnyObject!, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            
            let newKey : AnyObject = block(key: key, object: object)
            //NSParameterAssert(newKey)
            result[newKey as! NSCopying] = object
        })
        
        return result.copy() as! NSDictionary
    }
    
    func count(predicate: JDictPredicateBlock) -> Int {
        
        var count = 0
        
        enumerateKeysAndObjectsUsingBlock({(key : AnyObject!, object : AnyObject!, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            if predicate(key: key, object: object) {
                ++count
            }
        })
        return count
    }
    
    func filter(predicate: JDictPredicateBlock) -> NSDictionary {
        
        let result = NSMutableDictionary(capacity: count)
        
        enumerateKeysAndObjectsUsingBlock({(key : AnyObject!, object : AnyObject!, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            
            if predicate(key: key, object: object) {
                result[key as! NSCopying] = object
            }
        })
        
        return result.copy() as! NSDictionary
    }
    

    func mapValues<Key, T>(f : AnyObject -> T) -> [Key:T] {
        var result : [Key:T] = [:]
        enumerateKeysAndObjectsUsingBlock { (key, value, _) -> Void in
            if let key = key as? Key {
                let value = f(value)
                result[key] = value
            }
        }
        return result
    }
   
}


public extension NSDictionary {
    public enum Errors: ErrorType {
        case UnableToWriteToFile(String)
        case UnableToReadFromURL(NSURL)
    }
    public func hasKey<T: AnyObject where T: Equatable>(key: T) -> Bool {
        return allKeys.filter { element in return (element as? T) == key }.count == 1
    }
    public func writePlistToFile(path: String, atomically: Bool) throws {
        if !writeToFile(path, atomically: atomically) {
            throw Errors.UnableToWriteToFile(path)
        }
    }
    public static func readPlistFromURL(plistURL: NSURL) throws -> NSDictionary {
        guard let plist = NSDictionary(contentsOfURL: plistURL) else {
            throw Errors.UnableToReadFromURL(plistURL)
        }
        return plist
    }
}












