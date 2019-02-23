# YHTransitionAnimate
## custom transition animation



### The sample picture

![](https://github.com/DejaVu93/YHTransitionAnimate/blob/master/Untitled.gif?raw=true)

### Method of use

```
ProdDetailViewController *vc = [[ProdDetailViewController alloc] initWithTargetImageName:itemName];
self.navigationController.yh_customAnimation = YES;
self.pushTransitionAnimate = [[YHTransitionAnimate alloc] initWithPushed:^(UIViewController *fromVC, UIViewController *toVC, YHBaseTransitionAnimate *transition) {
        YHTransitionAnimate *move = (YHTransitionAnimate *) transition;
        move.targetClickedView = imageView;
        self.navigationController.yh_customAnimation = NO;
    } poped:^(UIViewController *fromVC, UIViewController *toVC, YHBaseTransitionAnimate *transition) {
    }];
self.navigationController.delegate = self.pushTransitionAnimate;
[self.navigationController pushViewController:vc animated:YES];
```
