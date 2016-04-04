//
//  NSString+URLEncoding.m
//  LZWeiBo
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            CFSTR("!*'();:@&=+$,/?%#[] "),
                                            kCFStringEncodingUTF8);
    [result autorelease];
    return result;
}
- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)
    CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                            (CFStringRef)self,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8);
    [result autorelease];  
    return result;  
}

@end
