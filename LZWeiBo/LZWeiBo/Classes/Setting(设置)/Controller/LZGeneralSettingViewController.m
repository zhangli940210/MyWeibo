//
//  LZGeneralSettingViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZGeneralSettingViewController.h"

@interface LZGeneralSettingViewController ()

@end

@implementation LZGeneralSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用设置";
    // 添加5组
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];
    [self addGroup3];
}

// 第三组
- (void)addGroup0
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"阅读模式"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"字号大小"];
    LZSwitchItem *item3 = [LZSwitchItem settingRowItemWithImage:nil title:@"显示备注"];
    item1.detailTitle = @"有图模式";
    item2.detailTitle = @"小";
    item3.isChoose = YES;
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2, item3];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第一组
- (void)addGroup1
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"图片浏览设置"];
    LZArrowItem *item2 = [LZArrowItem settingRowItemWithImage:nil title:@"视频自动播放"];
    item1.detailTitle = @"自适应";
    item2.detailTitle = @"仅WiFi";
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1, item2];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
    
}
// 第二组
- (void)addGroup2
{
    LZSwitchItem *item1 = [LZSwitchItem settingRowItemWithImage:nil title:@"声音"];
    item1.isChoose = YES;
    // 创建一个行数组,装的是行模型
    NSArray *rowArray = @[item1];
    // 创建一个组模型
    LZSettingGroupItem *groupItem = [LZSettingGroupItem settingItemWithRowArray:rowArray];
    
    [self.groupArray addObject:groupItem];
}

// 第四组
- (void)addGroup3
{
    LZArrowItem *item1 = [LZArrowItem settingRowItemWithImage:nil title:@"多语言环境"];
    item1.detailTitle = @"跟随系统";
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 3 && indexPath.row == 5) {
//        [MBProgressHUD showSuccess:@"清理完毕"];
//    } else { // 保持父类的做法
//        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
//    }
//}


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
