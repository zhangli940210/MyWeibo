//
//  LZEmotionAttachment.h
//  LZWeiBo
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZEmotion;

@interface LZEmotionAttachment : NSTextAttachment
/** 表情数据*/
@property (nonatomic, strong) LZEmotion *emotion;
@end
