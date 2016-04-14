

#import "LZMessageCenterViewController.h"
#import "LZUserInfoView.h"

@interface LZMessageCenterViewController ()


@end

@implementation LZMessageCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 创建对象
    LZUserInfoView *userInfoView = [LZUserInfoView userInfoView];
    userInfoView.frame = CGRectMake(0, 0, 0, 140);
    self.tableView.tableHeaderView = userInfoView;
    
}

- (void)composeMsg
{
    NSLog(@"composeMsg");
}

#pragma mark - Table view data sourc

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"我的赞";
    cell.imageView.image = [UIImage imageNamed:@"like"];
    // 设置右边显示的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

// 初始化tableView
//- (void)setupTableView
//{
//    // style : 这个参数是用来设置背景的，在iOS7之前效果比较明显, iOS7中没有任何效果
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写私信" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
//    // 这个item不能点击(目前放在viewWillAppear就能显示disable下的主题)
//    self.navigationItem.rightBarButtonItem.enabled = NO;
//}

@end
