

#import <UIKit/UIKit.h>

typedef enum {
    LZComposeToolbarButtonTypeCamera, // 拍照
    LZComposeToolbarButtonTypePicture, // 相册
    LZComposeToolbarButtonTypeMention, // @
    LZComposeToolbarButtonTypeTrend, // #
    LZComposeToolbarButtonTypeEmotion // 表情
} LZComposeToolbarButtonType;

@class LZComposeToolbar;

@protocol LZComposeToolbarDelegate <NSObject>
@optional
- (void)composeToolbar:(LZComposeToolbar *)toolbar didClickButton:(LZComposeToolbarButtonType)buttonType;
@end

@interface LZComposeToolbar : UIView
@property (nonatomic, weak) id<LZComposeToolbarDelegate> delegate;

/** 是否要显示键盘按钮  */
@property (nonatomic, assign) BOOL showKeyboardButton;
@end
