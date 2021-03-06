//
//  LIUCustomAnimation.m
//  NavigationPushAnimation
//
//  Created by liujun on 15/10/8.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUCustomAnimation.h"

@implementation LIUCustomAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromConntroller = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        [[transitionContext containerView] addSubview:toView];
        
    }else {
        [[transitionContext containerView] addSubview:toViewController.view];
    }
    
    toViewController.view.alpha = 0.0f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        if (self.type == PushingTypePush) {
            fromConntroller.view.transform = CGAffineTransformMakeTranslation(320, 0);
            //fromConntroller.view.transform = CGAffineTransformMakeScale(0.5,0.5 );
            toViewController.view.alpha = 1.0;
        }
        if (self.type == PushingTypePop) {
//            toViewController.view.frame = [UIScreen mainScreen].bounds;
            toViewController.view.transform = CGAffineTransformMakeScale(1,1);
            toViewController.view.alpha = 1.0f;
        }
        
    } completion:^(BOOL finished) {
        
        //申明动画已经结束
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}


@end
