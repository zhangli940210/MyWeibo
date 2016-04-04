//
//  LZEmotionTool.m
//  LZWeiBo
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionTool.h"

// 最近表情的存储路径
#define LZRecentEmotionsPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"emotions.archive"]

@implementation LZEmotionTool

// 全局变量
static NSMutableArray *_recentEmotions;

// 当前类或者当前类的子类第一次使用的时候调用
+ (void)initialize
{
    _recentEmotions = [NSKeyedUnarchiver unarchiveObjectWithFile:LZRecentEmotionsPath];
    if (_recentEmotions == nil) {
        _recentEmotions = [NSMutableArray array];
    }
}

// 添加表情
+ (void)addRecentEmotion:(LZEmotion *)emotion
{
    // 删除重复的表情
    [_recentEmotions removeObject:emotion];
    
    // 将表情放到数组的最前面
    [_recentEmotions insertObject:emotion atIndex:0];
    
    // 将所有的表情数据写入沙盒
    [NSKeyedArchiver archiveRootObject:_recentEmotions toFile:LZRecentEmotionsPath];
}

/**
 *  返回装着LZEmotion模型的数组
 */
+ (NSArray *)recentEmotions
{
    return _recentEmotions;
}


@end
