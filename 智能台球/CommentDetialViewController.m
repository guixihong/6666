//
//  CommentDetialViewController.m
//  智能台球
//
//  Created by gui xihong on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "CommentDetialViewController.h"
#import "MBProgressHUD.h"
#import "RatingBar.h"
@interface CommentDetialViewController ()<MKMessagePhotoViewDelegate,UITextViewDelegate,RatingDelegate>
@property (weak, nonatomic) IBOutlet UILabel *youLabel;
@property (nonatomic, strong) MKMessagePhotoView *photosView;
@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)UIView *myView;
@property (nonatomic,strong)UILabel *HHView;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,strong)NSMutableArray *array1;
@property (nonatomic,strong)NSMutableArray *arrayBtns;
@property (nonatomic,strong)UILabel *mylabel;
@property (nonatomic,strong)UILabel *newlabel;

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)NSString *total;
@property (nonatomic,strong)NSUserDefaults *Defaults;

@property (nonatomic,strong)NSString *work1;
@property (nonatomic,assign)int index;
@property (nonatomic,strong)NSString *work2;
@property (nonatomic,strong)NSString *work3;
@property (nonatomic,strong)NSString *work4;
@property (nonatomic,strong)NSString *work5;
@property (nonatomic,strong)NSString *work6;
@property (nonatomic,strong)NSMutableArray *imageDataSource;
@property (nonatomic, assign) id  delegate;
@property (nonatomic,strong)NSArray *myArray;
@property (nonatomic,strong)NSArray *titles;

@property (nonatomic,strong)MBProgressHUD *hub;
    

@end

