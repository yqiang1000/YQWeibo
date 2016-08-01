//
//  TabBarButton.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/1.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton

- (instancetype)initWithFrame:(CGRect)frame Normal:(NSString *)normal Highlighted:(NSString *)high Selected:(NSString *)selected {
    self = [super initWithFrame:frame];
    if (self) {
        _normal = normal;
        _highlight = high;
        _isSelected = selected;
        
        [self setView];
    }
    return self;
}

- (void)setView {
    
}

@end
