//  用户模型

#import <Foundation/Foundation.h>

typedef enum {
    LZUserVerifiedTypeNone = -1, // 没有任何认证
    
    LZUserVerifiedPersonal = 0,  // 个人认证
    
    LZUserVerifiedOrgEnterprice = 2, // 企业官方：CSDN、EOE、搜狐新闻客户端
    LZUserVerifiedOrgMedia = 3, // 媒体官方：程序员杂志、苹果汇
    LZUserVerifiedOrgWebsite = 5, // 网站官方：猫扑
    
    LZUserVerifiedDaren = 220 // 微博达人
} LZUserVerifiedType;

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

/** 会员类型 > 2代表是会员 */
@property (nonatomic, assign) int mbtype;
/** 会员等级 */
@property (nonatomic, assign) int mbrank;
@property (nonatomic, assign, getter = isVip) BOOL vip;

/** 认证类型 */
@property (nonatomic, assign) LZUserVerifiedType verified_type;
@end
