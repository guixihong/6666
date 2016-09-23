//
//  LoginController.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation LoginController
{
    UIView *exManagerView;
    UIButton *nextButton;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self createNextStep];
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
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"尊敬的户主,您已验证成功我将为您的爱家装修全过程服务." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"点击进入" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UITabBarController *tbvc = (UITabBarController *)[self createUI];
            [self presentViewController:tbvc animated:NO completion:^{
                
            }];
            
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

-(UIViewController *)createUI{
    
    CustomTabBarViewController *tbvc = [[CustomTabBarViewController alloc]init];
    tbvc.tabBar.tintColor = [UIColor blackColor];
    tbvc.tabBar.translucent = NO;
    [tbvc addViewControllerWithString:@"MainViewController" title:@"主页" andImage:@"tabbar_item_home"  andSlectedImage:@"tabbar_item_home_sel"];
    [tbvc addViewControllerWithString:@"CommentController" title:@"点评" andImage:@"tabbar_item_des"  andSlectedImage:@"tabbar_item_des_sel"];
    [tbvc addViewControllerWithString:@"ComplaintController" title:@"投诉" andImage:@"tabbar_item_my"  andSlectedImage:@"tabbar_item_my_sel"];
    //    [tbvc addViewControllerWithString:@"OrderController" title:@"流程" andImage:@"tabbar_item_discover"  andSlectedImage:@"tabbar_item_discover_sel"];
    return tbvc;
}


//键盘将要出现
-(void)keyboardWillShow:(NSNotification *)note{
    
    NSDictionary *info = [note userInfo];
//    CGFloat duration = [info[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyFrame = [value CGRectValue];
    CGFloat moveY = SCREENHEIGHT-keyFrame.origin.y;
    
    CGRect frame = exManagerView.frame;
    frame.origin.y = SCREENHEIGHT-moveY-40;
    exManagerView.frame = frame;
    
    CGRect btnFrame = nextButton.frame;
    btnFrame.origin.y = SCREENHEIGHT-moveY-37;
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
}

@end
