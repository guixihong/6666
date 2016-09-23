//
//  ComplaintListCell.m
//  智能台球
//
//  Created by sunchao on 16/9/14.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ComplaintListCell.h"

@implementation ComplaintListCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _bottomLabel.backgroundColor =[UIColor whiteColor];
    self.backgroundColor = COLOR(239, 239, 239, 1);
    
}

-(void)setModel:(ComplaintListModel *)model{

    _model = model;
    
    _llabel.backgroundColor = _model.lLabelColor;
    _tsztLabel.text = _model.tszt;
    _tssjLabel.text = _model.tssj;
    _tsnrLabel.text = _model.tsnr;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
