//
//  ComplaintListDetailController.m
//  智能台球
//
//  Created by sunchao on 16/9/14.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ComplaintListDetailController.h"

@interface ComplaintListDetailController ()

@end

@implementation ComplaintListDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"详细信息";
    [self createLeftItem];
    
    _tsnrLabel.text = _model.tsnr;
    _tssjLabel.text = _model.tssj;
    _jieanLabel.text =_model.tszt;
    if ([_model.tszt isEqualToString:@"已结案"]) {
        
        _jieanLabel.textColor = [UIColor greenColor];
        
    }else{
    
        _jieanLabel.textColor = [UIColor redColor];

    }
    [self setBottomHeight];
}
-(void)createLeftItem{
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(0, 0, 12, 20);
    [Btn setBackgroundImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)clickLeft{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setBottomHeight{

    
    CGRect rect = [_model.tsnr boundingRectWithSize:CGSizeMake(SCREENWIDTH-100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil];
        
    if (rect.size.height > 29) {
        
        if(214 + rect.size.height - 29 > SCREENHEIGHT - 144){
            
             _tsnrLabelHeight.constant = SCREENHEIGHT - 144 -185;
             _bottomHeight.constant =  SCREENHEIGHT - 144;
            
        }else{
        
            _tsnrLabelHeight.constant = rect.size.height;
            _bottomHeight.constant = 214 + rect.size.height - 29;

        }
  
    }
    
}

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
