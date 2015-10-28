//
//  LIUBaseInterfaceAnimation.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/28.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUBaseInterfaceAnimation.h"

@implementation LIUBaseInterfaceAnimation


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.7;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //拿到2个VC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //添加
    [[transitionContext containerView] addSubview:toVC.view];
    toVC.view.transform = CGAffineTransformScale(toVC.view.transform, 0.9, 0.9);
    [[transitionContext containerView] bringSubviewToFront:fromVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.transform = CGAffineTransformTranslate(fromVC.view.transform, [UIScreen mainScreen].bounds.size.width, 0);
        toVC.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
}

@end
