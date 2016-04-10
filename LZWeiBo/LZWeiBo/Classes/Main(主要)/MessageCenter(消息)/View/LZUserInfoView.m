//
//  LZUserInfoView.m
//  LZWeiBo
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "LZUserInfoView.h"
#import "LZUser.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "LZAccountTool.h"
#import "LZAccount.h"

@interface LZUserInfoView ()
/** 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 昵称*/
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 微博数量*/
@property (weak, nonatomic) IBOutlet UILabel *weiboNumLabel;
/** 关注数量*/
@property (weak, nonatomic) IBOutlet UILabel *guanzhuNumLabel;
/** 粉丝数量*/
@property (weak, nonatomic) IBOutlet UILabel *fansNumLabel;

@end

@implementation LZUserInfoView

+ (instancetype)userInfoView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    // 2.拼接请求参数
    LZAccount *account = [LZAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    // 3.发送请求
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        // 获取用户数据
        LZUser *user = [LZUser objectWithKeyValues:responseObject];
        // 设置头像
        [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (image == nil) {
                return ;
            }
            // 获取圆形图片
            UIImage *newImage = [image circleImage];
            self.iconView.image = newImage;
            
        }];
        // 设置昵称
        self.nameLabel.text = user.screen_name;
        // 设置微博数
        self.weiboNumLabel.text = [NSString stringWithFormat:@"%zd", user.statuses_count];
        // 设置关注数
        self.guanzhuNumLabel.text = [NSString stringWithFormat:@"%zd", user.friends_count];
        // 设置粉丝数
        self.fansNumLabel.text = [NSString stringWithFormat:@"%zd", user.followers_count];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
