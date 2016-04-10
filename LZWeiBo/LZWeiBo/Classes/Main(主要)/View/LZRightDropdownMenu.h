//
//  LZRightDropdownMenu.h
//  LZWeiBo
//
//  Created by apple on 16/4/9.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZRightDropdownMenu;

@protocol LZRightDropdownMenuDelegate <NSObject>
@optional
- (void)rightDropdownMenuDidDismiss:(LZRightDropdownMenu *)menu;
- (void)rightDropdownMenuDidShow:(LZRightDropdownMenu *)menu;
@end

@interface LZRightDropdownMenu : UIView

+ (instancetype)menu;

@property (nonatomic, weak) id<LZRightDropdownMenuDelegate> delegate;

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
