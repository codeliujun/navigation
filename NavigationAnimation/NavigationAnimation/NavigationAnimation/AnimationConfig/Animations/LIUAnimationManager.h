//
//  LIUAnimationManager.h
//  NavigationAnimation
//
//  Created by liujun on 15/10/9.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    AnimationTypeDefault,
    AnimationTypeCustom,
    AnimationTypeTransition,
};

typedef NS_ENUM(NSUInteger, AnimationTime) {
    AnimationTimePush,
    AnimationTimePop,
};

@interface LIUAnimationManager : NSObject

@property (nonatomic,assign)AnimationType animationType;
@property (nonatomic,assign)AnimationTime animationTime;

+ (LIUAnimationManager *)shareManager;
//转场动画
- (id<UIViewControllerAnimatedTransitioning>)transitionWithAnimationType:(AnimationType)type AndAnimationTime:(AnimationTime)time;

@end
