//
//  YeHttp.h
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/28.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^RequestWithSuccessedBlock)(id responseData);
typedef void(^RequestWithErrorBlock)(NSError *error);

@interface YeHttp : NSObject

+ (void)GetURL:(NSString *)url Params:(NSDictionary *)parmas Success:(RequestWithSuccessedBlock)success Faile:(RequestWithErrorBlock)faile;

+ (void)PostURL:(NSString *)url Params:(NSDictionary *)parmas Success:(RequestWithSuccessedBlock)success Faile:(RequestWithErrorBlock)faile;

@end