@implementation CommentDetialViewController
@synthesize delegate;
-(void)viewWillAppear:(BOOL)animated
{

    
      self.work1 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work1",self.Judgment]];
    
    [super viewWillAppear:animated];
    [self comstomNavition];
    
    self.view.backgroundColor = [UIColor colorWithRed:239/256.0 green:239/256.0 blue:239/256.0 alpha:1];
    
   
    
    if ([self.Judgment isEqualToString:@"4"]) {//套餐没有其他评分,只有总体评分
        
        
        if ([self.JudgmentAnimation isEqualToString:@"无动画"]) {
            [self setUpPhotosView];
            if ([self.work1 isEqualToString:@"1"]) {
                self.youLabel.text = @"1星";
            }
            if ([self.work1 isEqualToString:@"2"]) {
                self.youLabel.text = @"2星";
            }
            if ([self.work1 isEqualToString:@"3"]) {
                self.youLabel.text = @"3星";
            }
            if ([self.work1 isEqualToString:@"4"]) {
                self.youLabel.text = @"4星";
            }
            if ([self.work1 isEqualToString:@"5"]) {
                self.youLabel.text = @"5星";
            }
            
            
            [self.label removeFromSuperview];

            
            
            if (self.work5.length == 0) {
                UILabel *label = [[UILabel alloc]init];
                label.text = [NSString stringWithFormat:@"评价下负责您家的%@水平和服务态度等,帮助我们的成长!",self.title];
                label.font = [UIFont systemFontOfSize:12];
                label.frame =CGRectMake(8, 3, SCREENWIDTH - 40, 21);
                label.textColor = [UIColor grayColor];
                self.label = label;
                [self.textView addSubview:label];
            }
            
            
         
            
            for (NSInteger i = 1; i < [self.work1 integerValue] + 1; i++) {
                UIButton *btn = [self.view viewWithTag:i];
                btn.selected = YES;
            }
        }else{
            
            [self setUpPhotosView];
        }
        
        
        
    }else{///
    
    if ([self.JudgmentAnimation isEqualToString:@"无动画"]) {
        [self setUpPhotosView];
        if ([self.work1 isEqualToString:@"1"]) {
            self.youLabel.text = @"1星";
        }
        if ([self.work1 isEqualToString:@"2"]) {
            self.youLabel.text = @"2星";
        }
        if ([self.work1 isEqualToString:@"3"]) {
            self.youLabel.text = @"3星";
        }
        if ([self.work1 isEqualToString:@"4"]) {
            self.youLabel.text = @"4星";
        }
        if ([self.work1 isEqualToString:@"5"]) {
            self.youLabel.text = @"5星";
        }

        
        [self.label removeFromSuperview];
        NSInteger m = 100;
        for (NSInteger i = 0; i < 3; i ++) {
            //评星
            UIView *view = [self.view viewWithTag:m];
            view.alpha = 1.0;
            view.frame = CGRectMake(35, 40*i - 12+ 5+2, 200, 30);
            
            UIView *MYview = [self.view viewWithTag:m+100];
            MYview.frame = CGRectMake(SCREENWIDTH - 180, 40*i - 12+5, 150, 35);
            m++;
        }
        
        
        if (self.work5.length == 0) {
            UILabel *label = [[UILabel alloc]init];
            label.text = [NSString stringWithFormat:@"评价下负责您家的%@水平和服务态度等,帮助我们的成长!",self.title];
            label.font = [UIFont systemFontOfSize:12];
            label.frame =CGRectMake(8, 3, SCREENWIDTH - 40, 21);
            label.textColor = [UIColor grayColor];
            self.label = label;
            [self.textView addSubview:label];
        }
        

        
        NSInteger i = 0;
        for (UILabel *label in self.array) {
            label.frame = CGRectMake(15, i*40, 70, 20);
            
            i++;
        }
        
        NSInteger h = 999;
        for (NSInteger k = 0; k < 3; k++) {
            
            UIView *view = [self.view viewWithTag:h+k];
            view.frame = CGRectMake(0, k*40 - 5, SCREENWIDTH - 20 , 30);
        }
        
        
        self.mylabel.frame = CGRectMake(10, SCREENHEIGHT/2 - 30+20+25+10, SCREENWIDTH - 20, 90);
        self.newlabel.frame = CGRectMake(10, SCREENHEIGHT/2 - 30+20+25+10, SCREENWIDTH - 20, 90);
        self.myView.frame = CGRectMake(10, 45+15, SCREENWIDTH - 20, 100);
        self.textView.frame = CGRectMake(10, 150+15+15, SCREENWIDTH - 20, SCREENHEIGHT/5);

        
        for (NSInteger i = 1; i < [self.work1 integerValue] + 1; i++) {
            UIButton *btn = [self.view viewWithTag:i];
            btn.selected = YES;
        }
    }else{
    
        [self setUpPhotosView];
    }

   
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deleteDate) name:@"deleteDate" object:nil];
    
    self.work1 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work1",self.Judgment]];
    self.work2 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work2",self.Judgment]];
    self.work3 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work3",self.Judgment]];
    self.work4 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work4",self.Judgment]];
    self.work5 = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work5",self.Judgment]];
    
    
 
    [self createlabel];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pickUpKey) name:@"pickUpKey" object:nil];
    
    self.total = @" ";
    [self createTextView];
    for (NSInteger i=1; i < 6; i++) {
        UIButton *btn = [self.view viewWithTag:i];
        [self.arrayBtns addObject:btn];
        [btn setImage:[UIImage imageNamed:@"crying1.net.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"smiling_.png"] forState:UIControlStateSelected];
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        btn.selected = NO;
    }
    
    
    
    
    self.myView = [[UIView alloc]initWithFrame:CGRectMake(10, 15, SCREENWIDTH - 20, 0)];

    
     self.titles = @[@"专业能力:",@"服务态度:",@"工作效率:"];
    if ([self.Judgment isEqualToString:@"0"]) {
       
        self.title = @"设计管家";
    }else if ([self.Judgment isEqualToString:@"1"]){
        self.title = @"品控师";
    }else if ([self.Judgment isEqualToString:@"2"]){
        self.title = @"工长";
    }else if ([self.Judgment isEqualToString:@"3"]){
        self.title = @"班长";
         self.titles = @[@"施工质量:",@"服务态度:",@"工作效率:"];
    }else if ([self.Judgment isEqualToString:@"4"]){
        self.title = @"套餐";
        self.titles = @[@"施工质量:",@"服务态度:",@"工作效率:"];
    }
    self.label.text = [NSString stringWithFormat:@"评价下负责您家的%@水平和服务态度等,帮助我们的成长!",self.title];

   
    NSInteger h = 999;
    NSInteger j = 0;
    for (NSString *mmm in self.titles) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 0)];
        view.backgroundColor = [UIColor whiteColor];
        view.tag = h + j;
        [self.myView addSubview:view];
        j++;
    }
    
    
    

    
    
    
    NSInteger m = 100;
    for (NSInteger i = 0; i < 3; i ++) {
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREENWIDTH - 180, 20, 150, 0)];
        label.tag = 100 + m;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentRight;
        label.userInteractionEnabled = YES;
        [self.myView addSubview:label];
        
        if (i == 0) {
            if ([self.work2 isEqualToString:@""]) {
                label.text = @"";
            }
            if ([self.work2 isEqualToString:@"1"]) {
                label.text = @"差";
            }
            if ([self.work2 isEqualToString:@"2"]) {
                label.text = @"一般";
            }
            if ([self.work2 isEqualToString:@"3"]) {
                label.text = @"好";
            }
            if ([self.work2 isEqualToString:@"4"]) {
                label.text = @"很好";
            }
            if ([self.work2 isEqualToString:@"5"]) {
                label.text = @"非常好";
            }
        }
        
        else if (i == 1) {
            if ([self.work3 isEqualToString:@""]) {
                label.text = @"";
            }
            if ([self.work3 isEqualToString:@"1"]) {
                label.text = @"差";
            }
            if ([self.work3 isEqualToString:@"2"]) {
                label.text = @"一般";
            }
            if ([self.work3 isEqualToString:@"3"]) {
                label.text = @"好";
            }
            if ([self.work3 isEqualToString:@"4"]) {
                label.text = @"很好";
            }
            if ([self.work3 isEqualToString:@"5"]) {
                label.text = @"非常好";
            }
        }

        else if (i == 2) {
            if ([self.work4 isEqualToString:@""]) {
                label.text = @"";
            }
            if ([self.work4 isEqualToString:@"1"]) {
                label.text = @"差";
            }
            if ([self.work4 isEqualToString:@"2"]) {
                label.text = @"一般";
            }
            if ([self.work4 isEqualToString:@"3"]) {
                label.text = @"好";
            }
            if ([self.work4 isEqualToString:@"4"]) {
                label.text = @"很好";
            }
            if ([self.work4 isEqualToString:@"5"]) {
                label.text = @"非常好";
            }
        }

        
        
        
        RatingBar *bar = [[RatingBar alloc] initWithFrame:CGRectMake(35, 20, 200, 30)];
        bar.alpha = 0.0;
        bar.tag = m;
        bar.delegate = self;
        [self.myView addSubview:bar];
        
        if (i==0) {
            
            NSString *ss = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work2",self.Judgment]];
            
            
            NSLog(@"___________ss_______%@",ss);
            
            bar.topView.frame = CGRectMake(0, 0, bar.frame.size.width/6.0*([ss integerValue]+1), bar.bounds.size.height);
            
            
        }
        if (i==1) {
            NSString *ss = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work3",self.Judgment]];
            bar.topView.frame = CGRectMake(0, 0, bar.frame.size.width/6.0*([ss integerValue]+1), bar.bounds.size.height);
        }
        
        if (i==2) {
            NSString *ss = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work4",self.Judgment]];
            bar.topView.frame = CGRectMake(0, 0, bar.frame.size.width/6.0*([ss integerValue]+1), bar.bounds.size.height);
        }
        
        
        m++;
    }
    
    
    NSInteger i = 0;
    
    for (NSString *title in self.titles) {
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 70, 0)];
        label.text = title;
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont boldSystemFontOfSize:12];
        [self.myView addSubview:label];
        [self.array addObject:label];
        i++;
        
    }

    
    [self.view addSubview:self.myView];
    
    
}


