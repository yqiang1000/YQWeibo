//
//  YeLabel.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/5.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YeLabel : UILabel

+ (CGFloat)getHeight:(NSString *)text size:(CGSize)size font:(CGFloat)font;
+ (CGFloat)getWidth:(NSString *)text size:(CGSize)size font:(CGFloat)font;

@end
