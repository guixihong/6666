//
//  KHListModel.h
//  智能台球
//
//  Created by sunchao on 16/9/24.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "JSONModel.h"

@interface KHListModel : JSONModel


@property(nonatomic,copy)NSString *work_address;
@property(nonatomic,copy)NSString *client_name;
@property(nonatomic,copy)NSString *client_phone;
@property(nonatomic,copy)NSString *designer_name;
@property(nonatomic,copy)NSString *designer_phone;
@property(nonatomic,copy)NSString *inspector_name;
@property(nonatomic,copy)NSString *inspector_phone;
@property(nonatomic,copy)NSString *worker_name;
@property(nonatomic,copy)NSString *worker_phone;
@property(nonatomic,copy)NSString *monitor_name;
@property(nonatomic,copy)NSString *monitor_phone;
@property(nonatomic,copy)NSString *start_time;
@property(nonatomic,copy)NSString *end_time;

@end
