//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YHMoveTransition)
/**
 * Set a target view to show. When push, it will transition to
 * the target view. and when pop, it will pop from the target view.
 */
@property(nonatomic, strong, nonnull) UIView *yh_toTargetView;

@property(nonatomic, strong, nullable) UIView *yh_targetClickView;

/**
 *
 */
@property(nonatomic, copy, nullable) NSString *yh_targetControllerName;

@end
