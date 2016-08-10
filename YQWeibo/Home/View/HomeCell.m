//
//  HomeCell2.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/3.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
{
    HomeModel *_homeModel;
}

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHomeLayout:(HomeLayout *)homeLayout {
    if (_homeLayout != homeLayout) {
        _homeLayout = homeLayout;
        [self createLayout];
    }
}

- (void)createLayout {
    _homeModel = _homeLayout.homeModel;
    //头像
    self.headImageView.frame = _homeLayout.profileImageFrame;
    self.headImageView.layer.cornerRadius = _headImageView.frame.size.height / 2;
    self.headImageView.layer.masksToBounds = YES;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_homeLayout.userModel.profile_image_url] placeholderImage:nil];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:_homeLayout.userModel.profile_image_url] placeholderImage:nil];
    });
    //名字
    self.nameLabel.frame = _homeLayout.nameFrame;
    self.nameLabel.text = _homeLayout.userModel.screen_name;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    //来源
    self.sourceLabel.frame = _homeLayout.sourceFrame;
    self.sourceLabel.attributedText = _homeLayout.sourceText;
    self.sourceLabel.font = [UIFont systemFontOfSize:15];
    
    //自己的文字
    self.textLabel1.frame = _homeLayout.textFrame;
    self.textLabel1.text = _homeLayout.homeModel.text;
    self.textLabel1.font = [UIFont systemFontOfSize:15];
    self.textLabel1.numberOfLines = 0;
    
    //转发的文字
    self.textLabel2.frame = _homeLayout.reTextFrame;
    self.textLabel2.text = _homeLayout.homeModel.reHomeModel.text;
    self.textLabel2.numberOfLines = 0;
    self.textLabel2.font = [UIFont systemFontOfSize:15];

    //图片
    self.data = nil;
    if (_homeLayout.homeModel.reHomeModel == nil) {
        self.data = _homeLayout.homeModel.pic_urls;
    } else {
        self.data = _homeLayout.homeModel.reHomeModel.pic_urls;
    }
    
    //imageView
    self.view.frame = _homeLayout.imageFrame;
    [self.contentView addSubview:_view];
    
    if (_view.bounds.size.height > 0) {
        [_collectionView removeFromSuperview];
        _flowLayout = [self flowLayout];
        self.collectionView = [[ImageCollectionView alloc] initWithFrame:CGRectMake(0, 0, _view.bounds.size.width, _view.bounds.size.height) collectionViewLayout:_flowLayout];
        self.collectionView.data = self.data;
        [self.view addSubview:_collectionView];
    } else {
        [_view removeFromSuperview];
        [_collectionView removeFromSuperview];
    }
    
    //buttonView
    self.buttonView.frame = _homeLayout.buttonFrame;
    [self.contentView addSubview:_buttonView];
    

    [self.contentView addSubview:_headImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_sourceLabel];
    [self.contentView addSubview:_textLabel1];
    [self.contentView addSubview:_textLabel2];
    
    
    UIButton *bt1 = [UIButton new];
    UIButton *bt2 = [UIButton new];
    UIButton *bt3 = [UIButton new];
}

//单例
- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
    }
    return _headImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
    }
    return _sourceLabel;
}

- (UILabel *)textLabel1 {
    if (!_textLabel1) {
        _textLabel1 = [[UILabel alloc] init];
    }
    return _textLabel1;
}

- (UILabel *)textLabel2 {
    if (!_textLabel2) {
        _textLabel2 = [[UILabel alloc] init];
    }
    return _textLabel2;
}

- (UICollectionViewFlowLayout *)flowLayout {
    
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    CGFloat h = (kScreenWidth - 20)/3;
    [_flowLayout setItemSize:CGSizeMake(h - 5, h - 5)];
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _flowLayout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    return _flowLayout;
    
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] init];
    }
    return _view;
}

- (UIView *)buttonView {
    if (!_buttonView) {
        _buttonView = [[UIView alloc] init];
    }
    return _buttonView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
    } else {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    // Configure the view for the selected state
}

@end
