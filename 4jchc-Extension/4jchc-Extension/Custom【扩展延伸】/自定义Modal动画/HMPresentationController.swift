//
//  HMPresentationController.swift
//  01-UIAlertPopoverPresentationController
//
//  Created by 蒋进 on 15/12/26.
//  Copyright © 2015年 sijichcai. All rights reserved.
//

import UIKit

class HMPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {
        
       // return CGRectMake(0, 50, self.containerView!.frame.size.width, self.containerView!.frame.size.height - 100);
       return CGRectInset(self.containerView!.bounds, 0, 100);
    }
    override func presentationTransitionWillBegin() {
        
        NSLog("presentationTransitionWillBegin");
        self.presentedView()!.frame = self.containerView!.bounds;
        self.containerView?.addSubview(self.presentedView()!)
  
    }

    override func presentationTransitionDidEnd(completed: Bool) {
        
        NSLog("presentationTransitionDidEnd");
    }

    override func dismissalTransitionDidEnd(completed: Bool) {
        
        NSLog("dismissalTransitionDidEnd");
        self.presentedView()?.removeFromSuperview()
  
    }
    override func dismissalTransitionWillBegin() {
        
        NSLog("dismissalTransitionWillBegin");
    }

    

    
    

}
