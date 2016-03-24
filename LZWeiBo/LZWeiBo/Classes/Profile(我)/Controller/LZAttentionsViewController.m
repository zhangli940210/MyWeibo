//
//  LZAttentionsViewController.m
//  LZWeiBo
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZAttentionsViewController.h"

@interface LZAttentionsViewController ()

@end

@implementation LZAttentionsViewController

static NSString *ID = @"one";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册方法
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [NSString stringWithFormat:@"One--%zd", indexPath.row];
    
    return cell;
}


@end
