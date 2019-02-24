//
//  AppConst.h
//  YHTransitionAnimate
//
//  Created by BlackHumor on 2019/2/16.
//  Copyright © 2019 BlackHat. All rights reserved.
//

#ifndef AppConst_h
#define AppConst_h

#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define iPhoneX ((ScreenHeight == 812.f || ScreenHeight == 896.f ) ? YES : NO)
#define NavHeight (iPhoneX ? 88.f : 64.f)

#endif /* AppConst_h */
