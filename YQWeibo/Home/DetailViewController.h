//
//  DetailViewController.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/11.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeLayout.h"
#import "ImageCollectionView.h"
#import "HomeModel.h"

@interface DetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) HomeLayout *homeLayout;
@property (strong, nonatomic) UITableView *tableView;

@end
