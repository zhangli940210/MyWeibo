//
//  LZNotificationViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/17.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZNotificationViewController.h"

@interface LZNotificationViewController ()

@end

@implementation LZNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置标题
    self.title = @"通知";
    // 添加3组
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
    [self addGroup3];
}

// 第0组
- (void)addGroup0
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"推送通知"];
    item1.detailTitle = @"已开启";
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第1组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"@我的"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"评论"];
    LZArrowItem *item3 = [LZArrowItem settingRowItemWithImage:nil title:@"赞"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"消息"];
    LZSwitchItem *item5 = [LZSwitchItem settingRowItemWithImage:nil title:@"群通知"];
    LZArrowItem *item6 = [LZArrowItem settingRowItemWithImage:nil title:@"未关注人消息"];
    LZArrowItem *item7 = [LZArrowItem settingRowItemWithImage:nil title:@"新粉丝"];
    
    item1.detailTitle = @"所有人";
    item2.detailTitle = @"所有人";
    item4.isChoose = YES;
    item5.isChoose = YES;
    item6.detailTitle = @"我关注的人";
    item7.detailTitle = @"所有人";
    
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3, item4, item5, item6, item7];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    groupItem.headerT = @"新消息通知";
    [self.groupArray addObject:groupItem];
}

// 第2组
- (void)addGroup2
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"好友圈微博"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"特别关注微博"];
    LZSwitchItem *item3 = [LZSwitchItem settingRowItemWithImage:nil title:@"群微博"];
    LZSwitchItem *item4 = [LZSwitchItem settingRowItemWithImage:nil title:@"微博热点"];
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3, item4];
    item1.isChoose = YES;
    item3.isChoose = YES;
    item4.isChoose = YES;
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    groupItem.headerT = @"新微博推送通知";
    [self.groupArray addObject:groupItem];
}

- (void)addGroup3
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"免打扰设置"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"获取新消息"];
    item2.detailTitle = @"每半分钟";
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
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
