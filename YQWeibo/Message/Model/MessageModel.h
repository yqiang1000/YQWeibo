//
//  MessageModel.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (strong, nonatomic) NSMutableArray *tel;
@property (strong, nonatomic) NSMutableArray *add;
@property (copy, nonatomic) NSString *name;

@end
