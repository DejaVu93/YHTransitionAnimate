//
// Created by BlackHumor on 2019-02-16.
// Copyright (c) 2019 BlackHat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YHLang(key) \
[YHLanguage get:(key)]

@interface YHLanguage : NSObject

+ (NSString *)get:(NSString *)key;

@end