//
//  ViersionController.m
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ViersionController.h"

@interface ViersionController ()

@end

@implementation ViersionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"版本信息";

    [self createLeftItem];
}

-(void)createLeftItem{
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(0, 0, 12, 20);
    [Btn setBackgroundImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    ;
}

-(void)clickLeft{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
