//
//  LZDropdownMenu.h
//  LZWeiBo
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZDropdownMenu;

@protocol LZDropdownMenuDelegate <NSObject>
@optional
- (void)dropdownMenuDidDismiss:(LZDropdownMenu *)menu;
- (void)dropdownMenuDidShow:(LZDropdownMenu *)menu;
@end

@interface LZDropdownMenu : UIView

+ (instancetype)menu;

@property (nonatomic, weak) id<LZDropdownMenuDelegate> delegate;

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
