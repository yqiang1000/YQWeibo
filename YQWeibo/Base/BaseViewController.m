//
//  BaseViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
{
    UILabel *_titleLabel;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)titleView:(UIView *)view {
    [self.navigationItem setTitleView:view];
}

- (void)title:(NSString *)title color:(UIColor *)color {
    if (!_titleLabel) {
        
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     };
        CGFloat width = [title boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
        
        _titleLabel.text = title;
        _titleLabel.textColor = color;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self titleView:_titleLabel];
    }
}

- (void)setTitle:(NSString *)title {
    
    //创建导航栏标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:26 weight:1];
    
    self.navigationItem.titleView = _titleLabel;
}

- (void)login {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURL;
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
}

- (void)leftItem:(UINavigationItem *)item {
    
}

- (void)rightItem:(UINavigationItem *)item {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
