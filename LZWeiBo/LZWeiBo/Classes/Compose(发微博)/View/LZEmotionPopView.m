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
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}


- (void)showFrom:(LZEmotionButton *)button
{
    if (button == nil) return;
    
    // 给popView传递数据
    self.emotionButton.emotion = button.emotion;
    
    // 取得最上面的window
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
    // 计算出被点击的按钮在window中的frame
    CGRect btnFrame = [button convertRect:button.bounds toView:nil];
    self.y = CGRectGetMidY(btnFrame) - self.height; // 100
    self.centerX = CGRectGetMidX(btnFrame);

}

@end
