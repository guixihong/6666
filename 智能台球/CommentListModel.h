//
//  CommentListModel.h
//  智能台球
//
//  Created by sunchao on 16/9/20.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentListModel : NSObject

@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,assign)int starNum;
@property(nonatomic,strong)NSArray *imgArr;

@end
