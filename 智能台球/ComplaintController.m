//
//  ComplaintController.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ComplaintController.h"

#define KWIDTH [UIScreen mainScreen].bounds.size.width

@interface ComplaintController ()<MKMessagePhotoViewDelegate,UITextViewDelegate>
{
    
    UIView *exManagerView;
    UIButton *nextButton;
}
@property (nonatomic, strong) MKMessagePhotoView *photosView;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *imageLabel;
@property (weak, nonatomic) IBOutlet UILabel *hostderLabel;
@property (weak, nonatomic) IBOutlet UIButton *disagreeBtn;

@end

@implementation ComplaintController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView.delegate = self;
    _textView.returnKeyType = UIReturnKeyDone;

    [self changeView];
    [self setUpPhotosView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearData) name:@"clearData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickUpKey) name:@"pickUpKey" object:nil];
    [self createNextStep];
}

-(void)pickUpKey
{
    
    [self.textView resignFirstResponder];
}

-(void)createNextStep{
    
    exManagerView = [[UIView alloc]init];
    exManagerView.frame = CGRectMake(0,SCREENHEIGHT, SCREENWIDTH, 45);
    exManagerView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    [self.view addSubview:exManagerView];
    
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(SCREENWIDTH - 100, SCREENHEIGHT+10, 100, 35);
    [nextButton setTitle:@"完成" forState: UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [nextButton addTarget:self action:@selector(clickNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
}
- (IBAction)selectagreeBtns:(UIButton *)sender {
    
    
    if (self.textView.text.length == 0) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"请输入投诉内容" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        aler.tag = 888;
        [aler show];
        [self.view addSubview:aler];
    }else{
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"尊敬的户主,我们会在24小时内及时给您答复,同时希望您的手机保持开机状态,感谢您的配合~" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"忍心投诉" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            
            ComplintDetailViewController *detail = [[ComplintDetailViewController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:detail animated:NO];
            self.hidesBottomBarWhenPushed = NO;
            
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"再考虑考虑" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];

        [alert addAction:action2];
        [alert addAction:action1];

        [self presentViewController:alert animated:YES completion:^{
            
        }];

    }
    
    
}

-(void)clearData{

    _textView.text = nil;
    [_textView resignFirstResponder];
    [_photosView removeFromSuperview];
    _photosView = nil;
    [self setUpPhotosView];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 888) {
        
      
        
    }else{
    
    
    }
    
}


-(void)clickNext{
    
    [self.textView resignFirstResponder];
    
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


-(void)setUpPhotosView
{
    if (!self.photosView)
    {
        self.photosView = [[MKMessagePhotoView alloc]initWithFrame:CGRectMake(0,-7,KWIDTH, 80)];
        [self.imageLabel addSubview:self.photosView];
        
        self.photosView.delegate = self;
    }
    
}
//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)addUIImagePicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    
}


-(void)changeView
{

    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.imageLabel.layer.borderWidth = 1;
    self.imageLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.disagreeBtn.layer.borderWidth = 1;
    self.disagreeBtn.layer.borderColor = [[UIColor blackColor] CGColor];
}


#pragma mark - 实现textView代理

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    [self.hostderLabel removeFromSuperview];
    return YES;
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
