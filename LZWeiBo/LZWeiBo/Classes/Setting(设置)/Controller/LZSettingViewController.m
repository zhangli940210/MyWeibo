//
//  LZSettingViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZSettingViewController.h"
#import "LZGeneralSettingViewController.h"
#import "MBProgressHUD+MJ.h"
#import "LZSettingBottomView.h"
#import "LZPrivacyViewController.h"
#import "LZNotificationViewController.h"

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
    
    // 设置底部控件
    [self setupBottomView];
}

- (void)setupBottomView
{
    // 1.拿到底部视图
    LZSettingBottomView *bottomView = [LZSettingBottomView settingBottomView];
    // 2.设置高度
    bottomView.height = 59;
    self.tableView.tableFooterView = bottomView;
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
    item1.desClass = [LZNotificationViewController class];
    item2.desClass = [LZPrivacyViewController class];
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
    // 2.赋值,获取文件尺寸字符串
    item1.detailTitle = [self getFileSizeStr];
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
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        rowItem.detailTitle = [self getFileSizeStr];
    }
    // 给Cell赋值模型
    cell.rowItem = rowItem;
    
    return cell;
}

// 点击选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        UIAlertController *alertController = [[UIAlertController alloc] init];
        // 添加按钮
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            [MBProgressHUD showSuccess:@"正在清理缓存..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD showSuccess:@"缓存已清除"];
            });
            
            // 清空缓存
            // 获取Cache文件下所有文件
            // 获取文件夹下一级目录
            [LZFileManager removeDirectoryPath:cachePath];
            // 刷新表格
            [self.tableView reloadData];
            
        }];
        UIAlertAction *cancellAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:sureAction];
        [alertController addAction:cancellAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    } else { // 保持父类的做法
        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
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

// 获取文件尺寸字符串
- (NSString *)getFileSizeStr
{
    // 获取文件夹尺寸
    NSInteger totalSize = [LZFileManager getDirectorySize:cachePath];
    
    NSString *str = @"0M";
    // 判断
    if (totalSize > 1000 * 1000) { // MB
        CGFloat totalSizeF = totalSize / 1000.0 / 1000.0;
        str = [NSString stringWithFormat:@"%.0fM",totalSizeF];
    }
    return str;
}

@end
