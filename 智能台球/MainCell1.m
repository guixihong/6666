//
//  MainCell1.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "MainCell1.h"

@implementation MainCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = COLOR(239, 239, 239, 1);
    
    
    if (_array == nil) {
        
        _array = [NSMutableArray array];
        
    }
    [_array addObjectsFromArray:@[_Btn1,_Btn2,_Btn3]];
    
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
