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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavi];
}
#pragma mark - 初始化

- (void)initUI {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.view addSubview:_tableView];
}

#pragma mark - View(页面处理)

- (HomeTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HomeTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    }
    return _tableView;
}
#pragma mark - XXXDelegate


#pragma mark - 对外接口


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
    }];
}

- (void)endRefresh {
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_header endRefreshing];
}
#pragma mark - 懒加载
- (void)loadData {
    
    if (!kGetToken) {
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:kGetToken forKey:@"access_token"];
    [params setObject:@"10" forKey:@"count"];
    
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    
    [YeHttp GetURL:Url(API_Firends) Params:params Success:^(id responseData) {
        
        NSArray *array = [[NSArray alloc] initWithArray:responseData[@"statuses"]];
        
        for (NSDictionary *dic in array) {
            HomeModel *model = [HomeModel yy_modelWithDictionary:dic];
            HomeLayout *layout = [[HomeLayout alloc] initWithModel:model];
            [modelArray addObject:layout];
        }
        self.tableView.data = modelArray;
        [self endRefresh];
    } Faile:^(NSError *error) {
        NSLog(@"%@",error);
        [self endRefresh];
    }];
    
}


@end
