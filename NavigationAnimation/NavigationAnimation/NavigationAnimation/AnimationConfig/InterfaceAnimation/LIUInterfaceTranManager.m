//
//  LIUInterfaceTranManager.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/28.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUInterfaceTranManager.h"

@interface LIUInterfaceTranManager ()

@property (nonatomic,strong) UIViewController *currentVC;
@property (nonatomic,assign) BOOL shouldCompleted;

@end

@implementation LIUInterfaceTranManager


- (void)writeToViewController:(UIViewController *)viewController {
    
    self.currentVC = viewController;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizer:)];
    [viewController.view addGestureRecognizer:pan];
    
    
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan {
    
    CGPoint translation = [pan translationInView:pan.view.superview];
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            _interfaceing = YES;
            [self.currentVC dismissViewControllerAnimated:YES completion:nil];
            [self.currentVC.navigationController popViewControllerAnimated:YES];
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGFloat progress = translation.x/[UIScreen mainScreen].bounds.size.width;
            if (progress > 0.2) {
                NSLog(@"%@---%f",NSStringFromCGPoint(translation),progress);
                _shouldCompleted = YES;
            }
            [self updateInteractiveTransition:progress];
        }
            break;
      
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            _interfaceing = NO;
            if (!_shouldCompleted || pan.state == UIGestureRecognizerStateCancelled || translation.x < 0) {
                [self cancelInteractiveTransition];
            }else {
                [self finishInteractiveTransition];
            }
        }
            break;
            
        default:
            break;
    }
    
}

+ (LIUInterfaceTranManager *)manager {
    static LIUInterfaceTranManager *_manager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [LIUInterfaceTranManager manager];
    });
    return _manager;
}

@end
