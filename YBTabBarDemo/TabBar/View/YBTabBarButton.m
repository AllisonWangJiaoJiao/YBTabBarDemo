//
//  YBTabBarButton.m
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//


#import "YBTabBarButton.h"
#import "Masonry.h"

@interface YBTabBarButton ()
@property (nonatomic, strong) UILabel *titleLbl;
@end

@implementation YBTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}



- (void)addSubviews {
    
    [self addSubview:self.iconBtn];
    [self addSubview:self.titleLbl];
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        //make.bottom.equalTo(self.mas_centerY).offset(8);
        make.height.width.mas_equalTo(60);
    }];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconBtn.mas_bottom).offset(5);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(12);
    }];
}

- (void)iconButtonClick:(YBTabBarButton *)ybButton {
    if ([self.delegate respondsToSelector:@selector(ybTabBarIconButtonClick:)]) {
        [self.delegate ybTabBarIconButtonClick:self];
    }
}

#pragma mark -- lazy load

- (UIButton *)iconBtn {
    if (!_iconBtn) {
        _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //_iconBtn.backgroundColor =  [UIColor cyanColor];
        _iconBtn.contentMode = UIViewContentModeScaleAspectFill;
        [_iconBtn addTarget:self action:@selector(iconButtonClick:) forControlEvents:UIControlEventTouchDown];
    }
    return _iconBtn;
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.font = [UIFont systemFontOfSize:12];
        //_titleLbl.textColor = KColorFromRGB(0x916d55);
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        //_titleLbl.backgroundColor = [UIColor redColor];
    }
    return _titleLbl;
}

/// 设置自定义tabbar的图片和文字
/// @param image 图片URL路径
/// @param title 标题文字
- (void)setTabBarImageUrl:(NSString *)image title:(NSString *)title {

    self.titleLbl.text = title;
    [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"quanzi"] forState:UIControlStateNormal];
    [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"quanzi_s"] forState:UIControlStateSelected];

}

@end
