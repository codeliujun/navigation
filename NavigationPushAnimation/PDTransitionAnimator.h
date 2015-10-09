//
//  PDTransitionAnimator.h
//  NavigationPushAnimation
//
//  Created by liujun on 15/10/8.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    AnimationTypeDismiss,
    AnimationTypePresent,
};

@interface PDTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign)AnimationType animationType;

@end
