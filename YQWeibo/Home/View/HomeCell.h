//
//  HomeCell2.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/3.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayout.h"
#import "HomeModel.h"
#import "ImageCollectionView.h"

@interface HomeCell : UITableViewCell

@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *sourceLabel;
@property (strong, nonatomic) UILabel *textLabel1;
@property (strong, nonatomic) UILabel *textLabel2;

@property (strong, nonatomic) NSArray *data;

@property (strong, nonatomic) ImageCollectionView *collectionView;

@property (strong, nonatomic) HomeLayout *homeLayout;

- (void)setHomeLayout:(HomeLayout *)homeLayout;

@end
