//
//  MessageCell.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MessageCell : UITableViewCell

@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) MessageModel *model;

@end
