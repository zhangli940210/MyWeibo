//
//  LZEmotionPopView.h
//  LZWeiBo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZEmotionButton;
@interface LZEmotionPopView : UIView

+ (instancetype)popView;
- (void)showFrom:(LZEmotionButton *)button;

@end
