//
//  LIUBaseAnimation.h
//  NavigationAnimation
//
//  Created by liujun on 15/10/9.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PushingType) {
    PushingTypePush,
    PushingTypePop,
};

@interface LIUBaseAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign)PushingType type;

@end
