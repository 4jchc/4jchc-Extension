//
//  Array.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/10.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit


extension Array {
    
    func indexOf<T: Equatable>(x: T) -> Int? {
        for i in 0...self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }
    
   
}
