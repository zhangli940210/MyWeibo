//
//  LZUserCell.h
//  LZWeiBo
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZUser;

@interface LZUserCell : UITableViewCell

/** 用户模型数据*/
@property (nonatomic, strong) LZUser *user;
@end
