//
//  LZEmotionTool.h
//  LZWeiBo
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZEmotion;

@interface LZEmotionTool : NSObject
// 存表情
+ (void)addRecentEmotion:(LZEmotion *)emotion;
// 取表情
+ (NSArray *)recentEmotions;

@end
