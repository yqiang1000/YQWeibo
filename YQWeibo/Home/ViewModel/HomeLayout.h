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

@property (assign, nonatomic) CGRect weiboViewFrame; //除了头像的那一行的大小

@property (copy, nonatomic) NSMutableAttributedString *sourceText;

@property (strong, nonatomic) HomeModel *homeModel;
@property (strong, nonatomic) UserModel *userModel;

- (instancetype)initWithModel:(HomeModel *)model;

@end
/*
 //原创
 //正文
 CGFloat textH = [YeLabel getHeight:_homeModel.text size:CGSizeMake(kScreenWidth - 10, MAXFLOAT) font:15];
 self.textFrame = CGRectMake(5, 5, kScreenWidth - 10, textH);
 
 //图片
 NSInteger imageCount = _homeModel.pic_urls.count;
 CGFloat imageW = 0;
 CGFloat imageH = 0;
 switch (imageCount) {
 case 0: //无图片
 imageW = 0;
 imageH = 0;
 break;
 case 1: //一张图
 imageW = (kScreenWidth - 15)/2.0;
 imageH = imageW * 1.5;
 break;
 default:    //好几张图
 imageW = (kScreenWidth - 5 * 4) / 3.0;
 imageH = imageW;
 break;
 }
 
 NSInteger section = imageCount / 3; //每行三张图，有几行
 if (section < 3) {
 self.weiboViewFrame = CGRectMake(0, 60 + 5, kScreenWidth, (imageH+5) * section);
 } else {
 self.weiboViewFrame = CGRectMake(0, 60 + 5, kScreenWidth, (imageH+5) * 3);
 }
 
 }
 */