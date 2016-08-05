//
//  HomeCell2.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/3.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayout.h"
#import "HomeModel.h"
#import "WeiboView.h"

@interface HomeCell : UITableViewCell

@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *sourceLabel;
@property (strong, nonatomic) UILabel *noReTextLabel;


@property (strong, nonatomic) HomeLayout *homeLayout;
@property (strong, nonatomic) WeiboView *weiboView;

- (void)setHomeLayout:(HomeLayout *)homeLayout;

@end
