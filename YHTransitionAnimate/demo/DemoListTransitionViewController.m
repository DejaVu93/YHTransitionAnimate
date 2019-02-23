//
// Created by BlackHumor on 2019-02-16.
// Copyright (c) 2019 BlackHat. All rights reserved.
//

#import "DemoListTransitionViewController.h"
#import "DemoTableView.h"
#import "ProdDetailViewController.h"
#import "UINavigationController+pushingStatus.h"
#import "YHTransitionAnimate.h"

@interface DemoListTransitionViewController () <DemoTableViewDelegate>

@property(nonatomic, strong) DemoTableView *demoTableView;
@property(nonatomic, strong) YHTransitionAnimate *pushTransitionAnimate;

@end

@implementation DemoListTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = YHLang(@"LABEL.HOME.TITLE");
    [self.view addSubview:self.demoTableView];
}


#pragma amrk - DemoTableViewDelegate

- (void)transitionAnimateConvention:(NSString *)itemName imageView:(UIImageView *)imageView {
    ProdDetailViewController *vc = [[ProdDetailViewController alloc] initWithTargetImageName:itemName];
    self.navigationController.yh_customAnimation = YES;
    self.pushTransitionAnimate = [[YHTransitionAnimate alloc] initWithPushed:^(UIViewController *fromVC, UIViewController *toVC, YHBaseTransitionAnimate *transition) {
        YHTransitionAnimate *move = (YHTransitionAnimate *) transition;
        move.targetClickedView = imageView;
        self.navigationController.yh_customAnimation = NO;
    }                                                                  poped:^(UIViewController *fromVC, UIViewController *toVC, YHBaseTransitionAnimate *transition) {
    }];
    self.navigationController.delegate = self.pushTransitionAnimate;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - lazy loading

- (DemoTableView *)demoTableView {
    if (_demoTableView == nil) {
        _demoTableView = [[DemoTableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight - NavHeight) style:UITableViewStylePlain];
        _demoTableView.demoDelegate = self;
    }
    return _demoTableView;
}

@end
