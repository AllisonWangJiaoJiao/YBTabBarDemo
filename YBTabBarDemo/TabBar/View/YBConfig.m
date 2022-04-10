//
//  YBConfig.m
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/9.
//

#import "YBConfig.h"
#import "UIColor+YB.h"

@implementation YBConfig

static id _instance = nil;

+ (instancetype)shareInstance {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        [self configNormal];
    });
    return _instance;
}

- (void)configNormal {
    _norTitleColor = [UIColor colorWithHexString:@"#808080"];
    _selTitleColor = [UIColor colorWithHexString:@"#d81e06"];
    _imageSize = CGSizeMake(40, 40);
    _titleFont = 12.f;
    _titleOffset = 5.f;
    _imageOffset = 5.f;
    _titleHeight = 12.f;
    _bgImageOffset = 20.f;
}

@end
