//
//  MenuViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()<WeiboSDKDelegate>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"编辑";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button addTarget:self action:@selector(hello) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button];

}

- (void)hello {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
