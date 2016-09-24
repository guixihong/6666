//
//  MainViewController.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "MainViewController.h"

static NSString * cellID1 = @"cellID1";
static NSString * cellID2 = @"cellID2";
static NSString * cellID3 = @"cellID3";

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)NSMutableArray * imageSource;

@end

@implementation MainViewController
{

    UIView *myHeaderView;//tableHeaderView
    NSArray *arr2;//电话
    NSArray *arr3;//分类名称
    UIImageView *titleImage;//导航栏顶部 image
    UIButton *rightButton;//
    KHListModel *khlModel;
}
-(NSMutableArray *)dataSource{
    
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(NSMutableArray *)imageSource{
    
    if (_imageSource == nil) {
        _imageSource = [NSMutableArray array];
    }
    return _imageSource;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT-113) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = COLOR(239, 239, 239, 1);
    }
    
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //设置 titleImage
    titleImage = [[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH -120)/2,11,120, 22)];
    titleImage.image = [UIImage imageNamed:@"navigation-logo"];
    [self.navigationController.navigationBar addSubview:titleImage];
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    [titleImage removeFromSuperview];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"";
    self.tabBarItem.title = @"主页";
    [self createRight];
    [self.view addSubview:self.tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"MainCell1" bundle:nil] forCellReuseIdentifier:cellID1];
    [_tableView registerNib:[UINib nibWithNibName:@"MainCell2" bundle:nil] forCellReuseIdentifier:cellID2];
    [_tableView registerNib:[UINib nibWithNibName:@"MainCell3" bundle:nil] forCellReuseIdentifier:cellID3];
    [self loadData];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMessageState) name:@"changeMessageState" object:nil];
    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 30, 30)];
//    [self.view addSubview:button];
//    [button sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://111.200.41.23:8090/yblimg/gcys/201608/0022280002-0002-03-290849242357638573.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
//        [button sd_setImageWithURL:[NSURL URLWithString:@"http://111.200.41.23:8090/yblimg/gcys/201608/0022280002-0002-03-290849242357638573.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];

}

-(void)changeMessageState{
    
    [rightButton setBackgroundImage:[UIImage imageNamed:@"没消息"] forState:UIControlStateNormal];
}

-(void)createRight{

    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0,0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"有消息"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(clickRight) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickRight{

    MessageViewController *message = [[MessageViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:message animated:YES];
    self.hidesBottomBarWhenPushed=NO;

//    self.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:pvc animated:YES];
//    self.hidesBottomBarWhenPushed=NO;

}

-(void)loadData2{

     [NetworkRequest requestWithURLString:@"http://111.200.41.23:8090/userapp?funname=getYsjl&khbh=0022280" parameters:nil type:HttpRequestTypeGet success:^(id responseObject) {
    
         NSDictionary *dic = [self parseJSONStringToNSDictionary:responseObject];
         NSArray *arr = [dic objectForKey:@"data"];

         self.dataSource = [MainModel arrayOfModelsFromDictionaries:arr error:nil];
         [_tableView reloadData];
                  
  } failure:^(NSError *error) {
    
      
  }];

    
}

-(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    
    return responseJSON;
}


-(void)loadData{

    //http://111.200.41.23:8090/userapp?funname=getKhxx&khbh=0022280
    [NetworkRequest requestWithURLString:@"http://111.200.41.23:8090/userapp?funname=getKhxx&khbh=0022280" parameters:nil type:HttpRequestTypeGet success:^(id responseObject) {

        NSString *str = responseObject;
        khlModel = [[KHListModel alloc]initWithString:str error:nil];
        
        [self createTableHeaderView];
        [self loadData2];
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)createTableHeaderView{
    
    myHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 487)];
    myHeaderView.backgroundColor = COLOR(239, 239, 239, 1);
    _tableView.tableHeaderView = myHeaderView;
    
    UIImageView *bottom = [[UIImageView alloc]initWithFrame:CGRectMake(3,365, SCREENWIDTH-6, 120)];
    bottom.contentMode = UIViewContentModeScaleAspectFit;
    bottom.image = [UIImage imageNamed:@"中间插图"];
    [myHeaderView addSubview:bottom];

    [self createTitleView];
}

-(void)createTitleView{
    
    UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 70)];
    myLabel.backgroundColor = [UIColor whiteColor];
    UILabel *myLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(35, 5,[UIScreen mainScreen].bounds.size.width, 20)];
    myLabel1.text = @"  房屋地址：";
    myLabel1.font = [UIFont systemFontOfSize:15];
    UILabel *myLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(45, 30,[UIScreen mainScreen].bounds.size.width-45,35)];
