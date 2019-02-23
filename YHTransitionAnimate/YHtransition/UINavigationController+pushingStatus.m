//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "UINavigationController+pushingStatus.h"
#import <objc/runtime.h>

@implementation UINavigationController (pushingStatus)

- (BOOL)yh_customAnimation {
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    if (number) {
        return number.boolValue;
    }
    self.yh_customAnimation = NO;
    return NO;
}

- (void)setYh_customAnimation:(BOOL)bg_customAnimation {
    SEL key = @selector(yh_customAnimation);
    objc_setAssociatedObject(self, key, @(bg_customAnimation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yh_shouldIgnorePushingViewControllers {
    NSNumber *number = objc_getAssociatedObject(self, _cmd);
    if (number) {
        return number.boolValue;
    }
    self.yh_shouldIgnorePushingViewControllers = NO;
    return NO;
}

- (void)setYh_shouldIgnorePushingViewControllers:(BOOL)bg_shouldIgnorePushingViewControllers {
    SEL key = @selector(yh_shouldIgnorePushingViewControllers);
    objc_setAssociatedObject(self, key, @(bg_shouldIgnorePushingViewControllers), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
