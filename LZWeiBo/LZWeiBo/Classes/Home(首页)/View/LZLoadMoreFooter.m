//
//  LZLoadMoreFooter.m
//  LZWeiBo
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZLoadMoreFooter.h"

@implementation LZLoadMoreFooter

+ (instancetype)loadMoreFooter
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
