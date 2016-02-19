//
//  NSIndexPath.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/2/12.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

extension NSIndexPath{
    
    public func toString() -> String {
        // Padding: Make sure that, when sorted, there are no inconsistencies!
        let padding = 20
        return String(format: "%\(padding)d-%\(padding)d", section, row)
    }
}
