//
//  LZDropdownMenu.m
//  LZWeiBo
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 m14a. All rights reserved.
// LZDropdownMenu创建的对象，是一个看不见的蒙版，clearColor

#import "LZDropdownMenu.h"

@interface LZDropdownMenu ()

/**
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation LZDropdownMenu

#pragma mark - 懒加载
- (UIImageView *)containerView
{
    if (_containerView == nil) {
        // 添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.width = 217;
        containerView.height = 217;
        containerView.userInteractionEnabled = YES; // 开启交互
        [self addSubview:containerView];
        _containerView = containerView;
    }
    return _containerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)menu
{
    return [[self alloc] init];
}

- (void)setContent:(UIView *)content
{
    _content = content;
    
    // 调整内容的位置
    content.x = 10;
    content.y = 15;
    
    // 调整内容的宽度
    content.width = self.containerView.width - 2 * content.x;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}

/**
 *  显示
 */
- (void)showFrom:(UIView *)from
{
    // 1.获得最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    // 2.添加自己到窗口上
    [window addSubview:self];
    
    // 3.设置尺寸
    self.frame = window.bounds;
    
    // 4.调整灰色图片的位置
    self.containerView.x = (self.width - self.containerView.width) * 0.5;
    self.containerView.y = 50;
}

/**
 *  销毁
 */
- (void)dismiss
{
    [self removeFromSuperview];
}

@end
