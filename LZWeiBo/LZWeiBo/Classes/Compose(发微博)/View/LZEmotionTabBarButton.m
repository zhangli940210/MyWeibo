//
//  LZEmotionTabBarButton.m
//  LZWeiBo
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionTabBarButton.h"

@implementation LZEmotionTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置文字颜色
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
        // 设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    // 按钮高亮所做的一切操作都不在了
}

@end
