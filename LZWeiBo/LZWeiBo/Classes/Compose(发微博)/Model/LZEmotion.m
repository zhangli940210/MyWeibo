//
//  LZEmotion.m
//  LZWeiBo
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZEmotion.h"
#import "MJExtension.h"

@interface LZEmotion () <NSCoding>

@end

@implementation LZEmotion

MJCodingImplementation

///**
// *  从文件中解析对象时调用
// */
//- (id)initWithCoder:(NSCoder *)decoder
//{
//    if (self = [super init]) {
//        self.chs = [decoder decodeObjectForKey:@"chs"];
//        self.png = [decoder decodeObjectForKey:@"png"];
//        self.code = [decoder decodeObjectForKey:@"code"];
//    }
//    return self;
//}
//
///**
// *  将对象写入文件的时候调用
// */
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    [encoder encodeObject:self.chs forKey:@"chs"];
//    [encoder encodeObject:self.png forKey:@"png"];
//    [encoder encodeObject:self.code forKey:@"code"];
//}


/**
 *  常用来比较两个LZEmotion对象是否一样
 *
 *  @param other 另外一个LZEmotion对象
 *
 *  @return YES : 代表2个对象是一样的，NO: 代表2个对象是不一样
 */
// 默认情况下比较的是:两个对象的内存地址
- (BOOL)isEqual:(LZEmotion *)other
{
    //    if (self == other) {
    //        return YES;
    //    } else {
    //        return NO;
    //    }
    
    //    HWLog(@"%@--isEqual---%@", self.chs, other.chs);
    
    //    NSString *str1 = @"jack";
    //    NSString *str2 = [NSString stringWithFormat:@"jack"];
    //
    //    str1 == str2 // no
    //    [str1 isEqual:str2]; // NO    比较的是内存地址
    //    [str1 isEqualToString:str2] // YES    比较的是内容
    //    比较的是内容
    return [self.chs isEqualToString:other.chs] || [self.code isEqualToString:other.code];
}

@end
