

//  用来表示一页的表情（里面显示1~20个表情）

#import <UIKit/UIKit.h>

// 一页中最多3行
#define LZEmotionMaxRows 3
// 一行中最多7列
#define LZEmotionMaxCols 7
// 每一页的表情个数
#define LZEmotionPageSize ((LZEmotionMaxRows * LZEmotionMaxCols) - 1)

@interface LZEmotionPageView : UIView
/** 这一页显示的表情（里面都是LZEmotion模型） */
@property (nonatomic, strong) NSArray *emotions;
@end
