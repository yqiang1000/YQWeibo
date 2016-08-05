//
//  YeLabel.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/5.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "YeLabel.h"

@implementation YeLabel

+ (CGFloat)getHeight:(NSString *)text size:(CGSize)size font:(CGFloat)font {
    CGFloat height = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size.height;
    return height;
}

+ (CGFloat)getWidth:(NSString *)text size:(CGSize)size font:(CGFloat)font {
    CGFloat width = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size.width;
    return width;
}

@end
