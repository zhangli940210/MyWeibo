//
//  LZStatusFrame.m
//  LZWeiBo
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZStatusFrame.h"
#import "LZStatus.h"
#import "LZUser.h"

// cell的边框宽度
#define LZStatusCellBorderW 10

@implementation LZStatusFrame

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font
{
    return [self sizeWithText:text font:font maxW:MAXFLOAT];
}

- (void)setStatus:(LZStatus *)status
{
    _status = status;
    
    LZUser *user = status.user;
    
    // cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    /* 原创微博 */
    
    /** 头像 */
    CGFloat iconWH = 35;
    CGFloat iconX = LZStatusCellBorderW;
    CGFloat iconY = LZStatusCellBorderW;
    self.iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + LZStatusCellBorderW;
    CGFloat nameY = iconY;
    CGSize nameSize = [self sizeWithText:user.name font:LZStatusCellNameFont];
    self.nameLabelF = (CGRect){{nameX, nameY}, nameSize};
    
    /** 会员图标 */
    if (user.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLabelF) + LZStatusCellBorderW;
        CGFloat vipY = nameY;
        CGFloat vipH = nameSize.height;
        CGFloat vipW = 14;
        self.vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 时间 */
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameLabelF) + LZStatusCellBorderW;
    CGSize timeSize = [self sizeWithText:status.created_at font:LZStatusCellTimeFont];
    self.timeLabelF = (CGRect){{timeX, timeY}, timeSize};
    
    /** 来源 */
    CGFloat sourceX = CGRectGetMaxX(self.timeLabelF) + LZStatusCellBorderW;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [self sizeWithText:status.source font:LZStatusCellSourceFont];
    self.sourceLabelF = (CGRect){{sourceX, sourceY}, sourceSize};
    
    /** 正文 */
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.timeLabelF)) + LZStatusCellBorderW;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [self sizeWithText:status.text font:LZStatusCellContentFont maxW:maxW];
    self.contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    /** 配图 */
    
    /** 原创微博整体 */
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    CGFloat originalW = cellW;
    CGFloat originalH = CGRectGetMaxY(self.contentLabelF) + LZStatusCellBorderW;
    self.originalViewF = CGRectMake(originalX, originalY, originalW, originalH);
    
    
    self.cellHeight = CGRectGetMaxY(self.originalViewF);
}

@end
