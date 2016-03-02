//
//  LZTitleMenuViewController.m
//  LZWeiBo
//
//  Created by apple on 16/3/1.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZTitleMenuViewController.h"


@interface LZTitleMenuViewController ()

@end

@implementation LZTitleMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置tableView的背景色透明
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"好友圈";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"群微博";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"特别关注";
    }
    // 设置文字颜色
    cell.textLabel.textColor = [UIColor whiteColor];
    // 设置cell的背景色透明
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
@end