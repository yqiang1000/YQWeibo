//
//  WeiboView.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/5.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "WeiboView.h"

@implementation WeiboView

- (void)setHomeLayout:(HomeLayout *)homeLayout {
    if (_homeLayout != homeLayout) {
        _homeLayout = homeLayout;
    }
    [self createView];
}

- (void)createView {
    
    //文本
    self.textLabel.frame = _homeLayout.textFrame;
    self.textLabel.text = _homeLayout.homeModel.text;
    [self addSubview:_textLabel];
    
    //图片
    
    
}


//单例
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
    }
    return _textLabel;
}

@end
