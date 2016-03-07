
//  微博模型

#import <Foundation/Foundation.h>
@class LZUser;

@interface LZStatus : NSObject
/**	string	字符串型的微博ID*/
@property (nonatomic, copy) NSString *idstr;

/**	string	微博信息内容*/
@property (nonatomic, copy) NSString *text;

/**	object	微博作者的用户信息字段 详细*/
@property (nonatomic, strong) LZUser *user;

+ (instancetype)statusWithDict:(NSDictionary *)dict;
@end
