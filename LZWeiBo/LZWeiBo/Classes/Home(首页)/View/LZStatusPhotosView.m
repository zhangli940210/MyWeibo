

#import "LZStatusPhotosView.h"
#import "LZPhoto.h"
#import "LZStatusPhotoView.h"

#define LZStatusPhotoWH 70
#define LZStatusPhotoMargin 10
#define LZStatusPhotoMaxCol(count) ((count==4)?2:3)

@implementation LZStatusPhotosView // 9

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    NSInteger photosCount = photos.count;

    // 创建足够数量的图片控件
    // 这里的self.subviews.count不要单独赋值给其他变量
    while (self.subviews.count < photosCount) {
        LZStatusPhotoView *photoView = [[LZStatusPhotoView alloc] init];
        [self addSubview:photoView];
    }
    
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i<self.subviews.count; i++) {
        LZStatusPhotoView *photoView = self.subviews[i];
        
        if (i < photosCount) { // 显示
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    int photosCount = self.photos.count;
    int maxCol = LZStatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        LZStatusPhotoView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (LZStatusPhotoWH + LZStatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (LZStatusPhotoWH + LZStatusPhotoMargin);
        photoView.width = LZStatusPhotoWH;
        photoView.height = LZStatusPhotoWH;
    }
}

+ (CGSize)sizeWithCount:(int)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = LZStatusPhotoMaxCol(count);
    
    ///Users/apple/Desktop/课堂共享/05-iPhone项目/1018/代码/黑马微博2期35-相册/黑马微博2期/Classes/Home(首页)/View/LZStatusPhotosView.m 列数
    int cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * LZStatusPhotoWH + (cols - 1) * LZStatusPhotoMargin;
    
    // 行数
    int rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * LZStatusPhotoWH + (rows - 1) * LZStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
