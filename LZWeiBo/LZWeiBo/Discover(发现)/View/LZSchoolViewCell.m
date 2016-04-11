//
//  LZSchoolViewCell.m
//  LZWeiBo
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZSchoolViewCell.h"
#import "LZSchoolItem.h"

@interface LZSchoolViewCell ()
/** 学校名称*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 学校类型*/
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
/** 学校地址*/
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end

@implementation LZSchoolViewCell

- (void)setItem:(LZSchoolItem *)item
{
    _item = item;

    self.nameLabel.text = [NSString stringWithFormat:@"名称:%@", item.school_name];

    self.typeLabel.text = [NSString stringWithFormat:@"类型:%@", item.type];

    self.locationLabel.text = [NSString stringWithFormat:@"位置:%@", item.location];
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 2;
    [super setFrame:frame];
}


@end
