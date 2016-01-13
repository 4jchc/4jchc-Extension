//
//  NSManagedObject.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation
import CoreData

extension NSManagedObject {
    
    func addObject(object: NSManagedObject, intoSetWithKey key: String) {
        let items = self.mutableSetValueForKey(key);
        items.addObject(object)
    }
    
    func removeObject(object: NSManagedObject, fromSetWithKey key: String) {
        let items = self.mutableSetValueForKey(key);
        items.removeObject(object)
    }
    
    func removeAllObjectsFromSetWithKey(key: String) {
        let items = self.mutableSetValueForKey(key);
        items.removeAllObjects()
    }
}

func ==(lhs: NSManagedObjectID, rhs: NSManagedObjectID) -> Bool {
    return lhs.URIRepresentation() == rhs.URIRepresentation()
}

func ==(lhs: NSManagedObject, rhs: NSManagedObject) -> Bool {
    return lhs.objectID == rhs.objectID
}










