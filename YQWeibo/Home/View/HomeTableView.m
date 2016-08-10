//
//  HomeTableView.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/1.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeCell.h"

@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)setData:(NSArray *)data {
    if (_data != data) {
        _data = data;
    }
    [self reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeLayout *homelayout = _data[indexPath.row];
    CGFloat h = homelayout.frame.size.height;
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"homeCell2";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.homeLayout = _data[indexPath.row];
    return cell;
}



@end
