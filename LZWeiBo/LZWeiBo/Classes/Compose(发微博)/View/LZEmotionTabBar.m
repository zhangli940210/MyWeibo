


#import "LZEmotionTabBar.h"
#import "LZEmotionTabBarButton.h"

@interface LZEmotionTabBar()
@property (nonatomic, weak) LZEmotionTabBarButton *selectedBtn;
@end

@implementation LZEmotionTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBtn:NSLocalizedString(@"recent", nil) buttonType:LZEmotionTabBarButtonTypeRecent];
        [self setupBtn:@"默认" buttonType:LZEmotionTabBarButtonTypeDefault];
        //        [self btnClick:[self setupBtn:@"默认" buttonType:LZEmotionTabBarButtonTypeDefault]];
        [self setupBtn:@"Emoji" buttonType:LZEmotionTabBarButtonTypeEmoji];
        [self setupBtn:@"浪小花" buttonType:LZEmotionTabBarButtonTypeLxh];
    }
    return self;
}

/**
 *  创建一个按钮
 *
 *  @param title 按钮文字
 */
- (LZEmotionTabBarButton *)setupBtn:(NSString *)title buttonType:(LZEmotionTabBarButtonType)buttonType
{
    // 创建按钮
    LZEmotionTabBarButton *btn = [[LZEmotionTabBarButton alloc] init];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    btn.tag = buttonType;
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];
    
    // 选中“默认”按钮
    if (buttonType == LZEmotionTabBarButtonTypeDefault) {
        [self btnClick:btn];
    }
    
    // 设置背景图片
    NSString *image = @"compose_emotion_table_mid_normal";
    NSString *selectImage = @"compose_emotion_table_mid_selected";
    if (self.subviews.count == 1) {
        image = @"compose_emotion_table_left_normal";
        selectImage = @"compose_emotion_table_left_selected";
    } else if (self.subviews.count == 4) {
        image = @"compose_emotion_table_right_normal";
        selectImage = @"compose_emotion_table_right_selected";
    }
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateDisabled];
    
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮的frame
    NSUInteger btnCount = self.subviews.count;
    CGFloat btnW = self.width / btnCount;
    CGFloat btnH = self.height;
    for (int i = 0; i<btnCount; i++) {
        LZEmotionTabBarButton *btn = self.subviews[i];
        btn.y = 0;
        btn.width = btnW;
        btn.x = i * btnW;
        btn.height = btnH;
    }
}

/**
 *  按钮点击
 */
- (void)btnClick:(LZEmotionTabBarButton *)btn
{
    self.selectedBtn.enabled = YES;
    btn.enabled = NO;
    self.selectedBtn = btn;
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(emotionTabBar:didSelectButton:)]) {
        [self.delegate emotionTabBar:self didSelectButton:btn.tag];
    }
}

@end

