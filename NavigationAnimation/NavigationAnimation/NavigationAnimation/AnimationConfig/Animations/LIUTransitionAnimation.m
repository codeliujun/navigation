//
//  LIUTransitionAnimation.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/16.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUTransitionAnimation.h"

@implementation LIUTransitionAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    //得到controller
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromeViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    
    CATransition *transition = [[CATransition alloc]init];
    if (self.type == PushingTypePush) {
        transition.type = @"pageCurl";
        transition.subtype = kCATransitionPush;
    }else {
        transition.type = @"pageUnCurl";
        transition.subtype = kCATransitionReveal;
    }
    
    transition.duration = [self transitionDuration:transitionContext];
    //[toViewController.view.layer addAnimation:transition forKey:nil];
    [[transitionContext containerView].layer addAnimation:transition forKey:nil];
    //申明动画已经结束 这个地方一定一定要记住的
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [NSThread sleepForTimeInterval:[self transitionDuration:transitionContext]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//        });
//    });
}


@end
