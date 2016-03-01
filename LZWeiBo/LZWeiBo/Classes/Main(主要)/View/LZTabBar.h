//
//  LZTabBar.h
//  LZWeiBo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZTabBar;

#warning 因为LZTabBar继承自UITabBar，所以成为LZTabBar的代理，也必须实现UITabBar的代理协议
@protocol LZTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(LZTabBar *)tabBar;
@end 

@interface LZTabBar : UITabBar

@property (nonatomic, weak) id<LZTabBarDelegate> delegate;
@end