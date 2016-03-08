//
//  LZUserCell.m
//  LZWeiBo
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZUserCell.h"
#import "LZUser.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"

#import "LZAccountTool.h"
#import "LZAccount.h"

@interface LZUserCell ()

/** 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 昵称*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 用户所在地*/
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
/** 关注按钮*/
@property (weak, nonatomic) IBOutlet UIButton *focusButton;


@end

@implementation LZUserCell


/**
 *  关注
 */
- (IBAction)focus:(id)sender {
    LZLog(@"111");
    /*
     // https://api.weibo.com/2/friendships/create.json
     //    必选	类型及范围	说明
     //    access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
     //    uid	false	int64	需要关注的用户ID。
     //    screen_name	false	string	需要关注的用户昵称。
     //    rip	false	string	开发者上报的操作用户真实IP，形如：211.156.0.1。
     */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
//    params[@"uid"] = account.uid;
//    params[@"uid"] = self.user.idstr;
    params[@"screen_name"] = self.user.screen_name;
    
    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/2/friendships/create.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        LZLog(@"---%@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        LZLog(@"---%@", error);
    }];
}

// 设置数据
- (void)setUser:(LZUser *)user
{
    _user = user;
    
    self.nameLabel.text = user.name;
    self.locationLabel.text = user.location;
    
    UIImage *placehoder = [UIImage imageNamed:@"avatar_default_small"]; // 占位图
    NSString *imageUrl = user.profile_image_url;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placehoder];
}


@end
