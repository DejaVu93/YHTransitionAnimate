# YHTransitionAnimate
## 自定义转场动画 (Custom transition animation)

示例图片(The sample picture)

![](https://github.com/DejaVu93/YHTransitionAnimate/blob/master/Untitled.gif?raw=true)

### 使用方法(Method of use)

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
