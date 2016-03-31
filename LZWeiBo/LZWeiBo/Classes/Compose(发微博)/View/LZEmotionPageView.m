

#import "LZEmotionPageView.h"
#import "LZEmotion.h"
#import "LZEmotionPopView.h"
#import "LZEmotionButton.h"

@interface LZEmotionPageView()
/** 点击表情后弹出的放大镜 */
@property (nonatomic, strong) LZEmotionPopView *popView;
@end

@implementation LZEmotionPageView

- (LZEmotionPopView *)popView
{
    if (!_popView) {
        self.popView = [LZEmotionPopView popView];
    }
    return _popView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    NSUInteger count = emotions.count;
    for (int i = 0; i<count; i++) {
        LZEmotionButton *btn = [[LZEmotionButton alloc] init];
        [self addSubview:btn];
        
        // 设置表情数据
        btn.emotion = emotions[i];
        
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
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
    for (int i = 0; i<count; i++) {
        UIButton *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.x = inset + (i%LZEmotionMaxCols) * btnW;
        btn.y = inset + (i/LZEmotionMaxCols) * btnH;
    }
}

/**
 *  监听表情按钮点击
 *
 *  @param btn 被点击的表情按钮
 */
- (void)btnClick:(LZEmotionButton *)btn
{
    // 给popView传递数据
    self.popView.emotion = btn.emotion;
    
    // 取得最上面的window
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self.popView];
    
    // 计算出被点击的按钮在window中的frame
    CGRect btnFrame = [btn convertRect:btn.bounds toView:nil];
    self.popView.y = CGRectGetMidY(btnFrame) - self.popView.height; // 100
    self.popView.centerX = CGRectGetMidX(btnFrame);
}
@end
