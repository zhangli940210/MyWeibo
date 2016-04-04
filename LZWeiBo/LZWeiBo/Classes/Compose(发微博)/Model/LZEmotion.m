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

@end
