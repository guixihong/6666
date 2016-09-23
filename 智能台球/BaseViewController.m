//
//  BaseViewController.m
//  智能台球
//
//  Created by 孙超 on 16/7/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
//    [self createRight];
}

//-(void)createRight{
//    UIButton *Btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    [Btn setBackgroundImage:[UIImage imageNamed:@"personal-center"] forState:UIControlStateNormal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
//    [Btn addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
//
//    
//}

//-(void)clickRight{
//    
//    PersonalCenterViewController *pvc = [[PersonalCenterViewController alloc]init];
//    self.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:pvc animated:YES];
//    self.hidesBottomBarWhenPushed=NO;
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
