//
//  BaseViewController.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)titleView:(UIView *)view;
- (void)title:(NSString *)title color:(UIColor *)color;
- (void)login;

@end