-(void)deleteDate
{

    
    self.textView.text = @"";

    
}


-(void)setRating:(NSInteger)rating isHuman:(BOOL)isHuman With:(UIView *)view
{
    
    NSLog(@"-------------%lu",rating);

    RatingBar *bar1 = [self.view viewWithTag:100];
    RatingBar *bar2 = [self.view viewWithTag:101];
    RatingBar *bar3 = [self.view viewWithTag:102];
    
    NSInteger m = 100;
    
    
    
    if (view == bar1) {
        
        self.work2 = [NSString stringWithFormat:@"%ld",rating];
        UILabel *label = [self.view viewWithTag:100+100];
        if (rating == 0) {
            label.text = @"";
        }
        if (rating == 1) {
            label.text = @"差";
        }
        if (rating == 2) {
            label.text = @"一般";
        }
        if (rating == 3) {
            label.text = @"好";
        }
        if (rating == 4) {
            label.text = @"很好";
        }
        if (rating == 5) {
            label.text = @"非常好";
        }
        
      
    }
    if (view == bar2) {
       
         self.work3 = [NSString stringWithFormat:@"%ld",rating];
        UILabel *label = [self.view viewWithTag:100+101];
        if (rating == 0) {
            label.text = @"";
        }
        if (rating == 1) {
            label.text = @"差";
        }
        if (rating == 2) {
            label.text = @"一般";
        }
        if (rating == 3) {
            label.text = @"好";
        }
        if (rating == 4) {
            label.text = @"很好";
        }
        if (rating == 5) {
            label.text = @"非常好";
        }

    }
    if (view == bar3) {
        
       self.work4 = [NSString stringWithFormat:@"%ld",rating];
        UILabel *label = [self.view viewWithTag:100+102];
        if (rating == 0) {
            label.text = @"";
        }
        if (rating == 1) {
            label.text = @"差";
        }
        if (rating == 2) {
            label.text = @"一般";
        }
        if (rating == 3) {
            label.text = @"好";
        }
        if (rating == 4) {
            label.text = @"很好";
        }
        if (rating == 5) {
            label.text = @"非常好";
        }

    }
    
    

    
    

}



