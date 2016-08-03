//
//  ZhouDate.h
//  时间转换
//
//  Created by zzl on 16/3/1.
//  Copyright © 2016年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZhouDate : NSObject

+ (NSDate *)getCurrentDate;         //获取当前北京时间
+ (NSString *)getDateStringFromDate:(NSDate *)date;  //转换成字符串
+ (NSDate * )stringToNSDate: (NSString * )string;  //字符串转日期
+ (NSDate * )en_USstringToNSDate:(NSString * )string; //美国时间转NSDate
+ (NSString *)weiboTime:(NSString *)string;         //微博快捷时间获取

@end
