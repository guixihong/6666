//
//  CommentListCell.m
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "CommentListCell.h"

@implementation CommentListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(CommentListModel *)model{

    _model = model;
    
    LPLevelView *lView = [LPLevelView new];
    lView.frame = CGRectMake(0, 0, _starLabel.frame.size.width, _starLabel.frame.size.height);
    lView.iconColor = [UIColor orangeColor];
    lView.iconSize = CGSizeMake( _starLabel.frame.size.height,  _starLabel.frame.size.height);
    lView.canScore = YES;
    lView.animated = YES;
    lView.level = _model.starNum;
    [_starLabel addSubview:lView];
    
    _timeLabel.text = _model.time;
    _detailLabel.text = _model.detail;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
