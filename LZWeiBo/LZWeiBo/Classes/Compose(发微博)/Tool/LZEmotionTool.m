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

+ (void)addRecentEmotion:(LZEmotion *)emotion
{
    // 加载沙盒中的表情数据
    NSMutableArray *emotions = (NSMutableArray *)[self recentEmotions];
    if (emotions == nil) {
        emotions = [NSMutableArray array];
    }
    
    // 将表情放到数组的最前面
    [emotions insertObject:emotion atIndex:0];
    
    // 将所有的表情数据写入沙盒
    [NSKeyedArchiver archiveRootObject:emotions toFile:LZRecentEmotionsPath];
}

/**
 *  返回装着LZEmotion模型的数组
 */
+ (NSArray *)recentEmotions
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:LZRecentEmotionsPath];
}

@end
