//
//  QRCodeViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()

// 冲击波视图
@property (weak, nonatomic) IBOutlet UIImageView *scanLineView;
// 冲击波视图顶部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scanLineCons;
// 扫描容器高度约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeightCons;
// 底部视图
@property (weak, nonatomic) IBOutlet UITabBar *customTabBar;


@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 1.开始冲击波动画
    [self startAnimation];
}

// 退出界面
- (IBAction)closeBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 执行动画
 */
- (void)startAnimation
{
    // 让约束从顶部开始
    // 从-300 开始
    self.scanLineCons.constant = - self.containerHeightCons.constant;
    [self.scanLineView layoutIfNeeded];
    // 执行冲击波动画
    [UIView animateWithDuration:2.0 animations:^{
        // 1.修改约束
        self.scanLineCons.constant = self.containerHeightCons.constant;
        // 设置动画指定的次数
        [UIView setAnimationRepeatCount:MAXFLOAT];
        // 2.强制更新界面
        [self.scanLineView layoutIfNeeded];
    }];
}


@end
