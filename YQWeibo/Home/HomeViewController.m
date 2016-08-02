//
//  HomeViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "YeHttp.h"
#import "HomeModel.h"
#import "HomeLayout.h"
#import "UserModel.h"

@interface HomeViewController ()<WBHttpRequestDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

#pragma mark - 初始化

- (void)initUI {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    //设置导航栏
    [self setNavi];
    
    [self setTableView];
}

#pragma mark - View(页面处理)
- (void)setTableView {
    _tableView = [[HomeTableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
}

#pragma mark - XXXDelegate


#pragma mark - 对外接口


#pragma mark - private methods(内部接口)
- (void)titleButton:(UIButton *)button {
    NSLog(@"dianji");
}

#pragma mark - lazy loading
- (void)setNavi {

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kGetToken forKey:@"access_token"];
    [params setObject:kGetUserId forKey:@"uid"];
    
    [YeHttp GetURL:Url(API_User_Info) Params:params Success:^(id responseData) {
        
        UserModel *model = [UserModel yy_modelWithDictionary:responseData];
        NSString *name = model.name;
        //创建button
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     };
        CGFloat width = [name boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
        [button setTitle:name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleButton:) forControlEvents:UIControlEventTouchUpInside];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self titleView:button];
        });
        
    } Faile:^(NSError *error) {
        
    }];
}

#pragma mark - 懒加载
- (void)loadData {
    
    if (!kGetToken) {
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kGetToken forKey:@"access_token"];
    [params setObject:@"3" forKey:@"count"];
    
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    
    [YeHttp GetURL:Url(API_Firends) Params:params Success:^(id responseData) {
        
        NSArray *array = [[NSArray alloc] initWithArray:responseData[@"statuses"]];
        
        for (NSDictionary *dic in array) {
            HomeModel *model = [HomeModel yy_modelWithDictionary:dic];
            HomeLayout *layout = [[HomeLayout alloc] initWithModel:model];
            [modelArray addObject:layout];
        }
        
    } Faile:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



/*

{
    "statuses": [
                 {
                     "created_at": "Tue May 31 17:46:55 +0800 2011",
                     "id": 11488058246,
                     "text": "求关注。"，
                     "source": "<a href="http://weibo.com" rel="nofollow">新浪微博</a>",
                     "favorited": false,
                     "truncated": false,
                     "in_reply_to_status_id": "",
                     "in_reply_to_user_id": "",
                     "in_reply_to_screen_name": "",
                     "geo": null,
                     "mid": "5612814510546515491",
                     "reposts_count": 8,
                     "comments_count": 9,
                     "annotations": [],
                     "user": {
                         "id": 1404376560,
                         "screen_name": "zaku",
                         "name": "zaku",
                         "province": "11",
                         "city": "5",
                         "location": "北京 朝阳区",
                         "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",
                         "url": "http://blog.sina.com.cn/zaku",
                         "profile_image_url": "http://tp1.sinaimg.cn/1404376560/50/0/1",
                         "domain": "zaku",
                         "gender": "m",
                         "followers_count": 1204,
                         "friends_count": 447,
                         "statuses_count": 2908,
                         "favourites_count": 0,
                         "created_at": "Fri Aug 28 00:00:00 +0800 2009",
                         "following": false,
                         "allow_all_act_msg": false,
                         "remark": "",
                         "geo_enabled": true,
                         "verified": false,
                         "allow_all_comment": true,
                         "avatar_large": "http://tp1.sinaimg.cn/1404376560/180/0/1",
                         "verified_reason": "",
                         "follow_me": false,
                         "online_status": 0,
                         "bi_followers_count": 215
                     }
                 },
                 ..
                 ],
    "previous_cursor": 0,
    "next_cursor": 11488013766,
    "total_number": 81655
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
 
 */

@end
