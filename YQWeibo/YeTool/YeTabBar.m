//
//  YeTabBar.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/2.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "YeTabBar.h"

@interface YeTabBar() {
    UIButton *_addButton;
}
@end

@implementation YeTabBar

- (UIButton *)addButton {
    
    if (!_addButton) {
        _addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 44)];
    }
    
    [_addButton setBackgroundImage:kImage(@"tabbar_compose_button") forState:UIControlStateNormal];
    [_addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [_addButton setImage:[UIImage imageNamed:@"compose_pic_big_add"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
    _addButton.center = self.center;
    [self addSubview:_addButton];
    
    return _addButton;
}

//修改TabBar，调整位置
- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat w = self.bounds.size.width / 5;
    CGFloat h = self.bounds.size.height;
    int i = 0;
    
    for (UIView *childView in self.subviews) {
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            childView.frame = CGRectMake(i * w, 0, w, h);
            if (i == 1) {
                i++;
            }
            i++;
        }
    }
    self.addButton.center = CGPointMake(kScreenWidth / 2, h / 2);

}

//点击弹出 MenuVC
- (void)presentVC {
    if ([self.yedelegate respondsToSelector:@selector(presentViewController)]) {
        [self.yedelegate presentViewController];
    }
}

@end
