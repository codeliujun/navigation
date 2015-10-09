//
//  MTHMainViewController.m
//  NavigationPushAnimation
//
//  Created by liujun on 15/10/8.
//  Copyright © 2015年 liujun. All rights reserved.
//

#import "MTHMainViewController.h"
#import "LIUCustomAnimation.h"
#import "ViewController.h"
#import "PDTransitionAnimator.h"

// MainViewController
@interface MTHMainViewController () <UINavigationControllerDelegate,UIViewControllerTransitioningDelegate,UITabBarControllerDelegate>

@property (nonatomic,strong) LIUCustomAnimation *customAnimator;
@property (nonatomic,strong) PDTransitionAnimator *minToMaxAnimator;
@property (nonatomic,strong) ViewController *nextVC;
// 交互控制器 (Interaction Controllers) 通过遵从 UIViewControllerInteractiveTransitioning 协议来控制可交互式的转场。
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@end

@implementation MTHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Demo";
    self.view.backgroundColor = [UIColor yellowColor];
    // 设置代理
    self.navigationController.delegate = self;
    // 设置转场动画
    self.customAnimator = [[LIUCustomAnimation alloc] init];
    self.minToMaxAnimator = [PDTransitionAnimator new];
    
    self.nextVC = [[ViewController alloc] init];
    // Present的代理和自定义设置
    _nextVC.transitioningDelegate = self;
    _nextVC.modalPresentationStyle = UIModalPresentationCustom; //(貌似有BUG)换成modalTransitionStyle = UIModalPresentationCustom
    
    // Push
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pushButton.frame = CGRectMake(140, 200, 40, 40);
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    // Present
    UIButton *modalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    modalButton.frame = CGRectMake(265, 500, 50, 50);
    [modalButton setTitle:@"Modal" forState:UIControlStateNormal];
    [modalButton addTarget:self action:@selector(modal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modalButton];
    
    // 实现交互操作的手势
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didClickPanGestureRecognizer:)];
    [self.navigationController.view addGestureRecognizer:panRecognizer];
}


- (void)push
{
    [self.navigationController pushViewController:_nextVC animated:YES];
}

- (void)modal
{
    [self presentViewController:_nextVC animated:YES completion:nil];
}

#pragma mark - UINavigationControllerDelegate iOS7新增的2个方法
// 动画特效
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    /**
     *  typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
     *     UINavigationControllerOperationNone,
     *     UINavigationControllerOperationPush,
     *     UINavigationControllerOperationPop,
     *  };
     */
    if (operation == UINavigationControllerOperationPush) {
        self.customAnimator.type = PushingTypePush;
        return self.customAnimator;
    }else{
        self.customAnimator.type = PushingTypePop;
        return self.customAnimator;
    }
}

// 交互
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController*)navigationController                           interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)animationController
{
    /**
     *  在非交互式动画效果中，该方法返回 nil
     *  交互式转场,自我理解意思是,用户能通过自己的动作来(常见:手势)控制,不同于系统缺省给定的push或者pop(非交互式)
     */
    return _interactionController;
}

#pragma mark - Transitioning Delegate (Modal)
// 前2个用于动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.minToMaxAnimator.animationType = AnimationTypePresent;
    return _minToMaxAnimator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.minToMaxAnimator.animationType = AnimationTypeDismiss;
    return _minToMaxAnimator;
}

// 后2个用于交互
- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return _interactionController;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

@end
