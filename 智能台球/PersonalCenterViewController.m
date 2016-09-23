//
//  PersonalCenterViewController.m
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "PersonalCenterViewController.h"

@interface PersonalCenterViewController ()

@property (nonatomic,strong)NSUserDefaults *defaults;

@end

@implementation PersonalCenterViewController
{

    NSArray *mArr;
    HuView *hView;
}

-(NSUserDefaults *)defaults
{
    
    if (_defaults == nil) {
        _defaults = [[NSUserDefaults alloc]init];
    }
    return _defaults;
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    self.title = @"";
    self.tabBarItem.title = @"我的";
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.title = @"个人中心";
    self.tabBarItem.title = @"我的";

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //给 item 添加 点击事件
    mArr = @[_Btn1,_Btn2,_Btn3,_Btn4,_Btn5];
    for (int i = 0; i<5; i++) {
        
        UIButton *Btn = mArr[i];
        [Btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
   
    //设置用户头像
    _headImage.adjustsImageWhenHighlighted = NO;
    [_headImage addTarget:self action:@selector(uploadHead) forControlEvents:UIControlEventTouchUpInside];
    if ([[self.defaults objectForKey:@"imageViewUrl"] length] == 0) {
        [_headImage setBackgroundImage:[UIImage imageNamed:@"用户头像.png"] forState:UIControlStateNormal];
    }else{
        
        [_headImage setBackgroundImage:[UIImage imageWithData:[self.defaults objectForKey:@"imageViewUrl"]] forState:UIControlStateNormal];
    }

    
    
//设置缓存 label 显示的 text
    AppDelegate *delegate = APPDELEGATE;
    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",delegate.cache];
    
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideClearup) name:@"hideClearup" object:nil];
    
   }

//-(void)hideClearup{
//
//    [hView removeFromSuperview];
//    _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",0.00];
//    AppDelegate *delegate = APPDELEGATE;
//    delegate.cache = 0.00;
//
//}

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

-(void)uploadHead{

    [self getPicture];
}

-(void)clickItem:(UIButton *)btn{

    switch (btn.tag) {
        case 0:
        {
            ViersionController *vvc = [[ViersionController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vvc animated:YES];
            self.hidesBottomBarWhenPushed = NO;

        }
            break;
        case 1:
        {
            AppDelegate *delegate = APPDELEGATE;
            if (delegate.cache == 0.00) {
                return;
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"缓存大小为%.2fMB, 确定要清除缓存吗?",delegate.cache] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
//                hView = [[HuView alloc]initWithFrame:CGRectMake(0, 0,SCREENWIDTH,SCREENHEIGHT)];
//                hView.num = 0;
//                hView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
//                [self.view.window addSubview:hView];
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:0.00] forKey:@"CACHESUM"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                sleep(0.5);
                _cacheLabel.text = [NSString stringWithFormat:@"%.2fMB",0.00];
                AppDelegate *delegate = APPDELEGATE;
                delegate.cache = 0.00;
                
            }];
            
            [alert addAction:action1];
            [alert addAction:action2];
            
            [self presentViewController:alert animated:YES completion:^{
                
            }];

        
        }
            break;
        case 2:
        {
            ComplaintListController *cvc = [[ComplaintListController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cvc animated:YES];
            self.hidesBottomBarWhenPushed = NO;

        }
            break;
        case 3:
        {
            FeedbackController *vvc = [[FeedbackController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vvc animated:YES];
            self.hidesBottomBarWhenPushed = NO;


        }
            break;
        case 4:
        {
            
            AboutUSController *vvc = [[AboutUSController alloc]init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vvc animated:YES];
            self.hidesBottomBarWhenPushed = NO;

        }
            break;
        default:
            break;
    }
}

-(void)getPicture{
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0 ?YES:NO) {
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"获取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIImagePickerController *imagepickercontroller = [[UIImagePickerController alloc]init];
                imagepickercontroller.delegate = self;
                imagepickercontroller.allowsEditing = YES;
                imagepickercontroller.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagepickercontroller animated:YES completion:^{}];
            }];
            
            [alertcontroller addAction:defaultAction];
            
        }
        
        UIAlertAction *defaultAction1 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
            
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:^{}];
        }];
        
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
        
        
        [alertcontroller addAction:cancelAction];
        [alertcontroller addAction:defaultAction1];
        [self presentViewController:alertcontroller animated:YES completion:nil];
        
    }else{
        
        UIActionSheet *sheet;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            sheet = [[UIActionSheet alloc]initWithTitle:@"获取图片" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
        }else{
            
            sheet = [[UIActionSheet alloc]initWithTitle:@"获取图片" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
        }
        [sheet showInView:self.view];
    }
    
    
}


#pragma mark - 调用UIActionSheet iOS7使用

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSUInteger sourceType = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 1:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 2:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
            default:
                break;
        }
    }else{
        
        if (buttonIndex == 1) {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    
    
    UIImagePickerController *imagePickercontroller = [[UIImagePickerController alloc]init];
    imagePickercontroller.delegate = self;
    imagePickercontroller.allowsEditing = YES;
    imagePickercontroller.sourceType = sourceType;
    [self presentViewController:imagePickercontroller animated:YES completion:nil];
}


#pragma mark - 保存图片到沙盒

-(void)saveImage:(UIImage *)currenImage WithName:(NSString *)imageName{
    
    NSData *imageData = UIImageJPEGRepresentation(currenImage, 1.0);
    NSString *fullpath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    
    [imageData writeToFile:fullpath atomically:YES];
}


#pragma mark - ios7 8都要调用这个方法,选择完成后调用方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *iconData = UIImageJPEGRepresentation(image,0.5);
    [self.defaults setObject:iconData forKey:@"imageViewUrl"];
    
    
    [self saveImage:image WithName:@"avatar.JPEG"];
    
//    NSString *fullpath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"avatar.JPEG"];
    
//    UIImage *savadImage = [[UIImage alloc]initWithContentsOfFile:fullpath];
    [_headImage setBackgroundImage:[UIImage imageWithData:[self.defaults objectForKey:@"imageViewUrl"]] forState:UIControlStateNormal];
}

#pragma mark - ios7 8 都调用这个方法,按取消按钮使用的方法

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
