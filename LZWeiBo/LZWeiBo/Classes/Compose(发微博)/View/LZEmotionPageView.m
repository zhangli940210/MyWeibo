//
//  LZEmotionPageView.m
//  LZWeiBo
//
//  Created by apple on 16/3/20.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotionPageView.h"
#import "LZEmotion.h"
@implementation LZEmotionPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    // 当前界面的表情个数
    NSUInteger count = emotions.count;
    for (NSInteger i = 0; i < count; i++) {
        // 创建按钮
        UIButton *btn = [[UIButton alloc] init];
        // 从数组中取出对应的模型
        LZEmotion *emotion = emotions[i];
        
        if (emotion.png) { // 有图片
            [btn setImage:[UIImage imageNamed:emotion.png] forState:UIControlStateNormal];
        } else if (emotion.code) { // 是emoji表情
            // 设置emoji,每一个表情都是一个文字
            [btn setTitle:emotion.code.emoji forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:32];
        }
        
        [self addSubview:btn];
    }
}

// CUICatalog: Invalid asset name supplied: (null), or invalid scale factor: 2.000000
// 警告原因：尝试去加载的图片不存在

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 内边距(四周)
    CGFloat inset = 20;
    NSUInteger count = self.emotions.count;
    CGFloat btnW = (self.width - 2 * inset) / LZEmotionMaxCols;
    CGFloat btnH = (self.height - inset) / LZEmotionMaxRows;
    for (NSInteger i = 0; i<count; i++) {
        UIButton *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.x = inset + (i % LZEmotionMaxCols) * btnW;
        btn.y = inset + (i / LZEmotionMaxCols) * btnH;
    }
}
@end
