//
//  LZSettingViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZSettingViewController.h"
#import "LZGeneralSettingViewController.h"

@interface LZSettingViewController ()

@end

@implementation LZSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题
    self.title = @"设置";
    // 添加3组
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
}

// 第0组
- (void)addGroup0
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"账号管理"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"账号安全"];
    
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    [self.groupArray addObject:groupItem];
}

// 第1组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"通知"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"隐私与安全"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"通用设置"];
    item3.desClass = [LZGeneralSettingViewController class];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    [self.groupArray addObject:groupItem];
}

// 第2组
- (void)addGroup2
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"清理缓存"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"意见反馈"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"关于微博"];
    
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3];
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
