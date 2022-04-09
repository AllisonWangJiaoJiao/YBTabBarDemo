//
//  UIColor+YB.h
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/9.
//


#import <UIKit/UIKit.h>

@interface UIColor (YB)

//16进制颜色转换
+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color Alpha:(CGFloat)alpha;

@end