//    myLabel2.text = @"北京市朝阳区将台路普天科技创业园5号院16号楼 普天科技创业园5号院16号楼";
    myLabel2.text = khlModel.work_address;
    myLabel2.font = [UIFont systemFontOfSize:14];
    if (SCREENWIDTH == 320) {
        
        myLabel1.font = [UIFont systemFontOfSize:13];
        myLabel2.font = [UIFont systemFontOfSize:12];
        
    }
    myLabel2.numberOfLines = 0;
    //[UIColor colorWithRed:121/256.0 green:123/256.0 blue:130/256.0 alpha:1];
    myLabel2.textColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(7,12, 20, 20)];
    imageView.image = [UIImage imageNamed:@"房屋住址"];
//    imageView.image = [UIImage imageNamed:_midImg];
    [myHeaderView addSubview:myLabel];
    [myHeaderView addSubview:myLabel1];
    [myHeaderView addSubview:myLabel2];
    [myHeaderView addSubview:imageView];

    
    
//    NSArray *arr1 = @[[NSString stringWithFormat:@"%@%@",@"   客户姓名：",@"赵本山"],[NSString stringWithFormat:@"%@%@",@"   设计管家：",@"赵本山"],[NSString stringWithFormat:@"%@%@",@"   品 控 师  ：",@"赵本山"],[NSString stringWithFormat:@"%@%@",@"   工      长 ：",@"赵本山"],[NSString stringWithFormat:@"%@%@",@"   班      长 ：",@"赵本山"],[NSString stringWithFormat:@"%@%@",@"   开工时间：",@"2016年09月09日"],[NSString stringWithFormat:@"%@%@",@"   竣工时间：",@"2016年09月09日"]];
    NSArray *arr1 = @[[NSString stringWithFormat:@"%@%@",@"   客户姓名：",khlModel.client_name],[NSString stringWithFormat:@"%@%@",@"   设计管家：",khlModel.designer_name],[NSString stringWithFormat:@"%@%@",@"   品 控 师  ：",khlModel.inspector_name],[NSString stringWithFormat:@"%@%@",@"   工      长 ：",khlModel.worker_name],[NSString stringWithFormat:@"%@%@",@"   班      长 ：",khlModel.monitor_name],[NSString stringWithFormat:@"%@%@",@"   开工时间：",khlModel.start_time],[NSString stringWithFormat:@"%@%@",@"   竣工时间：",khlModel.end_time]];
    
