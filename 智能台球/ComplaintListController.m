//
//  ComplaintListController.m
//  智能台球
//
//  Created by sunchao on 16/9/14.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "ComplaintListController.h"

static NSString * cellID = @"cellID1";

@interface ComplaintListController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation ComplaintListController

-(NSMutableArray *)dataSource{
    
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT-113+50) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 90;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"投诉列表";
    [self createLeftItem];

    [self.view addSubview:self.tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"ComplaintListCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    [self loadData];
}

-(void)loadData{

    ComplaintListModel *model = [[ComplaintListModel alloc]init];
    model.tszt = @"已结案";
    model.tssj = @"2016-10-10 10:10";
    model.tsnr = @"就爱上飞红沙发都是内定空间撒即可对你说的你犯法的空间的设计上年度房价可能深刻的烦恼年十大健康非农数据可能放大卡时间内答复";
    model.lLabelColor = [UIColor greenColor];
    [self.dataSource addObject:model];
    
    ComplaintListModel *model2 = [[ComplaintListModel alloc]init];
    model2.tszt = @"未结案";
    model2.tssj = @"2019-03-11 10:10";
    model2.tsnr = @"看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就是你的vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对方看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就是你的vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就是你的vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对方看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就是你的vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就是你vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对方看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂就vkjsndvkjnsdkskdnfkjsandkfjnsakdfnksdnfk11谁都能发空间撒地方看撒不到付款吧快速方便快速的部分开始被对看着点能否及时打开不反抗精神的部分款开机不上课记得那年认可你反馈是你发空间按时打发深刻的非农刷卡机带你疯狂";
    model2.lLabelColor = [UIColor redColor];
    [self.dataSource addObject:model2];

    [_tableView reloadData];
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
#pragma mark - tableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        ComplaintListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        ComplaintListModel *model = self.dataSource[indexPath.row];
    
        cell.model = model;
    
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ComplaintListDetailController *cldvc = [[ComplaintListDetailController alloc]init];
    cldvc.model = _dataSource[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cldvc animated:YES];
}

@end
