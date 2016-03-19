

#import <UIKit/UIKit.h>

@interface LZComposePhotosView : UIView
- (void)addPhoto:(UIImage *)photo;

@property (nonatomic, strong, readonly) NSMutableArray *photos;

@end
