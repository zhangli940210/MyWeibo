

#import "LZEmotionKeyboard.h"
#import "LZEmotionListView.h"
#import "LZEmotionTabBar.h"
#import "LZEmotion.h"
#import "MJExtension.h"
#import "LZEmotionTool.h"

@interface LZEmotionKeyboard() <LZEmotionTabBarDelegate>
/** 保存正在显示listView */
@property (nonatomic, weak) LZEmotionListView *showingListView;
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
- (LZEmotionListView *)recentListView
{
    if (!_recentListView) {
        self.recentListView = [[LZEmotionListView alloc] init];
        // 加载沙盒中的数据
        self.recentListView.emotions = [LZEmotionTool recentEmotions];
    }
    return _recentListView;
}

- (LZEmotionListView *)defaultListView
{
    if (!_defaultListView) {
        self.defaultListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        self.defaultListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _defaultListView;
}

- (LZEmotionListView *)emojiListView
{
    if (!_emojiListView) {
        self.emojiListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        self.emojiListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _emojiListView;
}

- (LZEmotionListView *)lxhListView
{
    if (!_lxhListView) {
        self.lxhListView = [[LZEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        self.lxhListView.emotions = [LZEmotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _lxhListView;
}

#pragma mark - 初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // tabbar
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
    self.showingListView.x = self.showingListView.y = 0;
    self.showingListView.width = self.width;
    self.showingListView.height = self.tabBar.y;
}

#pragma mark - LZEmotionTabBarDelegate
- (void)emotionTabBar:(LZEmotionTabBar *)tabBar didSelectButton:(LZEmotionTabBarButtonType)buttonType
{
    // 移除正在显示的listView控件
    [self.showingListView removeFromSuperview];
    
    // 根据按钮类型，切换键盘上面的listview
    switch (buttonType) {
        case LZEmotionTabBarButtonTypeRecent: { // 最近
            [self addSubview:self.recentListView];

            break;
        }
            
        case LZEmotionTabBarButtonTypeDefault: { // 默认
            [self addSubview:self.defaultListView];

            break;
        }
            
        case LZEmotionTabBarButtonTypeEmoji: { // Emoji
            [self addSubview:self.emojiListView];

            break;
        }
            
        case LZEmotionTabBarButtonTypeLxh: { // Lxh
            [self addSubview:self.lxhListView];

            break;
        }
    }
    
    // 设置正在显示的listView
    self.showingListView = [self.subviews lastObject];
    
    // 设置frame
    [self setNeedsLayout];
}

@end
