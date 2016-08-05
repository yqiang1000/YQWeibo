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
    
    //名字
    self.nameLabel.frame = _homeLayout.nameFrame;
    self.nameLabel.text = _homeLayout.userModel.screen_name;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    //来源
    self.sourceLabel.frame = _homeLayout.sourceFrame;
    
    self.sourceLabel.attributedText = _homeLayout.sourceText;
    self.sourceLabel.font = [UIFont systemFontOfSize:15];
    
    //weiboView
    self.weiboView.frame = _homeLayout.weiboViewFrame;
    self.weiboView.homeLayout = _homeLayout;
    self.weiboView.backgroundColor = [UIColor orangeColor];
    
//    //正文
//    self.noReTextLabel.frame = _homeLayout.textFrame;
//    self.noReTextLabel.text = _homeModel.text;
//    self.noReTextLabel.font = [UIFont systemFontOfSize:15];
//    self.noReTextLabel.numberOfLines = 0;
    [self.contentView addSubview:_headImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_sourceLabel];
    [self.contentView addSubview:_weiboView];
    
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

- (UILabel *)noReTextLabel {
    if (!_noReTextLabel) {
        _noReTextLabel = [[UILabel alloc] init];
    }
    return _noReTextLabel;
}

- (WeiboView *)weiboView {
    if (!_weiboView) {
        _weiboView = [[WeiboView alloc] init];
    }
    return _weiboView;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
