//
//  FeedbackController.m
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "FeedbackController.h"

@interface FeedbackController ()<UITextViewDelegate>

@end

@implementation FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its ni
    self.title = @"建议反馈";
    [self createRightItem];
    self.myTextView.delegate = self;
    _myTextView.returnKeyType = UIReturnKeyDone;
    [self createLeftItem];
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

-(void)createRightItem{

    UIButton *Btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [Btn setTitle:@"提交" forState: UIControlStateNormal];
    [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];

}

-(void)clickRight{
    
    if (_myTextView.text.length >0) {
        
        [_myTextView resignFirstResponder];

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交成功" message:@"感谢您的反馈~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self.navigationController popViewControllerAnimated:NO];
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提交失败" message:@"请输入反馈内容~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];

        
    }
   
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{

    _placeholderLabel.alpha = 0;
    
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
    }

    if (textView.text.length > 200) {
        if ([text isEqualToString:@""]) {
        _label200.text = [NSString stringWithFormat:@"%lu/200",(unsigned long)textView.text.length];

            return YES;
        }
        return NO;
        
    }else{
    
        _label200.text = [NSString stringWithFormat:@"%lu/200",(unsigned long)textView.text.length];
        
        return YES;

    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    [_myTextView resignFirstResponder];

}

@end
