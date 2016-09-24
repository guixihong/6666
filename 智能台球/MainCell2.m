//
//  MainCell2.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "MainCell2.h"

@implementation MainCell2
{

    UIButton *Btn;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = COLOR(239, 239, 239, 1);
    if(_array == nil){
    
        _array = [NSMutableArray array];

    }
    Btn = [self viewWithTag:4];
    [_array addObject:Btn];
}

-(void)setModel:(MainModel *)model{
    
    _model = model;
    _timeLabel.text = model.time;
    _headLabel.text = model.content;
//    _detailLabel.text = model.detail;
    NSLog(@"========%@===%@==%ld",model.imageurl,[NSString stringWithFormat:@"%@%@",@"111.200.41.23:8090",model.imageurl],(long)_myButton.tag);
    //http://111.200.41.23:8090
    UIButton *Btnn = _array[0];
    [Btnn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",BASEURL,model.imageurl]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
