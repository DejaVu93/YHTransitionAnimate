//
//  Created by BlackHumor on 2019/2/23.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "DemoTableView.h"
#import "ProdDetailViewController.h"

@interface DemoTableView () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray *item;

@end

@implementation DemoTableView

static NSString *identifier = @"demoIdentifier";
static CGFloat rowHeight = 50;
static NSString *imgName = @"demoImage";
static const NSInteger count = 10;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if ([super initWithFrame:frame style:style]) {

        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = self.item[(NSUInteger) indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.item[(NSUInteger) indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *itemName = self.item[(NSUInteger) indexPath.row];
    UITableViewCell *cell = (UITableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
    UIImageView *image = cell.imageView;
    if ([self.demoDelegate respondsToSelector:@selector(transitionAnimateConvention:imageView:)]) {
        [self.demoDelegate transitionAnimateConvention:itemName imageView:image];
    }
}


#pragma mark - lazy loading

- (NSMutableArray *)item {
    if (_item == nil) {
        _item = @[].mutableCopy;
        for (NSInteger j = 1; j < count; j++) {
            [_item addObject:[NSString stringWithFormat:@"%@%i", imgName, j]];
        }
    }
    return _item;
}

@end
