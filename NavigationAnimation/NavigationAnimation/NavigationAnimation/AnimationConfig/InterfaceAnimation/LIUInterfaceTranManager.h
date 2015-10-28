//
//  LIUInterfaceTranManager.h
//  NavigationAnimation
//
//  Created by liujun on 15/10/28.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LIUInterfaceTranManager : UIPercentDrivenInteractiveTransition

+ (LIUInterfaceTranManager *)manager;

@property (nonatomic,assign) BOOL interfaceing;
- (void)writeToViewController:(UIViewController *)viewController;

@end
