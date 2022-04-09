//
//  YBTabBar.m
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//


#import <UIKit/UIKit.h>

@class YBTabBar,YBConfig;

@protocol YBTabBarDelegate <NSObject>

@optional
- (void)ybTabBar:(YBTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end



@interface YBTabBar : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(YBConfig *)config;

//- (void)addTabBarButtonWithTabBarImageUrl:(NSString *)imageUrl title:(NSString *)title;
- (void)addTabBarButtonNorImageUrl:(NSString *)norImageUrl
                       selImageUrl:(NSString *)selImageUrl
                             title:(NSString *)title;


@property (nonatomic, weak) id<YBTabBarDelegate> delegate;

@end
