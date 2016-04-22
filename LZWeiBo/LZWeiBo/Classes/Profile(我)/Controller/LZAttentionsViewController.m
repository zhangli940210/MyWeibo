//
//  LZAttentionsViewController.m
//  LZWeiBo
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZAttentionsViewController.h"
#import "AFNetworking.h"
#import "LZAccountTool.h"
#import "LZUser.h"
#import "MJExtension.h"
#import "LZUserCell.h"

@interface LZAttentionsViewController ()

/**
 *  粉丝数组（里面放的都是LZUser模型，一个LZUser对象就代表一个粉丝）
 */
@property (nonatomic, strong) NSArray *users;

@end

@implementation LZAttentionsViewController


static NSString *ID = @"user";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册方法
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZUserCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    // 获得用户信息（关注）
    [self setupUserInfo];
    
}

/**
 *  获得用户信息（关注）
 */
- (void)setupUserInfo
{
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    params[@"count"] = @200;
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/friendships/friends.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        // 将 "用户字典"数组 转为 "用户模型"数组
        self.users = [LZUser objectArrayWithKeyValuesArray:responseObject[@"users"]];
        // 刷新数据
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        LZLog(@"请求失败-%@", error);
    }];
}

#pragma mark - Table view data source
// 多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
// 每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}
// 每行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 拿到数据
    LZUser *user = self.users[indexPath.row];
    // 如果想要做一些比较炫的动画效果, 可以在这
    [cell.layer removeAnimationForKey:@"cell"];
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.keyPath = @"transform.rotation.z";
    animation.values = @[@(1), @(0), @(-1), @(0)];
    animation.duration = 0.5;
    [cell.layer addAnimation:animation forKey:@"cell"];
    cell.user = user;
    
    return cell;
}
// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

@end
