//
//  YBTabBarButton.h
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//


#import <UIKit/UIKit.h>

@class YBTabBarButton;

@protocol YBTabBarButtonDelegate <NSObject>

- (void)ybTabBarIconButtonClick:(YBTabBarButton *)ybButton;

@end

@interface YBTabBarButton : UIControl
@property (nonatomic, weak) id<YBTabBarButtonDelegate> delegate;

/// 背景图片按钮
@property (nonatomic, strong) UIButton *iconBtn;
/// 文字
@property (nonatomic, strong) UILabel *titleLbl;


/// 设置自定义tabbar的图片和文字
/// @param image 图片URL路径
/// @param title 标题文字
- (void)setTabBarImageUrl:(NSString *)image title:(NSString *)title;

@end
