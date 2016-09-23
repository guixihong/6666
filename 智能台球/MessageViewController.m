//
//  MessageViewController.m
//  智能台球
//
//  Created by gui xihong on 16/9/22.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息列表";
    [self createTableView];
    [self createLeftItem];
}

-(void)createLeftItem{
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(0, 0, 12, 20);
    [Btn setBackgroundImage:[[UIImage imageNamed:@"back.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickLeft{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeMessageState" object:nil];

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 创建tableView
-(void)createTableView
{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 65) style:UITableViewStylePlain];
    
    self.tableView.separatorColor = [UIColor grayColor];
    self.tableView.rowHeight = 77;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"mycellID"];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
}

-(NSMutableArray *)dataSource
{
    
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}



#pragma mark - 实现代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 11;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyMessageTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"mycellID" forIndexPath:indexPath];
//    cell.model = self.dataSource[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MessageDitailViewController *ditail = [[MessageDitailViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:ditail animated:YES];
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
