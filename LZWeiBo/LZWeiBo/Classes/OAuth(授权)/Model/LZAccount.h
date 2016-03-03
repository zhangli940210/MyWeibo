//
//  LZAccount.h
//  LZWeiBo
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZAccount : NSObject <NSCoding>

/**　string	用于调用access_token，接口获取授权后的access token。*/
@property (nonatomic, copy) NSString *access_token;

/**　string	access_token的生命周期，单位是秒数。*/
@property (nonatomic, copy) NSNumber *expires_in;

/**　string	当前授权用户的UID。*/
@property (nonatomic, copy) NSString *uid;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
