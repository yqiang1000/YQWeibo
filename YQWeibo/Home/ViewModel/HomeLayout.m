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

    /**
     @property (copy, nonatomic) NSString *idstr; //字符串型的用户UID
     @property (copy, nonatomic) NSString *screen_name; //用户昵称
     @property (copy, nonatomic) NSString *name; //友好显示名称
     @property (copy, nonatomic) NSString *location; //用户所在地
     //@property (copy, nonatomic) NSString *description; //用户个人描述
     @property (copy, nonatomic) NSString *url; //用户博客地址
     @property (copy, nonatomic) NSString *profile_image_url; //用户头像地址（中图），50×50像素
     @property (copy, nonatomic) NSString *avatar_large; //用户头像地址（大图），180×180像素
     @property (copy, nonatomic) NSString *avatar_hd; //用户头像地址（高清），高清头像原图
     
     @property (copy, nonatomic) NSString *profile_url; //用户的微博统一URL地址
     @property (copy, nonatomic) NSString *gender; //性别，m：男、f：女、n：未知
     
     @property (assign, nonatomic) NSInteger followers_count; //粉丝数
     @property (assign, nonatomic) NSInteger friends_count; //关注数
     @property (assign, nonatomic) NSInteger statuses_count; //微博数
     @property (assign, nonatomic) NSInteger favourites_count; //收藏数
     @property (copy, nonatomic) NSString *created_at; //用户创建（注册）时间
     @property (assign, nonatomic) BOOL allow_all_act_msg; //是否允许所有人给我发私信，true：是，false：否
     @property (assign, nonatomic) BOOL geo_enabled; //是否允许标识用户的地理位置，true：是，false：否
     @property (assign, nonatomic) BOOL verified; //是否是微博认证用户，即加V用户，true：是，false：否
     @property (copy, nonatomic) NSString *fstatus; //用户的最近一条微博信息字段 详细
     @property (assign, nonatomic) BOOL allow_all_comment; //是否允许所有人对我的微博进行评论，true：是，false：否
     
     @property (copy, nonatomic) NSString *lang; //用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语

     */
    
    
    self.frame = CGRectMake(0, 0, kScreenWidth, 0);
    self.profileImageFrame = CGRectMake(5, 5, 50, 50);
    
    
    CGFloat nameW = [_userModel.screen_name boundingRectWithSize:CGSizeMake(kScreenWidth - 60, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
    self.nameFrame = CGRectMake(60, 5, nameW, 30);
    
    NSString *text = @"";
    NSString *time = [ZhouDate weiboTime:_homeModel.created_at];
    NSString *sourceStr = [NSString stringWithFormat:@"%@ %@",time,_homeModel.source];
    CGFloat sourceW = [sourceStr boundingRectWithSize:CGSizeMake(kScreenWidth - 60, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.width;
    self.sourceFrame = CGRectMake(60, 35, sourceW, 20);
    
    
    
    
    
}

@end
