//
//  LZStatusCell.h
//  LZWeiBo
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZStatusFrame;

@interface LZStatusCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) LZStatusFrame *statusFrame;

@end
