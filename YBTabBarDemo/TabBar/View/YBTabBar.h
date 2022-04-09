//
//  YBTabBar.m
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//


#import <UIKit/UIKit.h>

@class YBTabBar;

@protocol YBTabBarDelegate <NSObject>

@optional
- (void)ybTabBar:(YBTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface YBTabBar : UIView

- (void)addTabBarButtonWithTabBarImageUrl:(NSString *)imageUrl title:(NSString *)title;


@property (nonatomic, weak) id<YBTabBarDelegate> delegate;

@end
