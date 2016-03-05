//
//  LZAccountTool.m
//  LZWeiBo
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 m14a. All rights reserved.
//

// 账号的存储路径
#define LZAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

#import "LZAccountTool.h"
#import "LZAccount.h"

@implementation LZAccountTool

/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(LZAccount *)account
{
    // 获得账号存储的时间（accessToken的产生时间）
    account.created_time = [NSDate date];
    
    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:LZAccountPath];
}


/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (LZAccount *)account
{
    // 加载模型
    LZAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:LZAccountPath];
    
    /* 验证账号是否过期 */
    
    // 过期的秒数
    long long expires_in = [account.expires_in longLongValue];
    // 获得过期时间
    NSDate *expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    // 获得当前时间
    NSDate *now = [NSDate date];
    
    // 如果expiresTime <= now，过期
    /**
     NSOrderedAscending = -1L, 升序, 左边 < 右边
     NSOrderedSame, 一样
     NSOrderedDescending 降序，左边 > 右边
     */
    NSComparisonResult result = [expiresTime compare:now];
    if (result != NSOrderedDescending) { // 过期
        return nil;
    }
    
    LZLog(@"%@---%@", expiresTime, now);
    
    return account;
}
@end
