//
//  NetworkRequest.m
//  智能台球
//
//  Created by 孙超 on 16/7/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "NetworkRequest.h"

@implementation NetworkRequest

+ (void)requestWithURLString:(NSString *)URLString
                  parameters:(id)parameters
                        type:(HttpRequestType)type
//             cacheTypeString:(NSString *)cacheType
//                refreshState:(BOOL)refreshState
                     success:(SuccessBlock)success
                     failure:(FailureBlock)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//使用这个将得到的是NSData
    
//直接写入文件缓存
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSString *newPath = [self generatePathWithString:cacheType];
//    SLog(newPath);
//    if (cacheType && ![cacheType isEqualToString:@""]) {
//        
//        if ([fileManager fileExistsAtPath:newPath]) {
//            
//            if (refreshState == YES) {
//                SLog(@"刷新界面移除缓存");
//                [fileManager removeItemAtPath:newPath error:nil];
//                
//            }else{
//                SLog(@"读取本地已有缓存");
//                NSData *newData = [NSData dataWithContentsOfFile:newPath];
//                NSDictionary *newDic = [self dataToJson:newData];
//                success(newDic);
//                return;
//            }
//            
//        }
//
//    }
//直接写入文件缓存结束
    
    
//    AppDelegate *delegate =APPDELEGATE;
//    YYCache *cache = delegate.myYyCache;
//        if (cacheType && ![cacheType isEqualToString:@""]) {
//            
//              BOOL contains = [cache containsObjectForKey:cacheType];
//            
//                if (contains) {
//                    
//                    if (refreshState == YES) {
//                        
//                        SLog(@"刷新界面移除缓存");
//                        [cache removeObjectForKey:cacheType];
//                        
//                    }else{
//                        
//                        SLog(@"读取本地已有缓存");
//                        NSData *wData = (NSData *)[cache objectForKey:cacheType];
//                        NSDictionary *newDic = [self dataToJson:wData];
//                        success(newDic);
//                        return;
//
//                    }
//                    
//                }
//            
//        }
//   
    
    switch (type) {
        case HttpRequestTypeGet:
        {
                [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                SLog(@"请求成功");
                if (success) {
//                    NSData *wdata = responseObject;
//                    [wdata writeToFile:newPath atomically:YES];
                    
//                    [cache setObject:wdata forKey:cacheType];
                    NSDictionary *newDic = [self dataToJson:responseObject];
                    success(newDic);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (failure) {
                    failure(error);
                }
                
            }];
            
        }
            break;
        case HttpRequestTypePost:
        {            
            [manager POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                
                if (success) {
//                    NSData *wdata = responseObject;
//                    [wdata writeToFile:newPath atomically:YES];
//                    [cache setObject:wdata forKey:cacheType];

                    NSDictionary *newDic = [self dataToJson:responseObject];
                    success(newDic);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (failure) {
                    failure(error);
                }
                
            }];
        }
            break;
    }
}

+(NSDictionary *)dataToJson:(NSData *)data{

    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dict;
}

//+(NSString *)generatePathWithString:(NSString *)urlString{
//
//    // 获取Caches目录路径
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
//    NSString *cachesDir = [paths objectAtIndex:0];
//    
//    NSString *cachePath = [NSString stringWithFormat:@"%@/%@",cachesDir,urlString];
//    
//    return cachePath;
//}


//+(void)removeAllCaches{
//
//    AppDelegate *delegate =APPDELEGATE;
//    YYCache *cache = delegate.myYyCache;
//    [cache removeAllObjects];
//    
//}


@end
