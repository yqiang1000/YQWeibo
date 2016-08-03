//
//  ZhouDate.m
//  时间转换
//
//  Created by zzl on 16/3/1.
//  Copyright © 2016年 zzl. All rights reserved.
//

#import "ZhouDate.h"
#define kDEFAULT_DATE_TIME_FORMAT (@"yyyy-MM-dd HH:mm:ss")

@implementation ZhouDate

+ (NSDate *)getCurrentDate{
    NSDate *myDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:myDate];
    NSDate *localeDate = [myDate dateByAddingTimeInterval:interval];
    return localeDate;
}

+(NSString *)getDateStringFromDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:kDEFAULT_DATE_TIME_FORMAT];
    NSString *string = [formatter stringFromDate:date];
    return string;
}

+ (NSDate * )stringToNSDate:(NSString * )string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:kDEFAULT_DATE_TIME_FORMAT];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

+ (NSDate * )en_USstringToNSDate:(NSString * )string{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

+ (NSString *)weiboTime:(NSString *)string{         //微博快捷时间获取
    NSDate *date = [ZhouDate en_USstringToNSDate:string];
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }else if((temp = timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }else if((temp = temp/60) < 24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }else if((temp = temp/24) < 30){
        
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }else if((temp = temp/30) < 12){
        [formatter setDateFormat:@"MM-dd"];
        NSString *string = [formatter stringFromDate:date];
        result = [NSString stringWithFormat:@"%@",string];
    }
    else{
        temp = temp/12;
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *string = [formatter stringFromDate:date];
        result = [NSString stringWithFormat:@"%@",string];
    }
    return result;
}


@end
