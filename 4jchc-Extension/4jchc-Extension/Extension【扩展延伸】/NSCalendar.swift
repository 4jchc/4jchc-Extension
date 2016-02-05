//
//  NSCalendar.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/1/13.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

import Foundation
//Calendar日历；历法；日程表
extension NSCalendar {
    
    func lastWeekday() -> Int {
        var lastWeekday: Int
        if self.firstWeekday == 1 {
            lastWeekday = 7
        }
        else {
            lastWeekday = self.firstWeekday - 1
        }
        return lastWeekday
    }
}