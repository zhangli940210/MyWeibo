//
//  LZAccountTool.h
//  LZWeiBo
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 m14a. All rights reserved.
//  处理账号相关的所有操作:存储账号、取出账号、验证账号

#import <Foundation/Foundation.h>
@class LZAccount;

@interface LZAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(LZAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (LZAccount *)account;

@end
