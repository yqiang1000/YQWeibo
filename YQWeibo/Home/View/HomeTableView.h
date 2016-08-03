//
//  HomeTableView.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/1.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayout.h"

@interface HomeTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *data;

@end
