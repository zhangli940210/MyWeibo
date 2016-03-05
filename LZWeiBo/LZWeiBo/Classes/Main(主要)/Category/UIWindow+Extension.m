//
//  UIWindow+Extension.m
//  LZWeiBo
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "LZTabBarViewController.h"
#import "LZNewfeatureViewController.h"

@implementation UIWindow (Extension)

- (void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) { // 版本号相同：这次打开和上次打开的是同一个版本
        self.rootViewController = [[LZTabBarViewController alloc] init];
    } else { // 这次打开的版本和上一次不一样，显示新特性
        self.rootViewController = [[LZNewfeatureViewController alloc] init];
        
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
