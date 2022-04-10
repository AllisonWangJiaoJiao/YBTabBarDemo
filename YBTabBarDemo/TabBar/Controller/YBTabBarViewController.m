//
//  YBTabBarViewController.m
//  YBTabBarDemo
//
//  Created by Allison on 2022/4/8.
//

#import "YBTabBarViewController.h"
#import "YBConfig.h"

@interface YBTabBarViewController () <YBTabBarDelegate>

/**
 *  自定义的tabbar
 */
@property (strong, nonatomic) YBTabBar *customTabBar;

@end

@implementation YBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化tabbar
    [self setupTabbar];
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setupTabbar {
    //YBTabBar *customTabBar = [[YBTabBar alloc] init];
    //customTabBar.backgroundColor = [UIColor yellowColor];
    //customTabBar.frame = self.tabBar.bounds;
    //CGRect mainFrame = customTabBar.frame;
    //mainFrame.size.height = 82;
    //customTabBar.frame = mainFrame;
    //customTabBar.delegate = self;
    //[self.tabBar addSubview:customTabBar];
    //self.customTabBar = customTabBar;

    //配置信息
    YBConfig *config = [YBConfig shareInstance];
//    config.titleFont = 12;
//    config.norTitleColor = [UIColor blackColor];
//    config.selTitleColor = [UIColor cyanColor];
//    config.titleOffset = 5;
//    config.imageOffset = 10;
//    config.imageSize = CGSizeMake(50, 50);
//    config.titleHeight = 12;
//    config.bgImageOffset = 20;
    
    YBTabBar *customTabBar = [[YBTabBar alloc] initWithFrame:self.tabBar.bounds config:config];
    customTabBar.backgroundColor = [UIColor yellowColor];
    CGRect mainFrame = customTabBar.frame;
    mainFrame.size.height = 88;
    customTabBar.frame = mainFrame;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    [customTabBar bringSubviewToFront:self.tabBar];
    self.customTabBar = customTabBar;
    
//    CGSize viewSize = self.view.bounds.size;
//    CGFloat tabBarStartingY = viewSize.height;
//    CGFloat tabBarHeight = 100;
//    //YBTabBar *customTabBar = [[YBTabBar alloc] initWithFrame: CGRectMake(0, tabBarStartingY - tabBarHeight, viewSize.width, tabBarHeight)];
//    YBTabBar *customTabBar = [[YBTabBar alloc] initWithFrame: CGRectMake(0, tabBarStartingY - tabBarHeight, viewSize.width, tabBarHeight) config:config];
//    customTabBar.backgroundColor = [UIColor clearColor];
//    customTabBar.delegate = self;
//    [self.view addSubview:customTabBar];
//    self.customTabBar = customTabBar;
}



/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)ybTabBar:(YBTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
    NSLog(@"----from:%ld, to:%ld ",from,to);
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers {
    // 1.首页
    UIViewController *home = [[UIViewController alloc] init];
//    home.tabBarItem.badgeValue = @"N";
    home.view.backgroundColor = [UIColor redColor];
    [self setupChildViewController:home title:@"首页" imageName:@"shouye" selectedImageName:@"shouye_s"];
    
    // 2.消息
    UIViewController *message = [[UIViewController alloc] init];
//    message.tabBarItem.badgeValue = @"8";
    message.view.backgroundColor = [UIColor orangeColor];
    [self setupChildViewController:message title:@"消息" imageName:@"quanzi" selectedImageName:@"quanzi_s"];
    
    // 3.首页
    UIViewController *home1 = [[UIViewController alloc] init];
//    home1.tabBarItem.badgeValue = @"19";
    home1.view.backgroundColor = [UIColor blueColor];
    [self setupChildViewController:home1 title:@"发现" imageName:@"shouye" selectedImageName:@"shouye_s"];
    
    // 4.消息
    UIViewController *message1 = [[UIViewController alloc] init];
//    message1.tabBarItem.badgeValue = @"99";
    message1.view.backgroundColor = [UIColor greenColor];
    [self setupChildViewController:message1 title:@"广场" imageName:@"quanzi" selectedImageName:@"quanzi_s"];
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮

//    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
//    [self.customTabBar addTabBarButtonWithTabBarImageUrl:selectedImageName title:childVc.title];
    [self.customTabBar addTabBarButtonNorImageUrl:imageName
                                      selImageUrl:selectedImageName
                                            title:title];

}



@end
