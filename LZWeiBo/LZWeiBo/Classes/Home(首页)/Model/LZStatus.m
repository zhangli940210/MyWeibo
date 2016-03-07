

#import "LZStatus.h"
#import "LZUser.h"

@implementation LZStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    LZStatus *status = [[self alloc] init];
    status.idstr = dict[@"idstr"];
    status.text = dict[@"text"];
    status.user = [LZUser userWithDict:dict[@"user"]];
    return status;
}
@end
