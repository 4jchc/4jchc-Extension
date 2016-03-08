//
//  CALayer+PauseAimate.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/3/8.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit

extension CALayer {
    /**暂停动画*/
    func pauseAnimation() {
        let pauseTime = convertTime(CACurrentMediaTime(), fromLayer: nil)
        speed = 0
        timeOffset = pauseTime
    }
    /**恢复动画*/
    func resumeAnimation() {
        let pausedTime = timeOffset
        speed = 1
        timeOffset = 0.0
        beginTime = 0.0
        let timeSincePause = convertTime(CACurrentMediaTime(), fromLayer: nil) - pausedTime
        beginTime = timeSincePause
    }
}


