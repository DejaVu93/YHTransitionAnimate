//
//  AppStateHandler.m
//  YHTransitionAnimate
//
//  Created by BlackHumor on 2019/2/23.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "AppStateHandler.h"

@implementation AppStateHandler

+ (UIViewController *_Nullable)getCurrentVC {
    UIViewController *result = nil;
    // 获取默认的window
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    // 获取window的rootViewController
    result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *) result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *) result visibleViewController];
    }
    return result;
}

@end
