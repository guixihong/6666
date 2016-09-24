//
//  MainModel.h
//  智能台球
//
//  Created by sunchao on 16/9/24.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "JSONModel.h"

@interface MainModel : JSONModel

@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *imageurl;
@property(nonatomic,copy)NSString<Optional>*detail;

@end
