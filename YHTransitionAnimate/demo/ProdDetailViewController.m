//
//  Created by BlackHumor on 2019/2/23.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#import "ProdDetailViewController.h"

@interface ProdDetailViewController ()
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ProdDetailViewController
- (instancetype)initWithTargetImageName:(NSString *)imageName {
    if (self == [super init]) {
        self.imageName = imageName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = YHLang(@"LABEL.DEMO.PRODUCT.DETAIL");
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.imageView];
    self.yh_toTargetView = self.imageView;
}


#pragma mark - lazy loading

-(UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 200)];
        _imageView.image = [UIImage imageNamed:self.imageName];
    }
    return _imageView;
}

@end
