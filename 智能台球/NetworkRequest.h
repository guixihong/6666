//
//  NetworkRequest.h
//  智能台球
//
//  Created by 孙超 on 16/7/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络请求类型
 */
typedef NS_ENUM(NSUInteger,HttpRequestType) {
    /**
     *  get请求
     */
    HttpRequestTypeGet = 0,
    /**
     *  post请求
     */
    HttpRequestTypePost
};

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError *error);

@interface NetworkRequest : NSObject
/**
 *  发送网络请求
 *
 *  @param URLString   请求的网址
 *  @param parameters  请求的参数
 *  @param type        请求的类型
 *  @param cacheTypeString  缓存区分
 *  @param  refreshState 是否刷新
 *  @param  success 请求成功回调
 *  @param  failure 请求失败回调

 */
+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
//             cacheTypeString:(NSString *)cacheType
//                refreshState:(BOOL)refreshState
                     success:(SuccessBlock)success
                     failure:(FailureBlock)failure;

//创建缓存路径
//+(NSString *)generatePathWithString:(NSString *)urlString;

//清除缓存
//+(void)removeAllCaches;

@end
