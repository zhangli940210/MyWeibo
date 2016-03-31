//
//  LZEmotionButton.m
//  LZWeiBo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionButton.h"
#import "LZEmotion.h"

@implementation LZEmotionButton


/**
 *  当控件不是从xib、storyboard中创建时，就会调用这个方法
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

/**
 *  当控件是从xib、storyboard中创建时，就会调用这个方法
 */
/*
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        
    }
    return self;
}
 */

/**
 *  这个方法在initWithCoder:方法后调用
 */
- (void)awakeFromNib
{
    [self setup];
}


- (void)setup
{
    self.titleLabel.font = [UIFont systemFontOfSize:32];
}



- (void)setEmotion:(LZEmotion *)emotion
{
    _emotion = emotion;
    
    if (emotion.png) { // 有图片
        [self setImage:[UIImage imageNamed:emotion.png] forState:UIControlStateNormal];
    } else if (emotion.code) { // 是emoji表情
        // 设置emoji
        [self setTitle:emotion.code.emoji forState:UIControlStateNormal];
    }
}


@end