-(NSMutableArray *)array1
{

    if (_array1 == nil) {
        _array1 = [NSMutableArray array];
    }
    return _array1;
}

-(NSArray *)myArray
{

    if (_myArray == nil) {
        _myArray = [NSArray array];
    }
    return _myArray;
}

-(NSMutableArray *)imageDataSource
{

    if (_imageDataSource == nil) {
        _imageDataSource = [[NSMutableArray alloc]init];
    }
    return _imageDataSource;
}



-(void)pickUpKey
{

    [self.textView resignFirstResponder];
}



-(NSUserDefaults *)Defaults
{

    if (_Defaults == nil) {
        _Defaults = [[NSUserDefaults alloc]init];
    }
    return _Defaults;
}





-(void)createlabel
{

    self.mylabel = [[UILabel alloc]initWithFrame:CGRectMake(10, SCREENHEIGHT/3, SCREENWIDTH - 20, 90)];

    self.mylabel.userInteractionEnabled = YES;


    UILabel * newlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, SCREENHEIGHT/3, SCREENWIDTH - 20, 90)];
    newlabel.backgroundColor = [UIColor whiteColor];
    newlabel.userInteractionEnabled = YES;
//    newlabel.layer.borderWidth = 2;
    self.newlabel = newlabel;
    [self.view addSubview:self.newlabel];
    [self.view addSubview:self.mylabel];
    
}


-(NSMutableArray *)arrayBtns
{

    if (_arrayBtns == nil) {
        _arrayBtns = [NSMutableArray array];
    }
    return _arrayBtns;
}


-(NSMutableArray *)array
{

    if (_array == nil) {
        _array =[NSMutableArray  array];
    }
    return _array;
}

