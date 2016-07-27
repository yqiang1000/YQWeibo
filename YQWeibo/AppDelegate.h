//
//  AppDelegate.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/25.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (copy, nonatomic) NSString *wbtoken;
@property (copy, nonatomic) NSString *wbRefreshToken;
@property (copy, nonatomic) NSString *wbCurrentUserID;

@end

