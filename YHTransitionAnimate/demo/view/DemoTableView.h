//
//  Created by BlackHumor on 2019/2/23.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DemoTableViewDelegate <NSObject>

@optional
- (void)transTionAnimateConvention:(NSString *)itemName imageView:(UIImageView *)imageView;

@end
@interface DemoTableView : UITableView

@property (nonatomic,weak)id <DemoTableViewDelegate> demoDelegate;

@end

NS_ASSUME_NONNULL_END
