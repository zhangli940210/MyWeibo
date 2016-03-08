//
//  LZHomeViewController.m
//  LZWeiBo
//
//  Created by apple on 16/2/27.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZHomeViewController.h"
#import "LZTitleMenuViewController.h"
#import "LZDropdownMenu.h"
#import "AFNetworking.h"
#import "LZAccountTool.h"
#import "LZTitleButton.h"
#import "UIImageView+WebCache.h"
#import "LZUser.h"
#import "LZStatus.h"
#import "MJExtension.h"


@interface LZHomeViewController () <LZDropdownMenuDelegate>

/**
 *  微博数组（里面放的都是LZStatus模型，一个LZStatus对象就代表一条微博）
 */
@property (nonatomic, strong) NSMutableArray *statuses;

@end

@implementation LZHomeViewController

- (NSMutableArray *)statuses
{
    if (!_statuses) {
        self.statuses = [NSMutableArray array];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏上面的内容
    [self setupNav];
    
    // 获得用户信息(昵称)
    [self setupUserInfo];
    
    // 集成刷新控件
    [self setupRefresh];
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    UIRefreshControl *control = [[UIRefreshControl alloc] init];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:control];
}

/**
 *  UIRefreshControl进入刷新状态：加载最新的数据
 */
- (void)refreshStateChange:(UIRefreshControl *)control
{
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    
    // 取出最前面的微博（最新的微博，ID最大的微博）
    LZStatus *firstStatus = [self.statuses firstObject];
    
    if (firstStatus) { //
        // 若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0
        params[@"since_id"] = firstStatus.idstr;
    }
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        // 将 "微博字典"数组 转为 "微博模型"数组
        NSArray *newStatuses = [LZStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        // 将最新的微博数据，添加到总数组的最前面
        NSRange range = NSMakeRange(0, newStatuses.count);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.statuses insertObjects:newStatuses atIndexes:set];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [control endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 结束刷新
        [control endRefreshing];
    }];
}

/**
 *  设置导航栏上面的内容
 */
- (void)setupNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(sweep) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    /* 中间的标题按钮 */
    LZTitleButton *titleButton = [[LZTitleButton alloc] init];
    // 设置图片和文字
    NSString *name = [LZAccountTool account].name;
    [titleButton setTitle:name?name:@"首页" forState:UIControlStateNormal];
    // 监听标题点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
}

/**
 *  获得用户信息(昵称)
 */
- (void)setupUserInfo
{
    /*
    // https://api.weibo.com/2/users/show.json
    // access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
    // uid	false	int64	需要查询的用户ID。
    */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        // 标题按钮
        LZTitleButton *titleButton = (LZTitleButton *)self.navigationItem.titleView;
        // 设置名字
        LZUser *user = [LZUser objectWithKeyValues:responseObject];
        [titleButton setTitle:user.name forState:UIControlStateNormal];
        
        // 存储昵称到沙盒中
        account.name = user.name;
        [LZAccountTool saveAccount:account];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/**
 *  标题点击
 */
- (void)titleClick:(UIButton *)titleButton
{
    // 1.创建下拉菜单,也就是一个透明的UIView,相当于蒙版
    LZDropdownMenu *menu = [LZDropdownMenu menu];
    menu.delegate = self;
    
    // 2.设置内容,给蒙版里面的容器view添加子视图
    LZTitleMenuViewController *vc = [[LZTitleMenuViewController alloc] init];
    vc.view.height = 44 * 3;
    vc.view.width = 150;
    menu.contentController = vc;
    
    // 3.显示
    [menu showFrom:titleButton];

}

// 搜索朋友
- (void)friendSearch
{
    LZLog(@"friendSearch");
}
// 扫一扫
- (void)sweep
{
    LZLog(@"pop");
}

#pragma mark - LZDropdownMenuDelegate代理方法
/**
 *  下拉菜单被销毁了
 */
- (void)dropdownMenuDidDismiss:(LZDropdownMenu *)menu
{
    // 让箭头向下
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = NO;
}

/**
 *  下拉菜单显示了
 */
- (void)dropdownMenuDidShow:(LZDropdownMenu *)menu
{
    // 让箭头向上
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected = YES;
}

#pragma mark - Table view data source
// 每组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"status";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 取出这行对应的微博模型
    LZStatus *status = self.statuses[indexPath.row];
    
    // 取出这条微博的作者（用户）
    LZUser *user = status.user;
    cell.textLabel.text = user.name;
    
    // 设置微博的文字
    cell.detailTextLabel.text = status.text;
    
    // 设置头像
    UIImage *placehoder = [UIImage imageNamed:@"avatar_default_small"];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:placehoder];
    return cell;
}



@end