- (IBAction)seletStarBtns:(UIButton *)sender {
    
    
    
    self.work1 = [NSString stringWithFormat:@"%lu",sender.tag];
    
    self.total = [NSString stringWithFormat:@"%lu",sender.tag];
    NSLog(@"------%lu",sender.tag);
    
    
   
    if (sender.tag == 1) {
        self.youLabel.text = @"1星";
    }
    if (sender.tag == 2) {
        self.youLabel.text = @"2星";
    }
    if (sender.tag == 3) {
         self.youLabel.text = @"3星";
    }
    if (sender.tag == 4) {
         self.youLabel.text = @"4星";
    }
    if (sender.tag == 5) {
         self.youLabel.text = @"5星";
    }

    
    
    
    for (UIButton *bbb in self.arrayBtns) {
        bbb.selected = NO;
    }
    
    if (sender.tag == 1) {
        
        sender.selected = YES;
    }else{
        
        for (NSInteger i = 1; i < sender.tag; i ++) {
            UIButton *bbb =  self.arrayBtns[i];
            bbb.selected = YES;
            
        }
        
        UIButton *mm = [self.view viewWithTag:1];
        mm.selected = YES;
    }
    
    

    

    if (self.index  > 0) {
        return;
    }else{
    
        if ([self.Judgment isEqualToString:@"4"]) {
            return;
        }else{
        
            self.index ++;
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                
                
                
                
                if (self.JudgmentAnimation.length == 0) {
                    NSInteger m = 100;
                    for (NSInteger i = 0; i < 3; i ++) {
                        //评星
                        UIView *view = [self.view viewWithTag:m];
                        view.alpha = 1.0;
                        view.frame = CGRectMake(35, 40*i - 12+ 5+2, 200, 30);
                        
                        UIView *MYview = [self.view viewWithTag:m+100];
                        MYview.frame = CGRectMake(SCREENWIDTH - 180, 40*i - 12+5, 150, 35);
                        m++;
                    }
                    
                    NSInteger i = 0;
                    for (UILabel *label in self.array) {
                        label.frame = CGRectMake(15, i*40, 70, 20);
                        
                        i++;
                    }
                    
                    NSInteger h = 999;
                    for (NSInteger k = 0; k < 3; k++) {
                        
                        UIView *view = [self.view viewWithTag:h+k];
                        view.frame = CGRectMake(0, k*40 - 5, SCREENWIDTH - 20 , 30);
                    }
                    
                    
                    self.mylabel.frame = CGRectMake(10, SCREENHEIGHT/2 - 30+20+25+10, SCREENWIDTH -20, 90);
                    self.newlabel.frame = CGRectMake(10, SCREENHEIGHT/2 - 30+20+25+10, SCREENWIDTH -20, 90);
                    self.myView.frame = CGRectMake(10, 45+15, SCREENWIDTH - 20, 100);
                    self.textView.frame = CGRectMake(10, 150+15+15, SCREENWIDTH - 20, SCREENHEIGHT/5);
                }
                
                
                
            }];
            

        }
        

    }
  
}

-(void)createTextView
{

    
    UILabel *label = [[UILabel alloc]init];
    self.label = label;
    label.text = [NSString stringWithFormat:@"评价下负责您家的%@水平和服务态度等,帮助我们的成长!",self.title];
    self.HHView = label;
    label.font = [UIFont systemFontOfSize:12];
    label.frame =CGRectMake(8, 3, SCREENWIDTH - 40, 21);
    label.textColor = [UIColor grayColor];
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 60, SCREENWIDTH - 20, SCREENHEIGHT/5)];
//    self.textView.layer.borderWidth = 2;
//    self.textView.layer.borderColor = [[UIColor blackColor]CGColor];
    self.textView.delegate = self;
    self.textView.textColor = [UIColor blackColor];
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.text = [self.Defaults objectForKey:[NSString stringWithFormat:@"%@work5",self.Judgment]];
    [self.view addSubview:self.textView];
    [self.textView addSubview:label];
    _textView.returnKeyType = UIReturnKeyDone;
}


-(void)comstomNavition
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 30, 150);
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"发表" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(0, 0, 30, 150);
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn1 addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
}

-(void)Back
{
 

    
    [self.textView resignFirstResponder];
    
    


    if (self.work1.length == 0 && self.work2.length == 0 && self.work3.length == 0 && self.work4.length == 0 && self.work5.length == 0 && self.work6.length == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
    
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        
        
        NSMutableArray *array = [NSMutableArray array];
        
        NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Documents/HH"];
        NSFileManager* fm=[NSFileManager defaultManager];
        NSArray *files = [fm subpathsAtPath:imagePath];
        
        
        NSInteger i = 0;
        for (NSString *ss in files) {
            
           
                
                [array addObject:[NSString stringWithFormat:@"%@/%@",imagePath,ss]];
                
           
            
            
            i++;
            
        }
        
        
        self.myArray = [NSArray arrayWithArray:array];

        
        
        UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"舍弃草稿", @"保存草稿", nil];
        [as showInView:self.view];
        
    }
    
    
    
    
    
    
}


