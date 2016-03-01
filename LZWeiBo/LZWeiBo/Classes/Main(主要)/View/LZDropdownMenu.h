//
//  LZDropdownMenu.h
//  LZWeiBo
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZDropdownMenu : UIView

+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;
/**
 *  销毁
 */
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;
@end
