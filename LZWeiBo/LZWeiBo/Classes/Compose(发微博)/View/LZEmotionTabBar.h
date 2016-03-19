
//  表情键盘底部的选项卡

#import <UIKit/UIKit.h>

typedef enum {
    LZEmotionTabBarButtonTypeRecent, // 最近
    LZEmotionTabBarButtonTypeDefault, // 默认
    LZEmotionTabBarButtonTypeEmoji, // emoji
    LZEmotionTabBarButtonTypeLxh, // 浪小花
} LZEmotionTabBarButtonType;

@class LZEmotionTabBar;

@protocol LZEmotionTabBarDelegate <NSObject>

@optional
- (void)emotionTabBar:(LZEmotionTabBar *)tabBar didSelectButton:(LZEmotionTabBarButtonType)buttonType;
@end

@interface LZEmotionTabBar : UIView
@property (nonatomic, weak) id<LZEmotionTabBarDelegate> delegate;
@end

