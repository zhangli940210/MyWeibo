//
//  LZStatusToolbar.h
//  LZWeiBo
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZStatus;
@interface LZStatusToolbar : UIView

+ (instancetype)toolbar;
@property (nonatomic, strong) LZStatus *status;

@end
