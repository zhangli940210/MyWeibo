//
//  LZEmotionTextView.h
//  LZWeiBo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZTextView.h"
@class LZEmotion;
@interface LZEmotionTextView : LZTextView

- (void)insertEmotion:(LZEmotion *)emotion;

- (NSString *)fullText;

@end
