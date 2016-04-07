//
//  LZSchoolViewCell.h
//  LZWeiBo
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZSchoolItem;
@interface LZSchoolViewCell : UITableViewCell
/** 学校模型*/
@property (nonatomic, strong) LZSchoolItem *item;
@end
