//
//  UIStoryboard+LoadViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "UIStoryboard+LoadViewController.h"

@implementation UIStoryboard (LoadViewController)

+ (UIViewController *)ViewControllerFromMainStoryBoardWithIdentifier:(NSString *)identifier {
    return [self ViewControllerWithBoundName:nil WithStoryName:@"Main" WithIdentifier:identifier];
    
}

+ (UIViewController *)ViewControllerFromeStoryBoardWithStoryName:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier {
    return [self ViewControllerWithBoundName:nil WithStoryName:storyBoardName WithIdentifier:identifier];
}

+ (UIViewController *)ViewControllerWithBoundName:(NSString *)boundName WithStoryName:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier {
    
    return nil;
}

+ (UINavigationController *)NavigationControllerWithBoundle:(NSString *)boundle WithStoryBoard:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier {
    
    UIStoryboard *stroyBoard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    if (identifier != nil) {
        UINavigationController *navi = [stroyBoard instantiateViewControllerWithIdentifier:identifier];
        return navi;
    }
    UINavigationController *navi = [stroyBoard instantiateInitialViewController];
    return navi;
}

@end
