//
//  YeHttp.m
//  YQWeibo
//
//  Created by WeibaYeQiang on 16/7/28.
//  Copyright © 2016年 YQ. All rights reserved.
//

#import "YeHttp.h"

@implementation YeHttp

+ (void)GetURL:(NSString *)url Params:(NSDictionary *)parmas Success:(RequestWithSuccessedBlock)success Faile:(RequestWithErrorBlock)faile {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:parmas progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faile(error);
    }];
}

+ (void)PostURL:(NSString *)url Params:(NSDictionary *)parmas Success:(RequestWithSuccessedBlock)success Faile:(RequestWithErrorBlock)faile {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parmas constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        nil;
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        faile(error);
    }];
}


@end
