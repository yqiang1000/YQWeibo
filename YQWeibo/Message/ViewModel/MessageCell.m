//
//  MessageCell.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    
    self.data = [[NSMutableArray alloc] init];
    NSString *tel = @"123456";
    NSString *add = @"helloworld";
    
    for (NSInteger i = 0; i < 10; i++) {
        MessageModel *model = [[MessageModel alloc] init];
        for (NSInteger j = 0; j < i; j++) {
            [model.tel addObject:tel];
            [model.add addObject:add];
        }
        model.name = @"wang";
        [self.data addObject:model];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
