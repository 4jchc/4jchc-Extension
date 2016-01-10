//import Foundation
//import CoreData
//
//@objc public enum NSObjectPropertyType: Int {
//    
//    case All, ReadOnly, ReadWrite
//}
//
//public extension NSObject {
//    
//    public func propertyNames(includeNSObject: Bool = false, type: NSObjectPropertyType = .All) -> [String] {
//        
//        var propertyNames: [String] = [];
//        
//        // retrieve the properties via the class_copyPropertyList function
//        var count: UInt32 = 0;
//        let myClass: AnyClass = self.classForCoder;
//        let properties = class_copyPropertyList(myClass, &count);
//        
//        // iterate each objc_property_t struct
//        for var i: UInt32 = 0; i < count; i++ {
//            let property = properties[Int(i)];
//            
//            // retrieve the property name by calling property_getName function
//            let cname = property_getName(property);
//            
//            // covert the c string into a Swift string
//            if let name = String.fromCString(cname) {
//                
//                switch type {
//                case .All:
//                    break
//                case .ReadOnly:
//                    let capitalized = (name as NSString).capitalizedString //capitalizedFirstLetter
//                    let selector = "set\(capitalized):"
//                    if self.respondsToSelector(Selector(selector)) {
//                        continue
//                    }
//                    
//                case .ReadWrite:
//                    let capitalized = name.capitalizedString ////capitalizedFirstLetter
//                    let selector = "set\(capitalized):"
//                    if !self.respondsToSelector(Selector(selector)) {
//                        continue
//                    }
//                }
//                
//                propertyNames.append(name);
//            }
//        }
//        
//        // release objc_property_t structs
//        free(properties);
//        
//        //Get properties of superclass until NSObject
//        
//        if let superClass = self.superclass as? NSObject.Type where !(superclass is NSManagedObject.Type) {
//            
//            if !includeNSObject && superClass === NSObject.self {
//                return propertyNames
//            }
//         
//            propertyNames = propertyNames.union(superClassObject.propertyNames(includeNSObject, type: type))
//        }
//        
//        return propertyNames;
//    }
//    
//    public func classOfProperty(name: String) -> AnyClass? {
//        
//        if let type = self.propertyType(name) {
//            
//            var typeClass: AnyClass? = NSClassFromString(type)
//            
//            if typeClass === NSArray.self || typeClass === NSSet.self || typeClass === NSDictionary.self  {
//                typeClass = self.objcPropertyCollectionObjectType(name)
//            }
//            return typeClass
//        }
//        
//        return nil
//    }
//    
//    public func propertyType(name:String)->String? {
//        
//        var propertyType: String? = nil
//        var propertyAttributes: String? = nil
//        
//        // Get Class of property.
//        let objectClass: AnyClass = object_getClass(self)
//        let property = class_getProperty(objectClass, name);
//        
//        // Try to get getter method.
//        if (property == nil)
//        {
//            //            char typeCString[256];
//            
//            let typeCString: UnsafeMutablePointer<Int8> = UnsafeMutablePointer<Int8>()
//            let getter = class_getInstanceMethod(objectClass, NSSelectorFromString(name));
//            method_getReturnType(getter, typeCString, 256);
//            propertyAttributes = String.fromCString(typeCString)
//            
//            // Mimic type encoding for `typeNameForTypeEncoding:`.
//            propertyType = self.typeNameForTypeEncoding(NSString(format: "T%", propertyAttributes!) as String);
//            
//            if (getter == nil)
//            { NSLog("No property called `%@` of %", name, self.className); }
//        }
//            
//            // Or go on with property attribute parsing.
//        else
//        {
//            // Get property attributes.
//            //            const char *propertyAttributesCString;
//            let propertyAttributesCString = property_getAttributes(property);
//            let propertyAttributes = String.fromCString(propertyAttributesCString)
//            
//            if (propertyAttributesCString == nil)
//            { print("Could not get attributes for property called `\(name)` of <\(self.className)>"); }
//            
//            // Parse property attributes.
//            if let splitPropertyAttributes = propertyAttributes?.componentsSeparatedByString(",") where splitPropertyAttributes.count > 0 {
//                // From Objective-C Runtime Programming Guide.
//                // xcdoc://ios//library/prerelease/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
//                let encodeType = splitPropertyAttributes[0]
//                let splitEncodeType = encodeType.componentsSeparatedByString("\"")
//                propertyType = (splitEncodeType.count > 1) ? splitEncodeType[1] : self.typeNameForTypeEncoding(encodeType)
//            }
//            else
//            { print("Could not parse attributes for property called `\(name)` of <\(self.className)>") }
//        }
//        
//        return propertyType;
//    }
//    
//    func typeNameForTypeEncoding(typeEncoding: String) -> String?
//    {
//        // From Objective-C Runtime Programming Guide.
//        // xcdoc://ios//library/prerelease/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
//        let typeNamesForTypeEncodings = ["Tc" : "char",
//            "Ti" : "int",
//            "Ts" : "short",
//            "Tl" : "long",
//            "Tq" : "long long",
//            "TC" : "unsigned char",
//            "TI" : "unsigned int",
//            "TS" : "unsigned short",
//            "TL" : "unsigned long",
//            "TQ" : "unsigned long long",
//            "Tf" : "float",
//            "Td" : "double",
//            "Tv" : "void",
//            "T*" : "char*",
//            "T" : "id",
//            "T#" : "Class",
//            "T:" : "SEL",
//            
//            "T^c" : "char*",
//            "T^i" : "int*",
//            "T^s" : "short*",
//            "T^l" : "long*",
//            "T^q" : "long long*",
//            "T^C" : "unsigned char*",
//            "T^I" : "unsigned int*",
//            "T^S" : "unsigned short*",
//            "T^L" : "unsigned long*",
//            "T^Q" : "unsigned long long*",
//            "T^f" : "float*",
//            "T^d" : "double*",
//            "T^v" : "void*",
//            "T^*" : "char**"]
//        
//        // Recognized format.
//        if typeNamesForTypeEncodings.keys.contains(typeEncoding)
//        { return typeNamesForTypeEncodings[typeEncoding] }
//        
//        // Struct property.
//        if typeEncoding.hasPrefix("T{")
//        {
//            // Try to get struct name.
//            let delimiters = NSCharacterSet(charactersInString:"{=")
//            let components = typeEncoding.componentsSeparatedByCharactersInSet(delimiters)
//            
//            var structName: String = ""
//            
//            if (components.count > 1)
//            { structName = components[1]; }
//            
//            // Falls back to `struct` when unknown name encountered.
//            if structName == "?" {
//                structName = "struct"
//            }
//            
//            return structName;
//        }
//        
//        // Falls back to raw encoding if none of the above.
//        return typeEncoding;
//    }
//}
//
//
//extension NSObject {
//    
//    var swiftProperties: [String] {
//        
//        var propertyNames = [String]()
//        for children in Mirror(reflecting: self).children {
//            
//            if let name = children.label{
//                propertyNames.append(name)
//            }
//        }
//        
//        //        if let superClass = self.superclass as? NSObject.Type {
//        //
//        //            if superClass === NSObject.self {
//        //                return propertyNames
//        //            }
//        //
//        //            let superClassObject = superClass.init()
//        //            propertyNames = propertyNames.union(superClassObject.swiftProperties)
//        //        }
//        
//        return propertyNames
//    }
//    
//    var swiftReadWriteProperties: [String] {
//        
//        let propertyNames = self.swiftProperties
//        var readWrite: [String] = []
//        
//        for name in propertyNames {
//            
//            let capitalized = name.capitalizedFirstLetter
//            let selector = "set\(capitalized):"
//            if self.respondsToSelector(Selector(selector)) {
//                readWrite.append(name)
//            }
//        }
//        
//        return readWrite
//    }
//    
//    public func swiftClassOfProperty(name: String) -> AnyClass? {
//        
//        if let type = self.swiftPropertyType(name) {
//            
//            let components = type.stringByReplacingOccurrencesOfString(">", withString: "").componentsSeparatedByString("<")
//            
//            let bundleClass = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String + "." + components.last!
//            if  let returnClass = NSClassFromString(bundleClass) {
//                
//                return returnClass
//            }
//        }
//        
//        return nil
//    }
//    
//    public func swiftPropertyType(name:String)->String?
//    {
//        let type: Mirror = Mirror(reflecting:self)
//        
//        for child in type.children {
//            if child.label! == name
//            {
//                return String(child.value.dynamicType)
//            }
//        }
//        return nil
//    }
//    
//    func setKeyValues(keyValueDictionary: [String: AnyObject]) {
//        
//        let readWriteProperties = self.swiftReadWriteProperties.union(self.propertyNames(false, type: .ReadWrite))
//        
//        for property in readWriteProperties {
//            
//            
//            if var value = keyValueDictionary[property] {
//                
//                var RVTManagedObjectType: RVTManagedObject.Type?
//                
//                if let swiftClass = self.swiftClassOfProperty(property) as? RVTManagedObject.Type {
//                    
//                    RVTManagedObjectType = swiftClass
//                }
//                if let objcClass = self.classOfProperty(property) as? RVTManagedObject.Type {
//                    RVTManagedObjectType = objcClass
//                }
//                
//                if let RVTManagedObject = RVTManagedObjectType {
//                    if let jsonValue = value as? [[String : AnyObject]] {
//                        var allObjects: [AnyObject] = []
//                        for dict in jsonValue {
//                            allObjects.append(RVTManagedObject.newObject(dict))
//                        }
//                        value = allObjects
//                    }
//                    else if let jsonValue = value as? [String : AnyObject] {
//                        value = RVTManagedObject.newObject(jsonValue)
//                    }
//                }
//                
//                self.setValue(value, forKey: property)
//            }
//        }
//    }
//    
//    var className: String {
//        return self.dynamicType.className
//    }
//    
//    class var className: String {
//        return String(self)
//    }
//    
//    public func objcPropertyCollectionObjectType(key: String) -> AnyClass? {
//        
//        return nil
//    }
//    public class func getClassName() -> String {
//        
//        return reflect(self).summary.componentsSeparatedByString(".").last!
//    }
//}