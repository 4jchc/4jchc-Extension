
//
//  ViewController.swift
//  4jchc-Extension
//
//  Created by 蒋进 on 16/2/10.
//  Copyright © 2016年 sijichcai. All rights reserved.
//



/*


import UIKit



extension WSPagePreview: UIScrollViewDelegate {
    
    //MARK:  正在滚动
    ///  正在滚动
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        currentPage = Int(floor(scrollView.contentOffset.x / scrollView.bounds.width))
        pageControl!.currentPage = currentPage
    }
    
    
    
    
    //MARK:  告诉系统需要缩放哪个控件
    ///  告诉系统需要缩放哪个控件
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return iconView
    }
    
    
    //MARK:  重新调整配图的位置
    ///  重新调整配图的位置
    // view: 被缩放的视图
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming")
        
        // 注意: 缩放的本质是修改transfrom, 而修改transfrom不会影响到bounds, 只有frame会受到影响
        //        print(view?.bounds)
        //        print(view?.frame)
        
        var offsetX = (UIScreen.mainScreen().bounds.width - view!.frame.width) * 0.5
        var offsetY = (UIScreen.mainScreen().bounds.height - view!.frame.height) * 0.5
        //        print("offsetX = \(offsetX), offsetY = \(offsetY)")
        offsetX = offsetX < 0 ? 0 : offsetX
        offsetY = offsetY < 0 ? 0 : offsetY
        
        scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
        
        
        
        if scale == scrollView.minimumZoomScale {
            scrollView.pagingEnabled = true
        } else {
            scrollView.pagingEnabled = false
        }
    }
    
    
    
}
//当用户松手时
//imageView.transform的scale > 设置的最小缩放比例, 直接调用 scrollViewDidEndZooming
//imageView.transform的scale < 设置的最小缩放比例系统会先动画到最小缩放比例-再调用 scrollViewDidEndZooming


import UIKit

class LHImageView: UIImageView {
    // 重写覆盖父类的属性
    override var transform:CGAffineTransform{
        // 当设置的缩放比例小于指定的最小缩放比例时.重新设置
        didSet{
            if transform.a < LHPhotoBrowserCellMinimumZoomScale{
                transform = CGAffineTransformMakeScale(LHPhotoBrowserCellMinimumZoomScale,LHPhotoBrowserCellMinimumZoomScale)
            }
        }
    }
    
}





*/

