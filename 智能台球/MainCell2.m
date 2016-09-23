//
//  MainCell2.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "MainCell2.h"

@implementation MainCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = COLOR(239, 239, 239, 1);

    _array = [NSMutableArray array];
    UIButton *Btn = [self viewWithTag:4];
    [_array addObject:Btn];
}

-(void)setModel:(MainModel *)model{
    
    _model = model;
    _timeLabel.text = model.time;
    _headLabel.text = model.headText;
    _detailLabel.text = model.detail;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
