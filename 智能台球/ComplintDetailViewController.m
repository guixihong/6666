//
//  ComplintDetailViewController.m
//  智能台球
//
//  Created by gui xihong on 16/9/18.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ComplintDetailViewController.h"

@interface ComplintDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ComplintDetailViewController
{
    
    UIView *exManagerView;
    UIButton *nextButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createLeftItem];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self createNextStep];
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

-(void)createNextStep{
    
    exManagerView = [[UIView alloc]init];
    exManagerView.frame = CGRectMake(0,SCREENHEIGHT, SCREENWIDTH, 45);
    exManagerView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    [self.view addSubview:exManagerView];
    
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(SCREENWIDTH - 100, SCREENHEIGHT+10, 100, 35);
    [nextButton setTitle:@"下一步" forState: UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [nextButton addTarget:self action:@selector(clickNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
}

-(void)clickNext{
    
    if (_myTextField.text.length == 11 || _myTextField.text.length == 8) {
        
        self.myTextField.userInteractionEnabled = NO;
        
        //走接口判断是否为签约客户
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"投诉成功" message:@"尊敬的户主,我们会在24小时内及时给您答复,同时希望您的手机保持开机状态,感谢您的配合~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[NSNotificationCenter defaultCenter] postNotificationName: @"clearData" object:nil];
            [self.navigationController popViewControllerAnimated:NO];
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"尊敬的客户,请输入正确位数的手机或座机号码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
        
    }
    
    
}

//键盘将要出现
-(void)keyboardWillShow:(NSNotification *)note{
    
    NSDictionary *info = [note userInfo];
    //    CGFloat duration = [info[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyFrame = [value CGRectValue];
    CGFloat moveY = SCREENHEIGHT-keyFrame.origin.y;
    
    CGRect frame = exManagerView.frame;
    frame.origin.y = SCREENHEIGHT-moveY-40 - 64;
    exManagerView.frame = frame;
    
    CGRect btnFrame = nextButton.frame;
    btnFrame.origin.y = SCREENHEIGHT-moveY-37 - 64;
    nextButton.frame = btnFrame;
}

//键盘将要隐藏
-(void)keyboardWillHide:(NSNotification *)note{
    
    CGRect frame = exManagerView.frame;
    frame.origin.y = SCREENHEIGHT;
    exManagerView.frame = frame;
    
    CGRect btnFrame = nextButton.frame;
    btnFrame.origin.y = SCREENHEIGHT+10;
    nextButton.frame = btnFrame;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.myTextField resignFirstResponder];
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
