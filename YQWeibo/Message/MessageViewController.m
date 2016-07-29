//
//  MessageViewController.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/26.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
#import "MessageModel.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.backgroundColor = [UIColor redColor];
    self.cellHeight = 44 * 1;
    CGRect frame = self.tableView.frame;
    frame.size.width = 100;
    self.tableView.frame = frame;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:self options:nil] lastObject];
        self.cellHeight = (cell.model.tel.count + cell.model.add.count + 1) * 44;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end