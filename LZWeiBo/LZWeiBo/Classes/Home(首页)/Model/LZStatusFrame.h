//
//  LZStatusFrame.h
//  LZWeiBo
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 m14a. All rights reserved.
//

//  一个LZStatusFrame模型里面包含的信息
//  1.存放着一个cell内部所有子控件的frame数据
//  2.存放一个cell的高度
//  3.存放着一个数据模型LZStatus

#import <Foundation/Foundation.h>

// 昵称字体
#define LZStatusCellNameFont [UIFont systemFontOfSize:15]
// 时间字体
#define LZStatusCellTimeFont [UIFont systemFontOfSize:12]
// 来源字体
#define LZStatusCellSourceFont LZStatusCellTimeFont
// 正文字体
#define LZStatusCellContentFont [UIFont systemFontOfSize:14]


@class LZStatus;

@interface LZStatusFrame : NSObject
@property (nonatomic, strong) LZStatus *status;

/** 原创微博整体 */
@property (nonatomic, assign) CGRect originalViewF;
/** 头像 */
@property (nonatomic, assign) CGRect iconViewF;
/** 会员图标 */
@property (nonatomic, assign) CGRect vipViewF;
/** 配图 */
@property (nonatomic, assign) CGRect photoViewF;
/** 昵称 */
@property (nonatomic, assign) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign) CGRect timeLabelF;
/** 来源 */
@property (nonatomic, assign) CGRect sourceLabelF;
/** 正文 */
@property (nonatomic, assign) CGRect contentLabelF;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
