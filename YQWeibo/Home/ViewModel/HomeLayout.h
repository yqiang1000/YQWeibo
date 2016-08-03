//
//  HomeLayout.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"
#import "UserModel.h"

@interface HomeLayout : NSObject

@property (assign, nonatomic) CGRect frame; //整个微博
@property (assign, nonatomic) CGRect nameFrame;
@property (assign, nonatomic) CGRect sourceFrame; //来源
@property (assign, nonatomic) CGRect profileImageFrame; //头像
@property (assign, nonatomic) CGRect textFrame; //发表文字
@property (assign, nonatomic) CGRect reTextFrame; //转发的文字
@property (assign, nonatomic) CGRect imageFrame; //微博图片

@property (strong, nonatomic) HomeModel *homeModel;
@property (strong, nonatomic) UserModel *userModel;

- (instancetype)initWithModel:(HomeModel *)model;

@end
