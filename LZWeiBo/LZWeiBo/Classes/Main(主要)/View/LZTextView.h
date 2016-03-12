//
//  LZTextView.h
//  LZWeiBo
//
//  Created by apple on 16/3/13.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
