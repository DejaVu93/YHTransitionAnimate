//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "YHTransitionAnimate.h"
#import "UIViewController+YHMoveTransition.h"

@implementation YHTransitionAnimate

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    if (containerView == nil) {
        return;
    }
    if (self.targetClickedView == nil) {
#ifdef DEBUG
        NSLog(@"targetClickedView property can't be nil.");
#endif
        return;
    }

    if (self.transitionMode == kYHTransitionPush) {
        UIView *toView = [self toView:transitionContext];
        UIView *tempView = [self.targetClickedView snapshotViewAfterScreenUpdates:NO];
        tempView.frame = [self.targetClickedView convertRect:self.targetClickedView.bounds toView:containerView];
        [containerView addSubview:toView];
        [containerView addSubview:tempView];
        toView.alpha = 1.0;

        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        toVC.yh_toTargetView.alpha = 0.0;
        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        CGRect targetRect = [toVC.yh_toTargetView convertRect:toVC.yh_toTargetView.bounds toView:containerView];
        [UIView animateWithDuration:self.duration animations:^{
            tempView.frame = targetRect;
        }                completion:^(BOOL finished) {
            toView.alpha = 1.0;
            tempView.alpha = 0.0;
            toVC.yh_toTargetView.alpha = 1.0;
            fromVC.yh_targetClickView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else if (self.transitionMode == kBGTransitionPop) {
        UIView *toView = [self toView:transitionContext];
        UIView *fromView = [self fromView:transitionContext];
        UIView *tempView = [containerView.subviews lastObject];

        toView.alpha = 1.0;
        fromView.alpha = 1.0;
        tempView.alpha = 1.0;

        UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        fromVC.yh_toTargetView.alpha = 0.0;

        [containerView addSubview:toView];
        [containerView addSubview:tempView];

        CGRect originalRect = [self.targetClickedView convertRect:self.targetClickedView.bounds toView:containerView];
        [UIView animateWithDuration:self.duration animations:^{
            tempView.frame = originalRect;
        }                completion:^(BOOL finished) {
            toView.alpha = 1.0;
            tempView.alpha = 0.0;
            [tempView removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
#ifdef DEBUG
        NSLog(@"Only support kYHTransitionPush and kBGTransitionPop mode.");
#endif
    }
}

@end
