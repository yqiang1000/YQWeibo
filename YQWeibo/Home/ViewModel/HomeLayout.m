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
    _sourceText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ 来自%@",time,str2]];
    [_sourceText addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, time.length)];
    self.sourceFrame = CGRectMake(60, 35, kScreenWidth - 60, 20);
    
    //自己的正文
    CGFloat textH = [YeLabel getHeight:_homeModel.text size:CGSizeMake(kScreenWidth - 10, MAXFLOAT) font:15];
    
//    NSString *textStr = _homeModel.text;
//    self.text = [[NSMutableAttributedString alloc] initWithString:_homeModel.text];
//    //#话题#
//    NSString *regex1 = @"#\w+#";
//    //@用户
//    NSString *regex2 = @"^@";
//    //http:url
//    NSString *regex3 = @"^@";
//    
//    NSArray *topics = [textStr componentsMatchedByRegex:kTopic];
//    
//    for (NSString *str in topics) {
//        NSLog(@"%@",str);
//    }
//    NSString *emotionPattern = @"\\[[0-9a-zA-Z\\u4e00-\\u9fa5]+\\]";
    
//    // @的规则
//    NSString *atPattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5]+";
//    
//    // #话题#的规则
//    NSString *topicPattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
//    
//    // url链接的规则
//    NSString *urlPattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))";
    
    
    self.textFrame = CGRectMake(5, 65, kScreenWidth - 10, textH);
    
    
    
    //转发
    if (_homeModel.reHomeModel != nil) {
        
        //转发的文字
        CGFloat  reTextH = [YeLabel getHeight:_homeModel.reHomeModel.text size:CGSizeMake(kScreenWidth - 10, MAXFLOAT) font:15];
        self.reTextFrame = CGRectMake(5, 65 + textH, kScreenWidth - 10, reTextH);
        
        //转发的图片
        NSInteger imageCount = _homeModel.reHomeModel.pic_urls.count;
        CGFloat imageW = (kScreenWidth - 5 * 4) / 3.0;
        CGFloat imageH = imageW;
        
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
        CGFloat imageW = (kScreenWidth - 5 * 4) / 3.0;
        CGFloat imageH = imageW;
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
    CGFloat buttonH = 65 + _textFrame.size.height + _reTextFrame.size.height + _imageFrame.size.height + 5;
    
    self.buttonFrame = CGRectMake(5, buttonH, kScreenWidth - 10, 40);
    
    self.frame = CGRectMake(0, 0, kScreenWidth, buttonH + _buttonFrame.size.height);
}


@end
