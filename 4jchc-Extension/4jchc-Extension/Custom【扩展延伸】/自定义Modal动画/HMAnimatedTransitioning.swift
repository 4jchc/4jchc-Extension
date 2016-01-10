//
//  HMAnimatedTransitioning.swift
//  01-UIAlertPopoverPresentationController
//
//  Created by 蒋进 on 15/12/26.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

class HMAnimatedTransitioning: NSObject,UIViewControllerAnimatedTransitioning {
    
 
    var presented:Bool!
    let duration:Double = 1.0;

    
  
    //MARK:  - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return duration;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if (self.presented == true) {
            
            let toView:UIView = transitionContext.viewForKey(UITransitionContextToViewKey)!
   
            toView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_2), 1, 1, 0);
            
            //toView.y = -toView.height;
            //toView.x = toView.width;
            
            
//            toView.y = -toView.height
//            toView.x = -toView.width

            UIView.animateWithDuration(duration, animations: { () -> Void in
                

                toView.layer.transform = CATransform3DIdentity;
//
//                toView.y = 0
//                toView.x = 0
                },completion: { (finished) -> Void in
                    
                    transitionContext.completeTransition(true)
                })
            
        } else {
    
            UIView.animateWithDuration(duration, animations: { () -> Void in
                
                let fromView:UIView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
//                fromView.y = -fromView.height;
//                fromView.x = -fromView.width;

                //fromView.layer.transform = CATransform3DMakeRotation(radians(45.0), 0.0, 1.0, 0.0);
                
                fromView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_2), 1, 1, 0);

                }, completion: { (finished) -> Void in
                    
                transitionContext.completeTransition(true)
            })
            
            
            
//            
//            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
//            let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
//            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
//            
//            transitionContext.containerView()!.addSubview(toView)
//            toView.alpha = 0
//            
//            UIView.animateWithDuration(duration, animations: { () -> Void in
//                toView.alpha = 1
//                }) { (finished) -> Void in
//                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
//            }
            

        }
    }
    

    


}
