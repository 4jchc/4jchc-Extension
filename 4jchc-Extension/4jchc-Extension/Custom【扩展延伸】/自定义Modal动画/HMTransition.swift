//
//  HMTransition.swift
//  01-UIAlertPopoverPresentationController
//
//  Created by 蒋进 on 15/12/26.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

class HMTransition: NSObject,UIViewControllerTransitioningDelegate {
    
    
    
    
//    let three:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("three")
//    three.modalPresentationStyle = UIModalPresentationStyle.Custom
//    three.transitioningDelegate = HMTransition.sharedHMTransition
//    self.presentViewController(three, animated: true, completion: nil)
    
    
    
    
    
    
    
    //单例
    static let sharedHMTransition = HMTransition()

    
    //MARK: - UIViewControllerTransitioningDelegate
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
            return HMPresentationController.init(presentedViewController: presented, presentingViewController: presenting)
        

    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let anim:HMAnimatedTransitioning = HMAnimatedTransitioning()
        anim.presented = true
        return anim;
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let anim:HMAnimatedTransitioning = HMAnimatedTransitioning()
        anim.presented = false
        return anim;
    }

    

    

}
