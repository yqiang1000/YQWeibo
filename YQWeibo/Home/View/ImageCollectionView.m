//
//  ImageCollectionView.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/8.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "ImageCollectionView.h"

@implementation ImageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"image"];
    }
    return self;
}


- (void)setData:(NSArray *)data {
    if (_data != data) {
        _data = data;
    }
    [self reloadData];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"image";
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    NSDictionary *urlDic = [_data objectAtIndex:indexPath.row];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlDic[@"thumbnail_pic"]]];
    [cell.contentView addSubview:imageView];
    return cell;
}

@end
