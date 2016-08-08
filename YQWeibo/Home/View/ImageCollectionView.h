//
//  ImageCollectionView.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/8.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *data;

@end
