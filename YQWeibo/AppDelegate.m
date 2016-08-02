//
//  AppDelegate.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/25.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "WBHttpRequest.h"

@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[BaseTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    [self weiboInit];
    return YES;
}

- (void)weiboInit {
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    
    
    
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    
    if ([response isKindOfClass:[WBSendMessageToWeiboResponse class]]) {
        WBSendMessageToWeiboResponse *sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse *)response;
        NSString *accessToken = sendMessageToWeiboResponse.authResponse.accessToken;
        if (accessToken) {
            self.wbtoken = accessToken;
        }
        
        NSString *userId = sendMessageToWeiboResponse.authResponse.userID;
        if (userId) {
            self.wbCurrentUserID = userId;
        }
        
    } else if ([response isKindOfClass:[WBAuthorizeResponse class]]) {
        WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *)response;
        self.wbtoken = [authorizeResponse accessToken];
        self.wbCurrentUserID = [authorizeResponse userID];
        self.wbRefreshToken = [authorizeResponse refreshToken];
        
        if (!self.wbtoken) {
            return;
        }
        //存到本地
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSMutableDictionary *weiboDic = [[NSMutableDictionary alloc] init];
        [weiboDic setObject:self.wbtoken forKey:kWeiboToken];
        [weiboDic setObject:self.wbCurrentUserID forKey:kWeiboUserId];
        [weiboDic setObject:self.wbRefreshToken forKey:kWeiboRefreshToken];
        [userDefaults setObject:weiboDic forKey:kWeiboDictionary];
        
        [userDefaults synchronize];
        
    }
    
}



- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self ];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
