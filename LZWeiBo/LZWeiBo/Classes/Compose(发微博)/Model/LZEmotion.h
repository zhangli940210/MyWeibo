//
//  LZEmotion.h
//  LZWeiBo
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZEmotion : NSObject
/** 表情的文字描述 */
@property (nonatomic, strong) NSString *chs;
/** 表情的png图片名 */
@property (nonatomic, strong) NSString *png;
/** emoji表情的16进制编码 */
@property (nonatomic, strong) NSString *code;
@end
