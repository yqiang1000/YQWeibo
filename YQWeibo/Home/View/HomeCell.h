//
//  HomeCell.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/1.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayout.h"
#import "HomeModel.h"

@interface HomeCell : UITableViewCell

@property (strong, nonatomic) HomeLayout *homeLayout;
@property (strong, nonatomic) HomeModel *homeModel;

@end
