//
//  LZPrivacyViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/17.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZPrivacyViewController.h"

@interface LZPrivacyViewController ()

@end

@implementation LZPrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题
    self.title = @"隐私与安全设置";
    // 添加3组
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
}

// 第0组
- (void)addGroup0
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"隐私设置"];

    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    [self.groupArray addObject:groupItem];
}

// 第1组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"已屏蔽消息的人"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"已屏蔽微博的人"];

    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    [self.groupArray addObject:groupItem];
}

// 第2组
- (void)addGroup2
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"黑名单"];
 
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    [self.groupArray addObject:groupItem];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建Cell
    LZSettingCell *cell = [LZSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    // 取出当前是第几组
    LZSettingGroupItem *groupItem  = self.groupArray[indexPath.section];
    LZSettingRowItem *rowItem = groupItem.rowArray[indexPath.row];

    // 给Cell赋值模型
    cell.rowItem = rowItem;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}


@end
