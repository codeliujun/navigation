//
//  LIUBaseViewController.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/9.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUBaseViewController.h"
#import "LIUAnimationManager.h"

@interface LIUBaseViewController ()
@end

@implementation LIUBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /*
     关于delegate的问题
     */
//    self.navigationController.delegate = self;
//    self.tabBarController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma --mark Navigation
//交互式转场
//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0){
//    return nil;
//}

//当push的时候就是需要修改动画了，那么就可以在这里面修改动画的enume的值来更改动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    
    LIUAnimationManager *manage = [LIUAnimationManager shareManager];
    AnimationTime time = AnimationTimePush;
    if  (operation == UINavigationControllerOperationPush) {
        time = AnimationTimePush;
    }
    if  (operation == UINavigationControllerOperationPop) {
        time = AnimationTimePop;
    }
    
    return [manage transitionWithAnimationType:AnimationTypeTransition AndAnimationTime:time];
    
}

//这个暂时没做
//- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
//                                                       toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
//    LIUAnimationManager *manage = [LIUAnimationManager shareManager];
//    AnimationTime time = AnimationTimePush;
//    if  ([tabBarController.viewControllers indexOfObject:toVC] == 1) {
//        time = AnimationTimePush;
//    }
//    if  ([tabBarController.viewControllers indexOfObject:toVC] == 0) {
//        time = AnimationTimePop;
//    }
//    
//    return [manage transitionWithAnimationType:AnimationTypeCustom AndAnimationTime:time];
//}



@end
