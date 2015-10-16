//
//  LIUAnimationManager.m
//  NavigationAnimation
//
//  Created by liujun on 15/10/9.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "LIUAnimationManager.h"
#import "LIUBaseAnimation.h"

#import "LIUCustomAnimation.h"
#import "LIUTransitionAnimation.h"

static LIUAnimationManager *_shareManager;

@interface LIUAnimationManager ()

@property (nonatomic,strong)id<UIViewControllerAnimatedTransitioning> customAnimation;

@end

@implementation LIUAnimationManager

+ (LIUAnimationManager *)shareManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareManager = [[LIUAnimationManager alloc]init];
    });
    
    return _shareManager;
}

- (id<UIViewControllerAnimatedTransitioning>)transitionWithAnimationType:(AnimationType)type AndAnimationTime:(AnimationTime)time {
    
    self.customAnimation = nil;
    
    //根据传进来的type，获取动画
    self.customAnimation = [self getAnimatedTransitioningWithType:type];
    
    if (self.customAnimation) {
        LIUBaseAnimation *baseAnimation = self.customAnimation;
        if (time == AnimationTimePush) {
            baseAnimation.type = PushingTypePush;
        }else {
            baseAnimation.type = PushingTypePop;
        }
    }
    
    return self.customAnimation;
}


//根据传进来的枚举类型获取转场动画
- (id<UIViewControllerAnimatedTransitioning>)getAnimatedTransitioningWithType:(AnimationType)type {
    
    switch (type) {
        case AnimationTypeDefault:
            return nil;
            break;
        case AnimationTypeCustom:
            return [LIUCustomAnimation new];
            break;
            case AnimationTypeTransition:
            return [LIUTransitionAnimation new];
        default:
            break;
    }
}

@end
