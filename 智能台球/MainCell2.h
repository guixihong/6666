//
//  MainCell2.h
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)MainModel *model;


@property (weak, nonatomic) IBOutlet UIButton *myButton;
@end
