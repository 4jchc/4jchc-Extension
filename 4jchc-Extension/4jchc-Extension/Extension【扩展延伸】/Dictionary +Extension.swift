


//MARK: - 字典合并
///  extension 类似于 OC 的分类，给类/对象添加方法
extension Dictionary {
    
    ///  将给定的字典（可变的）合并到当前字典
    ///  mutating 表示函数操作的字典是可变类型的
    ///  泛型(随便一个类型)，封装一些函数或者方法，更加具有弹性
    ///  任何两个 [key: value] 类型匹配的字典，都可以进行合并操作
    mutating func merge<K, V>(dict: [K: V]) {
        for (k, v) in dict {
            // 字典的分类方法中，如果要使用 updateValue，需要明确的指定类型
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
    
    
    
    
    init(elements : [(Key, Value)]) {
        self.init()
        for (key, value) in elements {
            self[key] = value
        }
    }
    
    func mapValues<T>(f : Value -> T) -> [Key:T] {
        var result : [Key:T] = [:]
        for (key, value) in self {
            result[key] = f(value)
        }
        return result
    }
    
    
    
    
}

