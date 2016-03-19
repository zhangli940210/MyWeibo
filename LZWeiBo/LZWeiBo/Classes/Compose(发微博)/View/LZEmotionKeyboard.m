

#import "LZEmotionKeyboard.h"
#import "LZEmotionListView.h"
#import "LZEmotionTabBar.h"
#import "LZEmotion.h"
#import "MJExtension.h"

@interface LZEmotionKeyboard() <LZEmotionTabBarDelegate>
/** 容纳表情内容的控件 */
@property (nonatomic, weak) UIView *contentView;
/** 表情内容 */
@property (nonatomic, strong) LZEmotionListView *recentListView;
@property (nonatomic, strong) LZEmotionListView *defaultListView;
@property (nonatomic, strong) LZEmotionListView *emojiListView;
@property (nonatomic, strong) LZEmotionListView *lxhListView;
/** tabbar */
@property (nonatomic, weak) LZEmotionTabBar *tabBar;
@end

@implementation LZEmotionKeyboard

#pragma mark - 懒加载
// 最近
- (LZEmotionListView *)recentListView
{
    if (!_recentListView) {
        self.recentListView = [[LZEmotionListView alloc] init];
        self.recentListView.backgroundColor = LZRandomColor;
    }
    return _recentListView;
}

// 默认
- (LZEmotionListView *)defaultListView
{
    if (!_defaultListView) {
        self.defaultListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        self.defaultListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.defaultListView.backgroundColor = LZRandomColor;
    }
    return _defaultListView;
}

// emoji
- (LZEmotionListView *)emojiListView
{
    if (!_emojiListView) {
        self.emojiListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        self.emojiListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.emojiListView.backgroundColor = LZRandomColor;
    }
    return _emojiListView;
}

// 浪小花
- (LZEmotionListView *)lxhListView
{
    if (!_lxhListView) {
        self.lxhListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        self.lxhListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
        self.lxhListView.backgroundColor = LZRandomColor;
    }
    return _lxhListView;
}

#pragma mark - 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.contentView
        UIView *contentView = [[UIView alloc] init];
        [self addSubview:contentView];
        self.contentView = contentView;
        
        // 2.tabbar
        LZEmotionTabBar *tabBar = [[LZEmotionTabBar alloc] init];
        tabBar.delegate = self;
        [self addSubview:tabBar];
        self.tabBar = tabBar;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.tabbar
    self.tabBar.width = self.width;
    self.tabBar.height = 37;
    self.tabBar.x = 0;
    self.tabBar.y = self.height - self.tabBar.height;
    
    // 2.表情内容
    self.contentView.x = self.contentView.y = 0;
    self.contentView.width = self.width;
    self.contentView.height = self.tabBar.y;
    
    // 3.设置frame
    UIView *child = [self.contentView.subviews lastObject];
    child.frame = self.contentView.bounds;
}

#pragma mark - LZEmotionTabBarDelegate
- (void)emotionTabBar:(LZEmotionTabBar *)tabBar didSelectButton:(LZEmotionTabBarButtonType)buttonType
{
    // 移除contentView之前显示的控件
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 根据按钮类型，切换contentView上面的listview
    switch (buttonType) {
        case LZEmotionTabBarButtonTypeRecent: { // 最近
            [self.contentView  addSubview:self.recentListView];
            break;
        }
            
        case LZEmotionTabBarButtonTypeDefault: { // 默认
            [self.contentView addSubview:self.defaultListView];
            break;
        }
            
        case LZEmotionTabBarButtonTypeEmoji: { // Emoji
            [self.contentView addSubview:self.emojiListView];
            break;
        }
            
        case LZEmotionTabBarButtonTypeLxh: { // Lxh
            [self.contentView addSubview:self.lxhListView];
            break;
        }
    }
    
    // 重新计算子控件的frame(setNeedsLayout内部会在恰当的时刻，重新调用layoutSubviews，重新布局子控件)
    [self setNeedsLayout];
}

@end
