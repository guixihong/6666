//
//  MessageDitailViewController.m
//  SideboardDesigner
//
//  Created by gui xihong on 16/8/29.
//  Copyright © 2016年 gui xihong. All rights reserved.
//

#import "MessageDitailViewController.h"

@interface MessageDitailViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textHight;
@property (weak, nonatomic) IBOutlet UITextView *myText;


@end

@implementation MessageDitailViewController

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    self.myText.editable = NO;
    self.myText.text = @"两款手机发来的刷卡缴费卡到了辅导付款的顺丰快递是妇女节,你打算今年的少女看到手机覅两点上课就发了多少积分卡多少分开始觉得烦了实际付款了多少积分开了多少积分即可获得手机卡复活点开始覅额偶飞狐额佛IE万积分换客服";
    self.myText.backgroundColor = [UIColor whiteColor];
    CGSize  size= [self sizeWithString:@"两款手机发来的刷卡缴费卡到了辅导付款的顺丰快递是妇女节,你打算今年的少女看到手机覅两点上课就发了多少积分卡多少分开始觉得烦了实际付款了多少积分开了多少积分即可获得手机卡复活点开始覅额偶飞狐额佛IE万积分换客服" font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(self.myText.frame.size.width, MAXFLOAT)];
    self.textHight.constant = size.height;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息详情";
    [self createLeftItem];
    self.view.backgroundColor = [UIColor colorWithRed:239/256.0 green:239/256.0 blue:239/256.0 alpha:1];
   
    
    
//    [self customNavigation];
//       self.title = @"预交底通知";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSBackgroundColorAttributeName:[UIColor cyanColor]}];
//
//    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn1 setImage:[UIImage imageNamed:@"ic_actbar_back_black@3x.png"] forState:UIControlStateNormal];
//    [btn1 addTarget:self action:@selector(onlick) forControlEvents:UIControlEventTouchUpInside];
//    [btn1 setTitle:@"退出" forState: UIControlStateNormal];
//    btn1.frame = CGRectMake(0, 0, 21, 21);
//    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];

}


//-(void)customNavigation
//
//{
//    
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:114/256.0 green:112/256.0 blue:113/256.0 alpha:1];
//    self.navigationItem.leftBarButtonItem = [UIbarItem itemWithTarget:self action:@selector(leftBarButton) image:@"arrow_merchant_detail_map_normal@2x.png" hightimage:nil];
//    self.title = @"预交底通知";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSBackgroundColorAttributeName:[UIColor cyanColor]}];
//    
//}
//

-(void)createLeftItem{
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(0, 0, 12, 20);
    [Btn setBackgroundImage:[[UIImage imageNamed:@"back.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickLeft{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    self.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:ditail animated:YES];
 
}


- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    

    
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}


//CGSize lSize = [self sizeWithString:str font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(200, MAXFLOAT)];

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
