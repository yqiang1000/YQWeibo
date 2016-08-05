//
//  WeiboView.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/5.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeLayout.h"

@interface WeiboView : UIView

@property (copy, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) HomeLayout *homeLayout;

@end
