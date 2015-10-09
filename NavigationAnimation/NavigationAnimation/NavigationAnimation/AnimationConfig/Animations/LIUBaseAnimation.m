//
//  LIUBaseAnimation.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/9.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUBaseAnimation.h"

@implementation LIUBaseAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
}


@end
