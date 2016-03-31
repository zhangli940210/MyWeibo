//
//  LZEmotionPopView.h
//  LZWeiBo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZEmotion;
@interface LZEmotionPopView : UIView

+ (instancetype)popView;
@property (nonatomic, strong) LZEmotion *emotion;
@end
