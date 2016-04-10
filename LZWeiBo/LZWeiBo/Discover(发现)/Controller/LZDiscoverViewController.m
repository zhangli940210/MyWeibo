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
#import "LZSchoolViewCell.h"
#import "LZSchoolItem.h"

@interface LZDiscoverViewController () <UITextFieldDelegate>

/** 保存搜索框里面的内容*/
@property (nonatomic, copy) NSString *searchText;

/** 学校模型数组*/
@property (nonatomic, strong) NSArray *schools;

/** LZSearchBar对象*/
@property (nonatomic, weak) LZSearchBar *searchBar;

@end

@implementation LZDiscoverViewController

static NSString const * ID = @"school";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建搜索框对象
    [self createSearchBar];
    // 2.注册方法
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZSchoolViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    // 3.设置背景色
    self.tableView.backgroundColor = [UIColor grayColor];
    // 4.取消系统分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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
    _searchBar = searchBar;
}

// 当文本内容改变时调用
- (void)textChange:(LZSearchBar *)searchBar
{
    self.searchText = searchBar.text;
}

#pragma mark - UITextFieldDelegate方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    // 退出编辑
    [_searchBar resignFirstResponder];
    
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
    /*
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    // 中文转码
    params[@"q"] = [self.searchText URLEncodedString];
    params[@"type"] = @(0);
    params[@"count"] = @20;
     */
    NSString *URLStr = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/schools.json?access_token=%@&q=%@&count=%@", account.access_token, [self.searchText URLEncodedString], @20];
    // 3.发送请求
    [mgr GET:URLStr parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        // 将 "微博字典"数组 转为 "微博模型"数组
        self.schools = [LZSchoolItem objectArrayWithKeyValuesArray:responseObject];
        // 刷新数据
        [self.tableView reloadData];
        [self.view endEditing:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        LZLog(@"请求失败-%@", error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.schools.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.去缓存里面取
    LZSchoolViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.赋值
    cell.item = self.schools[indexPath.row];
    // 3.返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
