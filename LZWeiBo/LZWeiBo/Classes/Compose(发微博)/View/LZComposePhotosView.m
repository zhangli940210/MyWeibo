//
//  LZComposePhotosView.m


#import "LZComposePhotosView.h"

@interface LZComposePhotosView()
@end

@implementation LZComposePhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photos = [NSMutableArray array];
    }
    return self;
}

- (void)addPhoto:(UIImage *)photo
{
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.image = photo;
    [self addSubview:photoView];
    
    // 存储图片
    [self.photos addObject:photo];
}

// 布局UIImageView子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger count = self.subviews.count;
    // 设置4列
    NSInteger maxCol = 4;
    CGFloat imageWH = 70;
    CGFloat imageMargin = 10;
    
    for (NSInteger i = 0; i < count; i++) {
        UIImageView *photoView = self.subviews[i];
        // 列号
        NSInteger col = i % maxCol;
        photoView.x = col * (imageWH + imageMargin);
        // 行号
        NSInteger row = i / maxCol;
        photoView.y = row * (imageWH + imageMargin);
        photoView.width = imageWH;
        photoView.height = imageWH;
    }
}

@end
