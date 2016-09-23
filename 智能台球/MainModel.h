//
//  MainModel.h
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *headText;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,strong)NSArray *imgArr;
@end
