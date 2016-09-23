//
//  ComplaintListDetailController.h
//  智能台球
//
//  Created by sunchao on 16/9/14.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComplaintListDetailController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tssjLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieanLabel;
@property (weak, nonatomic) IBOutlet UILabel *tsnrLabel;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tsnrLabelHeight;

@property(nonatomic,strong)ComplaintListModel *model;

@end
