//
//  LZSchoolItem.h
//  LZWeiBo
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <Foundation/Foundation.h>
// school_name, type, location
@interface LZSchoolItem : NSObject

/** 学校名称*/
@property (nonatomic, strong) NSString *school_name;
/** 学校类型*/
@property (nonatomic, strong) NSString *type;
/** 学校地址*/
@property (nonatomic, strong) NSString *location;

@end
