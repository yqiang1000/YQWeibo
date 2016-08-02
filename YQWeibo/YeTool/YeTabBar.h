//
//  YeTabBar.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/2.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YeTabBar;

@protocol YeTabBarDelegate <NSObject>

- (void)presentViewController;

@end

@interface YeTabBar : UITabBar<YeTabBarDelegate>

@property (weak, nonatomic) id<YeTabBarDelegate> yedelegate;

@end
