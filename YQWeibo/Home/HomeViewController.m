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

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavi];
    [self.tableView.header beginRefreshing];
}
#pragma mark - 初始化

- (void)initUI {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self.view addSubview:_tableView];
}

#pragma mark - View(页面处理)

//单例
- (HomeTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HomeTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    }
    return _tableView;
}

#pragma mark - private methods(内部接口)
- (void)titleButton:(UIButton *)button {
    NSLog(@"dianji");
}

#pragma mark - lazy loading
- (void)setNavi {

    if (!kGetToken) {
        [self title:@"首页" color:[UIColor grayColor]];
        return;
    }
    
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
        NSLog(@"失败");
    }];
}

- (void)endRefresh {
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_header endRefreshing];
}
#pragma mark - 懒加载
- (void)loadData {
    
    if (!kGetToken) {
        [self endRefresh];
        return;
    }
    _data = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kGetToken forKey:@"access_token"];
    [params setObject:@"10" forKey:@"count"];
    [params setObject:@"0" forKey:@"max_id"];
    
    [YeHttp GetURL:Url(API_Home) Params:params Success:^(id responseData) {
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:responseData[@"statuses"]];

        for (NSDictionary *dic in array) {
            HomeModel *model = [HomeModel yy_modelWithDictionary:dic];
            HomeLayout *layout = [[HomeLayout alloc] initWithModel:model];
            [_data addObject:layout];
        }
        self.tableView.data = _data;
        [self endRefresh];
    } Faile:^(NSError *error) {
        NSLog(@"%@",error);
        [self endRefresh];
        
        NSData *data1 = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
    }];
    
}


- (void)loadMoreData {
    if (!kGetToken) {
        [self endRefresh];
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kGetToken forKey:@"access_token"];
    [params setObject:@"10" forKey:@"count"];
    HomeLayout *lastHomeLayout = [_data lastObject];
    NSString *maxId = lastHomeLayout.homeModel.idstr;
    [params setObject:maxId forKey:@"max_id"];
    
    [YeHttp GetURL:Url(API_Home) Params:params Success:^(id responseData) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:responseData[@"statuses"]];
        if (array.count != 0) {
            [array removeObjectAtIndex:0];
            for (NSDictionary *dic in array) {
                HomeModel *model = [HomeModel yy_modelWithDictionary:dic];
                HomeLayout *layout = [[HomeLayout alloc] initWithModel:model];
                [_data addObject:layout];
            }
        }
        self.tableView.data = _data;
        [self endRefresh];
    } Faile:^(NSError *error) {
        [self endRefresh];
    }];
    
    
}

@end
