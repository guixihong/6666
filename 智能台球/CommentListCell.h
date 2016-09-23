//
//  CommentListCell.h
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;

@property(nonatomic,strong)CommentListModel *model;


@end
