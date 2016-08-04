//
//  HomeLayout.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeLayout.h"
#import "RegexKitLite.h"

@implementation HomeLayout

- (instancetype)initWithModel:(HomeModel *)homeModel {
    self = [super init];
    if (self) {
        if (_homeModel != homeModel) {
            _homeModel = homeModel;
            [self loadData];
        }
    }
    return self;
}


- (void)loadData {
    
    NSDictionary *dic = _homeModel.user;
    _userModel = [UserModel yy_modelWithDictionary:dic];
    
    [self initFrame];
}

- (void)initFrame {
    
    //整个
    self.frame = CGRectMake(0, 0, kScreenWidth, 0);
    //头像
    self.profileImageFrame = CGRectMake(5, 5, 50, 50);
    //名字和来源
    CGFloat nameW = [_userModel.screen_name boundingRectWithSize:CGSizeMake(300, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.width;
    self.nameFrame = CGRectMake(60, 5, nameW, 30);
    NSString *time = [ZhouDate weiboTime:_homeModel.created_at];
    NSArray *array = [_homeModel.source componentsMatchedByRegex:kSourceRegex];
    NSString *str1 = [array firstObject];
    NSString *str2 = [str1 substringWithRange:NSMakeRange(1, str1.length - 2)];
    _sourceText = [NSString stringWithFormat:@"%@ %@",time,str2];
    CGFloat sourceW = [_sourceText boundingRectWithSize:CGSizeMake(kScreenWidth - 60, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.width;
    self.sourceFrame = CGRectMake(60, 35, sourceW, 20);
    
    //正文
    //原创
    if (_homeModel.retweeted_status == nil) {
        _homeModel.isRePost = NO;
    } else {
        //转发
        _homeModel.isRePost = YES;
    }
    
    CGFloat textH = [_homeModel.text boundingRectWithSize:CGSizeMake(kScreenWidth - 10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
    self.textFrame = CGRectMake(5, 60, kScreenWidth - 10, textH);
    
    CGFloat frameH = 60 + _textFrame.size.height;
    self.frame = CGRectMake(0, 0, kScreenWidth, frameH);
}

@end
