//
//  LZEmotionPopView.m
//  LZWeiBo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionPopView.h"
#import "LZEmotionButton.h"
#import "LZEmotion.h"

@interface LZEmotionPopView ()

@property (weak, nonatomic) IBOutlet LZEmotionButton *emotionButton;


@end

@implementation LZEmotionPopView

+ (instancetype)popView
{
//    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    return [[[NSBundle mainBundle] loadNibNamed:@"LZEmotionPopView" owner:nil options:nil] lastObject];
}

- (void)setEmotion:(LZEmotion *)emotion
{
    _emotion = emotion;
    
    self.emotionButton.emotion = emotion;
}


@end
