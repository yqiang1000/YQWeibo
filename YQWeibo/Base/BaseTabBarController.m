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

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavi];
    [self resetTabBar];
}

- (void)setNavi {
    
    NSArray *names = @[@"Home",@"Message",@"Search",@"Me"];
    NSMutableArray *navis = [[NSMutableArray alloc] initWithCapacity:4];
    
    for (NSInteger i = 0 ; i < names.count; i++) {
        
        BaseNavigationController *navi = (BaseNavigationController *)[UIStoryboard NavigationControllerWithBoundle:nil WithStoryBoard:names[i] WithIdentifier:nil];
        [navis addObject:navi];
        
    }
    
    self.viewControllers = navis;
    
}

//reset tabBar
- (void)resetTabBar {
    //move old
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    
    NSArray *heightArray = @[@"tabbar_home_highlighted",
                             @"tabbar_message_highlighted",
                             @"compose_pic_add_highlighted",
                             @"tabbar_discover_highlighted",
                             @"tabbar_more_highlighted"];
    NSArray *normalArray = @[@"tabbar_home",
                             @"tabbar_message",
                             @"compose_pic_add",
                             @"tabbar_discover",
                             @"tabbar_more",];
    NSArray *selectArray = @[@"tabbar_home_selected",
                             @"tabbar_message_selected",
                             @"compose_pic_add",
                             @"tabbar_discover_selected",
                             @"tabbar_more_selected",];
    
    //add new
    CGFloat Bw = kScreenWidth / 5;
    for (NSInteger i = 0; i < 5; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * Bw, 0, Bw, 49)];
        button.tag = i;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *image = kImage(normalArray[i]);
        [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        image = kImage(heightArray[i]);
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
        image = kImage(selectArray[i]);
        [button setBackgroundImage:image forState:UIControlStateSelected];
        [self.tabBar addSubview:button];
    }
    
}

- (void)selectAction:(UIButton *)button {
    NSInteger index = self.selectedIndex;
    if (button.tag < 3) {
        if (button.tag != 2) {
            index = button.tag;
        } else {
            //present send message
            [self presentMenuVC];
        }
        
    } else {
        index = button.tag - 1;
    }
    NSLog(@"select === %ld",index);
    self.selectedIndex = index;
}

- (void)presentMenuVC {
    MenuViewController *meunVC = [[MenuViewController alloc] init];
    [self presentViewController:meunVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
