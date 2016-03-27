//
//  LZDiscoverViewController.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "LZDiscoverViewController.h"
#import "AFNetworking.h"
#import "LZAccountTool.h"
#import "LZUser.h"
#import "MJExtension.h"
#import "LZSearchBar.h"

@interface LZDiscoverViewController () <UITextFieldDelegate>

/** 保存搜索框里面的内容*/
@property (nonatomic, copy) NSString *searchText;

@end

@implementation LZDiscoverViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建搜索框对象
    [self createSearchBar];
    
}
// 创建搜索框对象
- (void)createSearchBar
{
    LZSearchBar *searchBar = [LZSearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30;
    // 设置returnKeyType类型
    searchBar.returnKeyType = UIReturnKeySearch;
    // 添加监听事件
    [searchBar addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    // 设置代理
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
}

// 当文本内容改变时调用
- (void)textChange:(LZSearchBar *)searchBar
{
    self.searchText = searchBar.text;
}

#pragma mark - UITextFieldDelegate方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    // 获得搜索信息
    [self setupUserInfo];
    return YES;
}

/**
 *  获得搜索信息
 */
- (void)setupUserInfo
{
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    // 中文转码
    self.searchText = [self.searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    params[@"q"] = [NSURL URLWithString:self.searchText];
    params[@"type"] = @1;
    params[@"count"] = @20;
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/search/suggestions/schools.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        LZLog(@"--%@", responseObject);
        
        // 将 "微博字典"数组 转为 "微博模型"数组
//        self.users = [LZUser objectArrayWithKeyValuesArray:responseObject[@"users"]];
        // 刷新数据
//        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        LZLog(@"请求失败-%@", error);
    }];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 50;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
