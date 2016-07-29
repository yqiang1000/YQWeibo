//
//  HomeLayout.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeLayout.h"

@implementation HomeLayout

- (instancetype)initWithModel:(HomeModel *)homeModel {
    self = [super init];
    if (self) {
        if (_homeModel != homeModel) {
            _homeModel = homeModel;
            [self loadData];
            [self loadView];
        }
    }
    return self;
}


- (void)loadData {
    
    NSDictionary *dic = _homeModel.user;
    _userModel = [UserModel yy_modelWithDictionary:dic];
    
    
}

- (void)loadView {
    /**
     @property (assign, nonatomic) CGRect frame; //整个微博
     @property (assign, nonatomic) CGRect textFrame; //发表文字
     @property (assign, nonatomic) CGRect reTextFrame; //转发的文字
     @property (assign, nonatomic) CGRect imageFrame; //微博图片
     */
}

@end
