//
//  LZEmotionAttachment.m
//  LZWeiBo
//
//  Created by apple on 16/4/4.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionAttachment.h"
#import "LZEmotion.h"

@implementation LZEmotionAttachment

- (void)setEmotion:(LZEmotion *)emotion
{
    _emotion = emotion;
    
    self.image = [UIImage imageNamed:emotion.png];
}

@end