#pragma mark - 协议上的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"选中了第%ld个按钮", buttonIndex);
    
    
    if (buttonIndex == 0) {
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work1",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work2",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work3",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work4",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work5",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work6",self.Judgment]];
        [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work7",self.Judgment]];
        [self.Defaults synchronize];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *imagePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Documents/HH"];
        [fileManager removeItemAtPath:imagePath error:nil];
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
    if (buttonIndex == 1) {
        
        [self.Defaults setObject:self.work1 forKey:[NSString stringWithFormat:@"%@work1",self.Judgment]];
        [self.Defaults setObject:self.work2 forKey:[NSString stringWithFormat:@"%@work2",self.Judgment]];
        [self.Defaults setObject:self.work3 forKey:[NSString stringWithFormat:@"%@work3",self.Judgment]];
        [self.Defaults setObject:self.work4 forKey:[NSString stringWithFormat:@"%@work4",self.Judgment]];
        [self.Defaults setObject:self.textView.text forKey:[NSString stringWithFormat:@"%@work5",self.Judgment]];
        
        //        [self.Defaults setObject:self.myArray forKey:[NSString stringWithFormat:@"%@work6",self.Judgment]];
        
        [self.Defaults setObject:@"设计管家" forKey:[NSString stringWithFormat:@"%@work7",self.Judgment]];
        [self.Defaults synchronize];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    if (buttonIndex == 2) {
        return;
    }
    
    
    
}



-(void)send
{
    
    
    NSLog(@"------------%lu",self.imageDataSource.count);
    
    
    if ([self.Judgment isEqualToString:@"4"]) {
        
        
        
        if (self.work1.length == 0) {
            [self showAllTextDialog:@"你还没有为星级打分"];
            
        }
        else if (self.textView.text.length == 0){
            
            
            [self showAllTextDialog:@"请写点评价内容"];
            
            
        }else{
            
            
            
            
            UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"感谢您的点评" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            aler.tag = 888;
            [aler show];
            [self.view addSubview:aler];
            
            
            NSLog(@"感谢您的点评");
            
        }

        
        
    }else{
    
        if (self.work1.length == 0) {
            [self showAllTextDialog:@"你还没有为星级打分"];
            
        }else if (self.work2.length == 0 || self.work3.length == 0 || self.work4.length == 0){
            
            [self showAllTextDialog:@"你还没有为星级打分"];
        }
        
        else if (self.textView.text.length == 0){
            
            
            [self showAllTextDialog:@"请写点评价内容"];
            
            
        }else{
            
            
            
            
            UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"感谢您的点评" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            aler.tag = 888;
            [aler show];
            [self.view addSubview:aler];
            
            
            NSLog(@"感谢您的点评");
            
        }
        

    }
    
    
    
}


-(void)showAllTextDialog:(NSString *)str
{
    _hub = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hub];
    _hub.labelText = str;
    _hub.contentColor = [UIColor blackColor];
    _hub.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的位置，不指定则在屏幕中间显示
    //    HUD.yOffset = 100.0f;
    //    HUD.xOffset = 100.0f;
    
    [_hub showAnimated:YES whileExecutingBlock:^{
        sleep(1.5);
    } completionBlock:^{
        [_hub removeFromSuperview];
        _hub = nil;
    }];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    
    
  
    
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work1",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work2",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work3",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work4",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work5",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work6",self.Judgment]];
    [self.Defaults setObject:@"" forKey:[NSString stringWithFormat:@"%@work7",self.Judgment]];
    [self.Defaults synchronize];
    
    self.hidesBottomBarWhenPushed = YES;
    CommentListController *clv = [[CommentListController alloc]init];
    [self.navigationController pushViewController:clv animated:YES];
    self.hidesBottomBarWhenPushed = NO;


    
}

//1秒定位结束
-(void)createTime
{
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(dismissAlertView)
                                   userInfo:nil
                                    repeats:NO];
    
    
}

-(void)dismissAlertView
{
    
    
    
    [self.HHView removeFromSuperview];
    
}


-(BOOL)textViewShouldEndEditing:(UITextView *)textView{

    

    if ([textView.text hasPrefix:@" "]) {
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        label.text = @"请输入评价内容";
        label.font = [UIFont systemFontOfSize:12];
        label.frame =CGRectMake(8, 3, SCREENWIDTH - 40, 21);
        label.textColor = [UIColor grayColor];
        [self.textView addSubview:label];
    }
    return YES;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    [self.label removeFromSuperview];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


-(void)setUpPhotosView
{
    if (!self.photosView)
    {
        self.photosView = [[MKMessagePhotoView alloc]initWithFrame:CGRectMake(0,-7,SCREENWIDTH, 80)];
        
        self.photosView.JudgmentImage = @"是";
        [self.mylabel addSubview:self.photosView];
        
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
