//  用户模型

#import <Foundation/Foundation.h>

@interface LZUser : NSObject
/**	string	字符串型的用户UID*/
@property (nonatomic, copy) NSString *idstr;

/**	string	友好显示名称*/
@property (nonatomic, copy) NSString *name;

/**	string	用户头像地址，50×50像素*/
@property (nonatomic, copy) NSString *profile_image_url;

/** string 用户所在地*/
@property (nonatomic, copy) NSString *location;

/** string 用户的昵称*/
@property (nonatomic, copy) NSString *screen_name;
@end
