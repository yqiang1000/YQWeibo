//
//  MeViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self title:@"我" color:[UIColor grayColor]];
}

- (IBAction)registAction:(UIButton *)sender {
    NSLog(@"注册");
}

- (IBAction)loginInAction:(UIButton *)sender {
    
    [self login];
//    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
//    request.redirectURI = kRedirectURL;
//    request.scope = @"all";
//    [WeiboSDK sendRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
