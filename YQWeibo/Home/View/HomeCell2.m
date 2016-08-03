//
//  HomeCell2.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/8/3.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeCell2.h"

@interface HomeCell2 ()
{
    HomeModel *_homeModel;
}

@end

@implementation HomeCell2

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
    _headImageView = [[UIImageView alloc] initWithFrame:_homeLayout.profileImageFrame];
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:_homeLayout.userModel.profile_image_url] placeholderImage:nil];
    
    _nameLabel = [[UILabel alloc] initWithFrame:_homeLayout.nameFrame];
    _nameLabel.text = _homeLayout.userModel.screen_name;
    
    _noReTextLabel = [[UILabel alloc] initWithFrame:_homeLayout.textFrame];
    _noReTextLabel.text = _homeModel.text;
    _noReTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    [self.contentView addSubview:_headImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_noReTextLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
