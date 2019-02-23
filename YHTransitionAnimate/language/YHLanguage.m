//
// Created by BlackHumor on 2019-02-16.
// Copyright (c) 2019 BlackHat. All rights reserved.
//

#import "YHLanguage.h"


@implementation YHLanguage

static NSBundle *bundle = nil;
static NSString *lang = @"en";

+ (void)initialize {
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defs objectForKey:@"AppleLanguages"];
    NSString *current = languages[0];
    [self setLanguage:current];
}

+ (void)setLanguage:(NSString *)l {
    if ([l hasPrefix:@"zh"]) {
        l = @"zh-Hans";
    }
    lang = l;
    NSString *path = [[NSBundle mainBundle] pathForResource:l ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}


+ (NSString *)get:(NSString *)key {
    return [bundle localizedStringForKey:key value:[NSString stringWithFormat:@"%@-%@", lang, key] table:nil];
}

@end
