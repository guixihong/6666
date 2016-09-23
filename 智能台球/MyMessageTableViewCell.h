//
//  MyMessageTableViewCell.h
//  SideboardDesigner
//
//  Created by gui xihong on 16/8/31.
//  Copyright © 2016年 gui xihong. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "messageModel.h"

@interface MyMessageTableViewCell : UITableViewCell

//@property (nonatomic,strong)messageModel *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;//消息内容
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;//消息状态

@end
