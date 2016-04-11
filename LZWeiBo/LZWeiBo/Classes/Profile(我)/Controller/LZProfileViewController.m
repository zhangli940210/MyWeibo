//
//  HWProfileViewController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "LZProfileViewController.h"
#import "LZAttentionsViewController.h"
#import "LZFansViewController.h"
#import "LZSettingViewController.h"

@interface LZProfileViewController ()

/** 正在显示的控制器*/
@property (nonatomic, weak) UIViewController *showingVC;

@end

@implementation LZProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //从ios7开始当scrollView在导航控制器,会自动调用边距64
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 添加子控制器
    [self addChildViewController:[[LZAttentionsViewController alloc] init]];
    [self addChildViewController:[[LZFansViewController alloc] init]];
    
    // 添加子控件
    [self setup];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
}

- (void)setting
{
    LZSettingViewController *settingVC = [[LZSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)setup
{
    // 创建seg对象
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"关注", @"粉丝"]];
    // 设置主题颜色
    seg.tintColor = LZColor(0, 158, 161);
    // 设置默认选中为0
    seg.selectedSegmentIndex = 0;
    // 设置选中的颜色
    NSMutableDictionary *segTextAtt = [NSMutableDictionary dictionary];
    segTextAtt[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [seg setTitleTextAttributes:segTextAtt forState:UIControlStateSelected];
    // 设置选中和没有选中的背景色
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [seg setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 添加监听事件
    [seg addTarget:self action:@selector(chooseController:) forControlEvents:UIControlEventValueChanged];
    // 默认调用一次chooseController方法
    [self chooseController:seg];
    
    // 赋值
    self.navigationItem.titleView = seg;
}

- (void)chooseController: (UISegmentedControl *)seg
{
    // 1.移除正在显示的view
    [self.showingVC.view removeFromSuperview];
    // 2.判断
    if (seg.selectedSegmentIndex == 0) {
        // 2.添加要显示的view
        // 2.1设置好要显示的控制器
        self.showingVC = self.childViewControllers[0];
        
    } else {
        self.showingVC = self.childViewControllers[1];
    }
    
    self.showingVC.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height);
    // 2.2添加要显示的控制器的view
    [self.view addSubview:self.showingVC.view];
}


@end
