//
//  CommentController.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "CommentController.h"

@interface CommentController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSUserDefaults *Defaults;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSString *index;

@end

@implementation CommentController

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
//    [self setHidesBottomBarWhenPushed:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *imagesArray = @[[UIImage imageNamed:@"海贼01.jpg"],
                             [UIImage imageNamed:@"海贼02.jpg"],
                             [UIImage imageNamed:@"海贼03.jpg"],
                             [UIImage imageNamed:@"海贼04.jpg"],
                             [UIImage imageNamed:@"海贼05.jpg"]];
    
    //创建轮播器控件
    LBBannerView *bannerView = [[LBBannerView alloc] initViewWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT/2+50) autoPlayTime:100.0f imagesArray:imagesArray clickCallBack:^(NSInteger index) {
        
        NSLog(@"点击了第%ld张图片",index);
        self.index = [NSString stringWithFormat:@"%lu",index];
        NSString *ss1 = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@work1",[NSString stringWithFormat:@"%lu",index]]];
        NSString *ss2 = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@work2",[NSString stringWithFormat:@"%lu",index]]];
        NSString *ss3 = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@work3",[NSString stringWithFormat:@"%lu",index]]];
        NSString *ss4 = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@work4",[NSString stringWithFormat:@"%lu",index]]];
        NSString *ss5 = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@work5",[NSString stringWithFormat:@"%lu",index]]];
       
        
        
        
        if (ss1.length == 0 && ss2.length == 0 && ss3.length == 0 && ss4.length == 0 && ss5.length == 0) {
            
            CommentDetialViewController *comment = [[CommentDetialViewController alloc]init];
            comment.Judgment= [NSString stringWithFormat:@"%lu",index];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:comment animated:YES];
            
        }else{
        
            
            UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:@"发现有未完成的草稿,是否加载?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"加载草稿", @"新增点评", nil];
            [as showInView:self.view];
        }
       
    }];
    
    
    [self.view addSubview:bannerView];

    [self createImageView];
}

#pragma mark - 协议上的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Documents/HH"];
    NSFileManager* fm=[NSFileManager defaultManager];
    NSArray *files = [fm subpathsAtPath:imagePath];
    
    
    if (buttonIndex == 0) {
        
        CommentDetialViewController *comment = [[CommentDetialViewController alloc]init];
        comment.Judgment= [NSString stringWithFormat:@"%@",self.index];
        self.hidesBottomBarWhenPushed = YES;
        comment.JudgmentAnimation = @"无动画";
        [self.navigationController pushViewController:comment animated:YES];
    }
    
    if (buttonIndex == 1) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work1",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work2",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work3",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work4",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work5",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work6",self.index]];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:[NSString stringWithFormat:@"%@work7",self.index]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        CommentDetialViewController *comment = [[CommentDetialViewController alloc]init];
        comment.Judgment= [NSString stringWithFormat:@"%@",self.index];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:comment animated:YES];
        
       
    }
    if (buttonIndex == 2){
    }
    
    
}

-(NSUserDefaults *)Defaults
{
    
    if (_Defaults == nil) {
        _Defaults = [[NSUserDefaults alloc]init];
    }
    return _Defaults;
}


-(void)createImageView
{

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, SCREENHEIGHT/2+70, SCREENWIDTH-20, SCREENHEIGHT - SCREENHEIGHT/2+70 + 44-310)];
    imageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
//    imageView.layer.borderWidth = 2;
//    imageView.layer.borderColor = [[UIColor blackColor] CGColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREENWIDTH, 30)];
    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"您的每一次评价都是带动我们的成长";
    [imageView addSubview:label];
    
}

-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
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
