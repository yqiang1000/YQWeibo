//
//  UserModel.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (copy, nonatomic) NSString *created_at; //微博创建时间
@property (copy, nonatomic) NSString *idstr; //字符串型的微博ID
@property (copy, nonatomic) NSString *text; //微博信息内容
@property (copy, nonatomic) NSString *source; //微博来源
@property (copy, nonatomic) NSDictionary *user; //微博作者的用户信息字段
@property (copy, nonatomic) NSDictionary *retweeted_status; //转发的微博
@property (copy, nonatomic) NSString *thumbnail_pic; //缩略图片地址，没有时不返回此字段
@property (copy, nonatomic) NSString *bmiddle_pic; //中等尺寸图片地址，没有时不返回此字段
@property (copy, nonatomic) NSString *original_pic; //原始图片地址，没有时不返回此字段
@property (assign, nonatomic) NSInteger reposts_count; //转发数
@property (assign, nonatomic) NSInteger comments_count; //评论数

@property (assign, nonatomic) BOOL isRePost; //是否转发

@end
