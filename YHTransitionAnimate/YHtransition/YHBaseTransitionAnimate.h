//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHBaseTransitionAnimate;

typedef void(^YHTransitionPush)(UIViewController *fromVC, UIViewController *toVC, YHBaseTransitionAnimate *transition);

typedef YHTransitionPush YHTransitionPop;

typedef NS_ENUM(NSUInteger, YHTransitionMode) {
    kYHTransitionPush,    // Push
    kBGTransitionPop      // Pop
};

@interface YHBaseTransitionAnimate : NSObject <UIViewControllerAnimatedTransitioning,
        UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
/**
 *  push/Pop Animate Default is 0.5s.
 */
@property(nonatomic, assign) NSTimeInterval duration;

/**
 * Transition animation mode
 * default:kBGTransitionPush
 */
@property(nonatomic, assign) YHTransitionMode transitionMode;

/**
 * push animation call
 */
@property(nonatomic, copy) YHTransitionPush animationPushedCallback;

@property(nonatomic, copy) YHTransitionPop animationPopCallback;


- (instancetype)initWithPushed:(YHTransitionPush)pushCallback poped:(YHTransitionPop)popCallback;

- (UIView *)toView:(id <UIViewControllerContextTransitioning>)transitionContext;

- (UIView *)fromView:(id <UIViewControllerContextTransitioning>)transitionContext;

@end
