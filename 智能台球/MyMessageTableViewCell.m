//
//  MyMessageTableViewCell.m
//  SideboardDesigner
//
//  Created by gui xihong on 16/8/31.
//  Copyright © 2016年 gui xihong. All rights reserved.
//

#import "MyMessageTableViewCell.h"

@implementation MyMessageTableViewCell

//-(void)setModel:(messageModel *)model
//{
//
//    _model = model;
//    _titleLabel.text = _model.title;
//    
//    NSMutableString *hh = [NSMutableString stringWithString:_model.time];
//    [hh insertString:@"  " atIndex:10];
//    
//    _timeLabel.text = hh;
//    _messageLabel.text = _model.message;
//
//    
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
