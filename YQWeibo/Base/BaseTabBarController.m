//
//  BaseTabBarController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "UIStoryboard+LoadViewController.h"
#import "MenuViewController.h"
#import "YeTabBar.h"

@interface BaseTabBarController ()<YeTabBarDelegate>

@end

@implementation BaseTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self resetTabBar];
}

- (void)setNavi {
    
    NSArray *names = @[@"Home",@"Message",@"Discover",@"Me"];
    NSMutableArray *navis = [[NSMutableArray alloc] initWithCapacity:4];
    
    for (NSInteger i = 0 ; i < names.count; i++) {
        
        BaseNavigationController *navi = (BaseNavigationController *)[UIStoryboard NavigationControllerWithBoundle:nil WithStoryBoard:names[i] WithIdentifier:nil];
        [navis addObject:navi];
    }
    
    self.viewControllers = navis;
}

//reset tabBar
- (void)resetTabBar {
    
    NSArray *normalArray = @[@"tabbar_home",
                             @"tabbar_message_center",
                             @"tabbar_discover",
                             @"tabbar_profile",];
    NSArray *selectArray = @[@"tabbar_home_selected",
                             @"tabbar_message_center_selected",
                             @"tabbar_discover_selected",
                             @"tabbar_profile_selected"];
    
    NSArray *array = @[@"首页",@"消息",@"发现",@"我",];
    
    /**
     *  给tabBarItem赋值
     */
    [UITabBar appearance].tintColor = [UIColor colorWithRed:253/255.0 green:109/255.0 blue:9/255.0 alpha:1];
    
    for (int i = 0; i < array.count; i++) {
        UITabBarItem *barItem = self.tabBar.items[i];
        [barItem setImage:[UIImage imageNamed:normalArray[i]]];
        UIImage *image = [UIImage imageNamed:selectArray[i]];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [barItem setSelectedImage:image];
        [barItem setTitle:array[i]];
    }

    YeTabBar *yeTabBar = [[YeTabBar alloc] initWithFrame:self.view.frame];
    yeTabBar.yedelegate = self;
    [self setValue:yeTabBar forKey:@"tabBar"];

}

- (void)presentViewController {
    
    MenuViewController *meunVC = [[MenuViewController alloc] init];
    [self presentViewController:meunVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
