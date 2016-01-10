


import Foundation

public func removeObject<T : Equatable>(object: T, inout fromArray array: [T]){
    
    let index = array.indexOf(object)
    if let index = index {
        array.removeAtIndex(index)
    }
}
