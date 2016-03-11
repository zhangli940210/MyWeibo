//
//  LZTabBarViewController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "LZHomeViewController.h"
#import "LZMessageCenterViewController.h"
#import "LZDiscoverViewController.h"
#import "LZProfileViewController.h"
#import "LZNavigationController.h"
#import "LZTabBar.h"

@interface LZTabBarViewController () <LZTabBarDelegate>

@end

@implementation LZTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    LZHomeViewController *home = [[LZHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    LZMessageCenterViewController *messageCenter = [[LZMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    LZDiscoverViewController *discover = [[LZDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    LZProfileViewController *profile = [[LZProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    // 2.更换系统自带的tabbar
    LZTabBar *tabBar = [[LZTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = LZColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    LZNavigationController *nav = [[LZNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

#pragma mark - LZTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(LZTabBar *)tabBar
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
