//
//  第三方框架总结.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/2/25.
//  Copyright © 2016年 sijichcai. All rights reserved.
//

import UIKit



//MARK: - SDWebImage

/*
// 立马显示最新的进度值(防止因为网速慢, 导致显示的是其他图片的下载进度)
self.progressView.setProgress(self.topic!.pictureProgress, animated: true)
// 设置图片带进度
self.imageView.sd_setImageWithURL(NSURL(string: topic!.large_image!),placeholderImage: nil, options: .CacheMemoryOnly, progress: { [weak self] (receivedSize, expectedSize) -> Void in
    
    self!.progressView.hidden = false
    self!.topic!.pictureProgress =  CGFloat(receivedSize)/CGFloat(expectedSize)
    self!.progressView.setProgress(self!.topic!.pictureProgress, animated: false)
    
    }) { [weak self] (image, error, cacheType, imageURL) -> Void in
        self!.progressView.hidden = true
}
*/
