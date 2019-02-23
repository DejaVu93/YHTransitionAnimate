//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "UIViewController+YHMoveTransition.h"
#import <objc/runtime.h>

@implementation UIViewController (YHMoveTransition)

- (UIView *)yh_toTargetView {
    return objc_getAssociatedObject(self, @selector(yh_toTargetView));
}

- (void)setYh_toTargetView:(UIView *)yh_toTargetView {
    objc_setAssociatedObject(self, @selector(yh_toTargetView), yh_toTargetView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)yh_targetClickView {
    return objc_getAssociatedObject(self, @selector(yh_targetClickView));
}

- (void)setYh_targetClickView:(UIView *)yh_targetClickView {
    objc_setAssociatedObject(self, @selector(yh_targetClickView), yh_targetClickView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)yh_targetControllerName {
    return objc_getAssociatedObject(self, @selector(yh_targetControllerName));
}

- (void)setYh_targetControllerName:(NSString *)yh_targetControllerName {
    objc_setAssociatedObject(self, @selector(yh_targetControllerName), yh_targetControllerName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
