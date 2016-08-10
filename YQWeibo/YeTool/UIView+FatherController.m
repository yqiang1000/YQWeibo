//
//  UIView+FatherController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/10.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "UIView+FatherController.h"

@implementation UIView (FatherController)

- (UIViewController *)ViewController {
    UIResponder *next = self;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        else next = next.nextResponder;
        
    } while (next != nil);
    return nil;
}

@end
