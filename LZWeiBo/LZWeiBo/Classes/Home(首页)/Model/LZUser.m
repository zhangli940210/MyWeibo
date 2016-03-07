
#import "LZUser.h"

@implementation LZUser

+ (instancetype)userWithDict:(NSDictionary *)dict
{
    LZUser *user = [[self alloc] init];
    user.idstr = dict[@"idstr"];
    user.name = dict[@"name"];
    user.profile_image_url = dict[@"profile_image_url"];
    return user;
}
@end
