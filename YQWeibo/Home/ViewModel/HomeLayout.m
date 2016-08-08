//
//  HomeLayout.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/29.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "HomeLayout.h"
#import "RegexKitLite.h"

@implementation HomeLayout

- (instancetype)initWithModel:(HomeModel *)homeModel {
    self = [super init];
    if (self) {
        if (_homeModel != homeModel) {
            _homeModel = homeModel;
            [self loadData];
        }
    }
    return self;
}


- (void)loadData {
    
    NSDictionary *dic = _homeModel.user;
    _userModel = [UserModel yy_modelWithDictionary:dic];
    
    [self initFrame];
}

- (void)initFrame {
    
    //原创
    if (_homeModel.retweeted_status == nil) {
        
        _homeModel.isRePost = NO;
    } else {
        //转发
        _homeModel.isRePost = YES;
        
        _homeModel.reHomeModel = [HomeModel yy_modelWithDictionary:_homeModel.retweeted_status];
        
    }

    
    //整个
    self.frame = CGRectMake(0, 0, kScreenWidth, 0);
    
    //头像
    self.profileImageFrame = CGRectMake(5, 5, 50, 50);
    //名字和来源
    CGFloat nameW = [_userModel.screen_name boundingRectWithSize:CGSizeMake(300, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.width;
    self.nameFrame = CGRectMake(60, 5, nameW, 30);
    NSString *time = [ZhouDate weiboTime:_homeModel.created_at];
    NSArray *array = [_homeModel.source componentsMatchedByRegex:kSourceRegex];
    NSString *str1 = [array firstObject];
    NSString *str2 = [str1 substringWithRange:NSMakeRange(1, str1.length - 2)];
    NSString *str3 = [NSString stringWithFormat:@"%@ 来自%@",time,str2];
    _sourceText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",time,str2]];
    [_sourceText addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, time.length)];
    CGFloat sourceW = [YeLabel getWidth:str3 size:CGSizeMake(kScreenWidth - 60, 30) font:15];
    self.sourceFrame = CGRectMake(60, 35, sourceW, 20);
    
    //自己的正文
    CGFloat textH = [YeLabel getHeight:_homeModel.text size:CGSizeMake(kScreenWidth - 10, MAXFLOAT) font:15];
    self.textFrame = CGRectMake(5, 65, kScreenWidth - 10, textH);
    
    //转发
    if (_homeModel.reHomeModel != nil) {
        
        //转发的文字
        CGFloat  reTextH = [YeLabel getHeight:_homeModel.reHomeModel.text size:CGSizeMake(kScreenWidth - 10, MAXFLOAT) font:15];
        self.reTextFrame = CGRectMake(5, 65 + textH, kScreenWidth - 10, reTextH);
        
        //转发的图片
        NSInteger imageCount = _homeModel.reHomeModel.pic_urls.count;
        CGFloat imageW = 0;
        CGFloat imageH = 0;
        switch (imageCount) {
            case 0: //无图片
                imageW = 0;
                imageH = 0;
                break;
            case 1: //一张图
                imageW = (kScreenWidth - 15)/2.0;
                imageH = imageW * 1.5;
                break;
            default:    //好几张图
                imageW = (kScreenWidth - 5 * 4) / 3.0;
                imageH = imageW;
                break;
        }
        
        
        NSInteger section = imageCount / 3; //每行三张图，有几行
        NSInteger row = imageCount % 3;
        
        CGFloat h = 65 + _textFrame.size.height + _reTextFrame.size.height;
        
        //图片在文字下面
        if (row == 0) {
            self.imageFrame = CGRectMake(5, h, kScreenWidth - 10, (imageH + 5) * section);
        } else {
            self.imageFrame = CGRectMake(5, h, kScreenWidth - 10 , (imageH + 5) * (section + 1));
        }
        
        CGFloat frameH = h + _imageFrame.size.height + 5;
        self.frame = CGRectMake(0, 0, kScreenWidth, frameH);
        
    } else {
        //原创图片
        NSInteger imageCount = _homeModel.pic_urls.count;
        CGFloat imageW = 0;
        CGFloat imageH = 0;
        switch (imageCount) {
            case 0: //无图片
                imageW = 0;
                imageH = 0;
                break;
            case 1: //一张图
                imageW = (kScreenWidth - 15)/2.0;
                imageH = imageW * 1.5;
                break;
            default:    //好几张图
                imageW = (kScreenWidth - 5 * 4) / 3.0;
                imageH = imageW;
                break;
        }
        

        NSInteger section = imageCount / 3; //每行三张图，有几行
        NSInteger row = imageCount % 3;
        
        CGFloat h = 65 + textH + 5;
        
        //图片在文字下面
        if (row == 0) {
            self.imageFrame = CGRectMake(5, h, kScreenWidth - 10, (imageH + 5) * section);
        } else {
            self.imageFrame = CGRectMake(5, h, kScreenWidth - 10, (imageH + 5) * (section + 1));
        }
        
    }
    
    //微博高度 ＝ text ＋ image
    CGFloat frameH = 65 + _textFrame.size.height + _reTextFrame.size.height + _imageFrame.size.height + 5;
    self.frame = CGRectMake(0, 0, kScreenWidth, frameH);
}


@end
