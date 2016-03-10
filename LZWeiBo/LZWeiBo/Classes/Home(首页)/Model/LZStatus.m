

#import "LZStatus.h"
#import "MJExtension.h"
#import "LZPhoto.h"

@implementation LZStatus

- (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls" : [LZPhoto class]};
}

@end
