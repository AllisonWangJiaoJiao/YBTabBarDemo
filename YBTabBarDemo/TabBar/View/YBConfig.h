//
//  YBConfig.h
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YBTabBarViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YBConfig : NSObject


/**
 单例模式
 */
+ (instancetype)shareInstance;

/**
 * 默认配置/恢复默认配置(有需调用)
 */
- (void)configNormal;

/** 标题的默认颜色 (默认为 #808080) */
@property (nonatomic, strong) UIColor *norTitleColor;
/** 标题的选中颜色 (默认为 #d81e06)*/
@property (nonatomic, strong) UIColor *selTitleColor;
/** 图片的size (默认 50*50) */
@property (nonatomic, assign) CGSize imageSize;
/** 标签的高度 (默认 12) */
@property (nonatomic, assign) CGFloat titleHeight;
/** 标题文字大小 (默认 12.f) */
@property (nonatomic, assign) CGFloat titleFont;
/** 标题的偏移值 (标题距离底部的距离 默认 5.f) */
@property (nonatomic, assign) CGFloat titleOffset;
/** 图片的偏移值 (图片距离顶部的距离 默认 5.f) */
@property (nonatomic, assign) CGFloat imageOffset;
/** 背景图片的偏移值 (图片距离顶部的距离 默认 20.f) */
@property (nonatomic, assign) CGFloat bgImageOffset;

@end

NS_ASSUME_NONNULL_END
