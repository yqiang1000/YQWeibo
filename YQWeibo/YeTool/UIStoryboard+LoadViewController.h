//
//  UIStoryboard+LoadViewController.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (LoadViewController)

/**
 *  brief
 *
 *  @param identifier ViewControllerId in MainStoryBoard
 *
 *  @return viewController
 */
+ (UIViewController *)ViewControllerFromMainStoryBoardWithIdentifier:(NSString *)identifier;

/**
 *  brief
 *
 *  @param storyBoardName StoryBoardName
 *  @param identifier     ViewControllerId
 *
 *  @return viewController
 */
+ (UIViewController *)ViewControllerFromeStoryBoardWithStoryName:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier;

/**
 *  brief
 *
 *  @param boundName      BoundName
 *  @param storyBoardName StoryBoardName
 *  @param identifier     ViewControllerId
 *
 *  @return viewController
 */
+ (UIViewController *)ViewControllerWithBoundName:(NSString *)boundName WithStoryName:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier;


+ (UINavigationController *)NavigationControllerWithBoundle:(NSString *)boundle WithStoryBoard:(NSString *)storyBoardName WithIdentifier:(NSString *)identifier;

@end
