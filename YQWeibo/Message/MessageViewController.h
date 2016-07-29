//
//  MessageViewController.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseViewController.h"

@interface MessageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) CGFloat cellHeight;
@end
