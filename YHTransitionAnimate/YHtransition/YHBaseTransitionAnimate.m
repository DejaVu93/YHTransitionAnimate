//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "YHBaseTransitionAnimate.h"


@implementation YHBaseTransitionAnimate

- (instancetype)init {
    if (self = [super init]) {
        self.duration = 0.3;
        self.transitionMode = kYHTransitionPush;
    }
    return self;
}

- (instancetype)initWithPushed:(YHTransitionPush)pushCallback poped:(YHTransitionPop)popCallback {
    if (self = [self init]) {
        self.animationPopCallback = popCallback;
        self.animationPushedCallback = pushCallback;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning

// Usually no overwriting is required
// Implement this method if you need to change the animation time
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

// Subclass implementation method
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
#ifdef DEBUG
    NSLog(@"Subclass must override it if you want to make it works well.");
#endif
}

// Usually no overwriting is required, unless something needs to be done after the animation is complete
- (void)animationEnded:(BOOL)transitionCompleted {
    // Now just do nothing.
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (UINavigationControllerOperationPush == operation) {
        self.transitionMode = kYHTransitionPush;
        if (self.animationPushedCallback) {
            self.animationPushedCallback(fromVC, toVC, self);
        }
    } else if (operation == UINavigationControllerOperationPop) {
        self.transitionMode = kBGTransitionPop;
        toVC.navigationController.delegate = nil;
        if (self.animationPopCallback) {
            self.animationPopCallback(fromVC, toVC, self);
        }
    }
    return self;
}

- (UIView *)toView:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *toView = nil;
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        toView = toVC.view;
    }
    toView.frame = [transitionContext finalFrameForViewController:toVC];
    return toView;
}

- (UIView *)fromView:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = nil;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    } else {
        fromView = fromVC.view;
    }
    fromView.frame = [transitionContext initialFrameForViewController:fromVC];
    return fromView;
}


@end