//        arr2 = @[[NSString stringWithFormat:@"电话:%@",@"13112345678"],[NSString stringWithFormat:@"电话:%@",@"13112345678"],[NSString stringWithFormat:@"电话:%@",@"13112345678"],[NSString stringWithFormat:@"电话:%@",@"13112345678"],[NSString stringWithFormat:@"电话:%@",@"13112345678"]];
     arr2 = @[[NSString stringWithFormat:@"电话:%@",khlModel.client_phone],[NSString stringWithFormat:@"电话:%@",khlModel.designer_phone],[NSString stringWithFormat:@"电话:%@",khlModel.inspector_phone],[NSString stringWithFormat:@"电话:%@",khlModel.worker_phone],[NSString stringWithFormat:@"电话:%@",khlModel.monitor_phone                                                                                               ]];
        arr3 = @[@"客户姓名",@"设计管家",@"品控师",@"工长",@"班长",@"开工时间",@"竣工时间"];
    
    for (int i = 0;i < 7;i++) {
        
        UILabel *myLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 80 + i*40, [UIScreen mainScreen].bounds.size.width, 30)];
        myLabel.backgroundColor = [UIColor whiteColor];
        myLabel.font = [UIFont boldSystemFontOfSize:14];
        if (SCREENWIDTH == 320) {
            
            myLabel.font = [UIFont boldSystemFontOfSize:12];

            
        }
        [myHeaderView  addSubview:myLabel];
        
        UILabel *nLbel = [[UILabel alloc]init];
        nLbel.frame = CGRectMake(0, 80 + i*40,35, 30);
        nLbel.backgroundColor = [UIColor whiteColor];
        [myHeaderView addSubview:nLbel];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 85 + i*40, 20, 20)];
        
        imageView.image = [UIImage imageNamed:arr3[i]];
        [myHeaderView addSubview:imageView];
        
        if(i < 5){
            
            UILabel *myLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(35, 80 + i*40, [UIScreen mainScreen].bounds.size.width/2, 30)];
            //        myLabel1.backgroundColor = [UIColor redColor];
            [myHeaderView addSubview:myLabel1];
            myLabel1.font = [UIFont systemFontOfSize:14];
            myLabel1.text = arr1[i];
            
            
            UILabel *myBtn = [[UILabel alloc]init];
            myBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 70+70+10, 80 + i*40, [UIScreen mainScreen].bounds.size.width/2, 30);
            myBtn.font = [UIFont systemFontOfSize:14];

            if (SCREENWIDTH == 320) {
                
                myBtn.frame = CGRectMake(SCREENWIDTH/2 - 70+70+10, 80 + i*40,SCREENWIDTH/2, 30);
                myBtn.font = [UIFont systemFontOfSize:12];
                myLabel1.font = [UIFont systemFontOfSize:12];

            }
            [myHeaderView addSubview:myBtn];
            myBtn.text = arr2[i];

            if (i > 0) {
                
                UIButton *phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                phoneBtn.adjustsImageWhenHighlighted = NO;
                phoneBtn.frame = CGRectMake(SCREENWIDTH - 40, 87 + i*40, 15, 15);
                
                if (SCREENWIDTH == 320) {
                    
                    phoneBtn.frame = CGRectMake(SCREENWIDTH - 30, 87 + i*40, 15, 15);

                }
                phoneBtn.tag = i;
                [phoneBtn setBackgroundImage:[UIImage imageNamed:@"拨打电话图标"] forState:UIControlStateNormal];
                [phoneBtn addTarget:self action:@selector(clickTel:) forControlEvents:UIControlEventTouchUpInside];
                [myHeaderView addSubview:phoneBtn];
            }
        
        }
        if (i > 4) {
            
            myLabel.text = arr1[i];
            if(i == 6){
            if ([khlModel.end_time isEqualToString:@""]) {
                
                myLabel.text = [NSString stringWithFormat:@"%@%@",@"   竣工时间：",@"正在施工中"];
            }
            }
            myLabel.textColor = [UIColor orangeColor];
            
        }
      
    }
    
   
}

