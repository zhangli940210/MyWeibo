

#import "LZEmotionKeyboard.h"
#import "LZEmotionListView.h"
#import "LZEmotionTabBar.h"

@interface LZEmotionKeyboard() <LZEmotionTabBarDelegate>
/** 表情内容 */
@property (nonatomic, weak) LZEmotionListView *listView;
/** tabbar */
@property (nonatomic, weak) LZEmotionTabBar *tabBar;
@end

@implementation LZEmotionKeyboard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.表情内容
        LZEmotionListView *listView = [[LZEmotionListView alloc] init];
        listView.backgroundColor = LZRandomColor;
        [self addSubview:listView];
        self.listView = listView;
        
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
    self.listView.x = self.listView.y = 0;
    self.listView.width = self.width;
    self.listView.height = self.tabBar.y;
}

#pragma mark - LZEmotionTabBarDelegate
- (void)emotionTabBar:(LZEmotionTabBar *)tabBar didSelectButton:(LZEmotionTabBarButtonType)buttonType
{
    switch (buttonType) {
        case LZEmotionTabBarButtonTypeRecent: // 最近
            LZLog(@"最近");
            break;
            
        case LZEmotionTabBarButtonTypeDefault: // 默认
            LZLog(@"默认");
            break;
            
        case LZEmotionTabBarButtonTypeEmoji: // Emoji
            LZLog(@"Emoji");
            break;
            
        case LZEmotionTabBarButtonTypeLxh: // Lxh
            LZLog(@"Lxh");
            break;
    }
}

@end
