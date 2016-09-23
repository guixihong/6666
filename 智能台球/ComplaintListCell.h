//
//  ComplaintListCell.h
//  智能台球
//
//  Created by sunchao on 16/9/14.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComplaintListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *llabel;
@property (weak, nonatomic) IBOutlet UILabel *tsztLabel;
@property (weak, nonatomic) IBOutlet UILabel *tssjLabel;
@property (weak, nonatomic) IBOutlet UILabel *tsnrLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property(nonatomic,strong)ComplaintListModel *model;

@end