-(void)clickTel:(UIButton *)btn{

    if (![btn.titleLabel.text isEqualToString:@"电话:--------------"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",[arr2[btn.tag] componentsSeparatedByString:@":"][1]]]];
    }

}


#pragma mark - tableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"+++++++++++++++%lu",(unsigned long)self.dataSource.count);
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainModel *model = _dataSource[indexPath.row];
    if ([model.imageurl containsString:@","]) {
        
        NSArray *arr = [model.imageurl componentsSeparatedByString:@","];
        if (arr.count >1  &&  arr.count < 3 ) {
            
            MainCell1 *cell = [tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
            for (UIButton *Btn in cell.array) {
                
                [Btn addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = self.dataSource[indexPath.row];
            return cell;
            
        }else{
        
            MainCell3 *cell = [tableView dequeueReusableCellWithIdentifier:cellID3 forIndexPath:indexPath];
            for (UIButton *Btn in cell.array) {
                
                [Btn addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = self.dataSource[indexPath.row];
            return cell;

            
        }
        
    }else{
    
        MainCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cellID2 forIndexPath:indexPath];
        for (UIButton *Btn in cell.array) {
            
            [Btn addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.dataSource[indexPath.row];
        return cell;

        
    }
    
    
    return nil;
    
}
    
-(void)click1:(UIButton *)btn{

    
    NSLog(@"%lu",btn.tag);
    switch (btn.tag) {
        case 1:
        case 2:
        case 3:

        {
            NSArray *urls = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=1875d6474334970a47731027a5cbd1c0/51e876094b36acaf9e7b88947ed98d1000e99cc2.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=67ef9ea341166d223877159c76230945/e2f7f736afc3793138419f41e9c4b74543a911b7.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=a18485594e086e066aa83f4332087b5a/4a110924ab18972bcd1a19a2e4cd7b899e510ab8.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=42d17a169058d109c4e3a9bae159ccd0/61f5b2119313b07e550549600ed7912397dd8c21.jpg"];
            Example1ViewController *vc = [[Example1ViewController alloc]init];
            [vc setDataphotos:urls];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
            
        }
            break;
        case 4:
            
        {
            NSArray *urls = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=67ef9ea341166d223877159c76230945/e2f7f736afc3793138419f41e9c4b74543a911b7.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=a18485594e086e066aa83f4332087b5a/4a110924ab18972bcd1a19a2e4cd7b899e510ab8.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=42d17a169058d109c4e3a9bae159ccd0/61f5b2119313b07e550549600ed7912397dd8c21.jpg"];
            Example1ViewController *vc = [[Example1ViewController alloc]init];
            [vc setDataphotos:urls];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;

            
        }
            break;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
            
        {
            NSArray *urls = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=a18485594e086e066aa83f4332087b5a/4a110924ab18972bcd1a19a2e4cd7b899e510ab8.jpg",@"http://imgsrc.baidu.com/forum/w%3D580/sign=42d17a169058d109c4e3a9bae159ccd0/61f5b2119313b07e550549600ed7912397dd8c21.jpg"];
            Example1ViewController *vc = [[Example1ViewController alloc]init];
            [vc setDataphotos:urls];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
            
        }
            break;
            
        default:
            break;
    }
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainModel *model = _dataSource[indexPath.row];
    
    if (model.detail.length) {//有 detail
        
        CGRect rect = [model.detail boundingRectWithSize:CGSizeMake(SCREENWIDTH-69, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil];
        
        if (rect.size.height >29) {
            
            if ([model.imageurl containsString:@","]) {
                
                NSArray *arr = [model.imageurl componentsSeparatedByString:@","];
                if (arr.count < 3 && arr.count >1) {
                    
                    return 151 +rect.size.height-29;

                    
                }else{
                    
                    return 242+rect.size.height-29;
                    
                }
                
            }else{
                
                   return 213+rect.size.height-29;
                
            }
            
            
        }else{
            
            if ([model.imageurl containsString:@","]) {
                
                NSArray *arr = [model.imageurl componentsSeparatedByString:@","];
                if (arr.count < 3 && arr.count >1) {
                    
                    return 151;
                    
                }else{
                    
                    return 242;
                    
                }
                
            }else{
                
                return 213;
                
            }
            
            
        }

    }else{//detail  @""
    
        if ([model.imageurl containsString:@","]) {
            
            NSArray *arr = [model.imageurl componentsSeparatedByString:@","];
            if (arr.count < 3 && arr.count >1) {
                
                return 151-29;
                
            }else{
                
                return 242-29;
                
            }
            
        }else{
            
            return 213-29;
            
        }

        
    }
    
    return 0;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
