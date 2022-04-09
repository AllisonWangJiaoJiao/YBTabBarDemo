//
//  YBTabBar.h
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//

#import "YBTabBar.h"
#import "YBTabBarButton.h"
#import "Masonry.h"
#import "YBConfig.h"

@interface YBTabBar()<YBTabBarButtonDelegate>
/// 当前选中的按钮
@property (nonatomic, weak) YBTabBarButton *selectedButton;
/// UITabBarItem对象数组
@property(nonatomic, strong)NSMutableArray *tabbarBtnArray;
/// norImage
@property (nonatomic, strong) NSMutableArray *norImageArrM;
/// SelImage
@property (nonatomic, strong) NSMutableArray *selImageArrM;
/// 背景图片
@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation YBTabBar

- (NSMutableArray *)tabbarBtnArray {
    if (!_tabbarBtnArray) {
        _tabbarBtnArray = [NSMutableArray array];
    }
    return  _tabbarBtnArray;
}

- (NSMutableArray *)norImageArrM {
    if (!_norImageArrM) {
        _norImageArrM = [NSMutableArray array];
    }
    return _norImageArrM;
}

- (NSMutableArray *)selImageArrM {
    if (!_selImageArrM) {
        _selImageArrM = [NSMutableArray array];
    }
    return _selImageArrM;
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-tab"]];
        _bgImageView.userInteractionEnabled = YES;
    }
    return _bgImageView;
}

- (instancetype)initWithFrame:(CGRect)frame config:(YBConfig *)config  {
    self = [super initWithFrame:frame];
       if (self) {
           [self addSubview:self.bgImageView];
           [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
               make.top.equalTo(self).offset([[YBConfig shareInstance]bgImageOffset]);
               make.left.right.equalTo(self);
               make.bottom.equalTo(self);
           }];
       }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self addSubview:self.bgImageView];
//        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self).offset(20);
//            make.left.right.equalTo(self);
//            make.bottom.equalTo(self);
//        }];
//    }
//    return self;
//}

- (void)addTabBarButtonNorImageUrl:(NSString *)norImageUrl
                       selImageUrl:(NSString *)selImageUrl
                             title:(NSString *)title {

    // 1.创建按钮
    YBTabBarButton *tabBarBtn = [[YBTabBarButton alloc] init];
    tabBarBtn.delegate = self;
    [self addSubview:tabBarBtn];
    // 2.设置数据
    [tabBarBtn setTabBarImageUrl:norImageUrl title:title];
    // 3.监听按钮点击
    [tabBarBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    // 4.将自定义的YBTabBarButton对象
    [self.tabbarBtnArray addObject:tabBarBtn];
    [self.norImageArrM addObject:norImageUrl];
    [self.selImageArrM addObject:selImageUrl];
    // 5.默认选中第0个按钮
    if (self.tabbarBtnArray.count == 1) {
        [self buttonClick:tabBarBtn];
        [tabBarBtn.iconBtn setSelected:YES];
    }

}

/// 当前点击的按钮置为选中样式
#pragma mark - 设置选中的ybButton
- (void)ybDealSelectButton:(YBTabBarButton *)ybButton  {
    for (int i = 0; i < self.tabbarBtnArray.count; i++) {
        YBTabBarButton *currentButton = self.tabbarBtnArray[i];
        if (currentButton == ybButton) {
            [currentButton.iconBtn setSelected:YES];
            currentButton.titleLbl.textColor = [[YBConfig shareInstance] selTitleColor];
            [currentButton.iconBtn setBackgroundImage:[UIImage imageNamed:self.selImageArrM[i]] forState:UIControlStateSelected];
        } else {
            [currentButton.iconBtn setSelected:NO];
            currentButton.titleLbl.textColor = [[YBConfig shareInstance] norTitleColor];
            [currentButton.iconBtn setBackgroundImage:[UIImage imageNamed:self.norImageArrM[i]] forState:UIControlStateSelected];
        }
    }
}

#pragma mark -  <YBTabBarButtonDelegate>
- (void)ybTabBarIconButtonClick:(YBTabBarButton *)ybButton {
    [self buttonClick:ybButton];
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(YBTabBarButton *)button {
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(ybTabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate ybTabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    [self ybDealSelectButton:self.selectedButton];

}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.tabbarBtnArray.count;
    CGFloat buttonY = 0;
    for (int index = 0; index<self.tabbarBtnArray.count; index++) {
        // 1.取出按钮
        YBTabBarButton *button = self.tabbarBtnArray[index];
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 3.绑定tag
        button.tag = index;
    }
}

@end
