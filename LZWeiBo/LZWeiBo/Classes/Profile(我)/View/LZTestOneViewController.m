//
//  LZTestOneViewController.m
//  LZWeiBo
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZTestOneViewController.h"
#import "LZTestTwoViewController.h"

@interface LZTestOneViewController ()

@end

@implementation LZTestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LZTestTwoViewController *two = [[LZTestTwoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
