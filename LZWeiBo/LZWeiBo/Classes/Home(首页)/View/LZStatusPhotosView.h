//
//  LZStatusPhotosView.h
//  LZWeiBo
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 m14a. All rights reserved.
//  cell上面的配图相册（里面会显示1~9张图片, 里面都是LZStatusPhotoView）

#import <UIKit/UIKit.h>

@interface LZStatusPhotosView : UIView

@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(int)count;

@end
