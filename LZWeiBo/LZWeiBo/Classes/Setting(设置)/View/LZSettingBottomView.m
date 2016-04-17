//
//  LZSettingBottomView.m
//  LZWeiBo
//
//  Created by apple on 16/4/17.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZSettingBottomView.h"

@implementation LZSettingBottomView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}

+ (instancetype)settingBottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
