
#import "LZUser.h"

@implementation LZUser

- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    
    self.vip = mbtype > 2;
}

@end
