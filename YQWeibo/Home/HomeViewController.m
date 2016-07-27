//
//  HomeViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface HomeViewController ()<WBHttpRequestDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(loadData) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];
    
    
}

#pragma mark - 初始化

- (void)initUI {
    
}

#pragma mark - View(页面处理)


#pragma mark - XXXDelegate


#pragma mark - 对外接口


#pragma mark - private methods(内部接口)


#pragma mark - lazy loading


#pragma mark - 懒加载

- (void)loadData {
    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:API_Firends]];
//    
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        NSLog(@"%@",response);
//        NSLog(@"%@",responseObject);
//    }];
//    [dataTask resume];
    
    
    
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:kWeiboToken];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:token forKey:@"access_token"];
    [params setObject:@"10" forKey:@"count"];
    
//    [WBHttpRequest requestWithURL:API_Firends httpMethod:@"GET" params:params delegate:self withTag:@"hello"];
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:API_Firends parameters:params error:nil];
    
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error {
    
}

- (void)request:(WBHttpRequest *)request didReceiveResponse:(NSURLResponse *)response {
    
    
    
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result {
    
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data {
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSJSONSerialization *jsonstr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"%@",str);
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
