//
//  CommentListController.m
//  智能台球
//
//  Created by sunchao on 16/9/13.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "CommentListController.h"

static NSString * cellID1 = @"cellID";
static NSString * cellID2 = @"cellID2";


@interface CommentListController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation CommentListController
{

    UIButton *zjpjBtn;//追加评价
    UIView *bottomView;//全部选择,删除底部 view
    UIButton *lbottom;// 全部选择
    UIButton *rbottom;//删除
    NSMutableArray *cellArr;//存放所有 cell 数组
}

-(NSMutableArray *)dataSource{
    
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT-113+64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    cellArr = [NSMutableArray array];
    self.title = @"设计管家";
    
    [self createLeftItem];
    [self createRightItem];
    [self loadData];
    [self tableViewInit];
    [self createZJPJ];
    [self createBottomView];
}

-(void)tableViewInit{
    
    [self.view addSubview:self.tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"CommentListCell" bundle:nil] forCellReuseIdentifier:cellID1];
    
}

-(void)createRightItem{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(clickRight:)];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:14],NSFontAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[item];

}

-(void)loadData{
    
    CommentListModel *model = [[CommentListModel alloc]init];
    model.time = @"2016-09-10 12:12";
    model.detail = @"qwertyulkjhgfds根据国家";
    model.starNum = 1;
    
    CommentListModel *model2 = [[CommentListModel alloc]init];
    model2.time = @"2017-09-10 12:12";
    model2.starNum = 3;
    model2.detail = @"qwertyulkjhgfds根据国家qwertyulkjhgfds根据国家qwertyulkjhgfds 根据国家";

    
    CommentListModel *model3 = [[CommentListModel alloc]init];
    model3.time = @"2018-09-10 12:12";
    model3.starNum = 5;
    model3.detail = @"根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家根据国家";
    
    [self.dataSource addObjectsFromArray:@[model,model2,model3]];

}

-(void)createZJPJ{

    zjpjBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zjpjBtn.frame = CGRectMake(SCREENWIDTH - 110, SCREENHEIGHT-110, 100, 35);
    [self.view addSubview:zjpjBtn];
    [zjpjBtn setTitle:@"追加评价" forState: UIControlStateNormal];
    zjpjBtn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    zjpjBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [zjpjBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    zjpjBtn.layer.borderWidth = 1;
    zjpjBtn.layer.masksToBounds = YES;
    zjpjBtn.layer.cornerRadius = 4;
    [zjpjBtn addTarget:self action:@selector(clickZJPJ) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickZJPJ{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createLeftItem{
    
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame = CGRectMake(0, 0, 12, 20);
    [Btn setBackgroundImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:Btn];
    [Btn addTarget:self action:@selector(clickLeft) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickLeft{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)clickRight:(UIBarButtonItem *)item{
    
    if (_dataSource.count == 0) {
        return;
    }
    
    if (_tableView.isEditing == NO) {
        [self changeCellSelectionStyle:1];
        _tableView.allowsMultipleSelectionDuringEditing = YES;
        [_tableView setEditing:YES animated:YES];
        item.title = @"取消";
        [UIView animateWithDuration:0.2 animations:^{
            
            CGRect rect = zjpjBtn.frame;
            rect.origin.y = SCREENHEIGHT - 110+50;
            zjpjBtn.frame = rect;
            
            CGRect rect1 = bottomView.frame;
            rect1.origin.y = SCREENHEIGHT - 110;
            bottomView.frame = rect1;
        }];
        
    }else{
        [self changeCellSelectionStyle:0];

        [_tableView setEditing:NO animated:YES];
        _tableView.allowsMultipleSelectionDuringEditing = NO;
        item.title = @"编辑";

        [UIView animateWithDuration:0.2 animations:^{
            
            CGRect rect = zjpjBtn.frame;
            rect.origin.y = SCREENHEIGHT - 110;
            zjpjBtn.frame = rect;
            
            CGRect rect1 = bottomView.frame;
            rect1.origin.y = SCREENHEIGHT - 110+45;
            bottomView.frame = rect1;
        }];
    }

   
}

-(void)changeCellSelectionStyle:(int)styleIndex{

    if (styleIndex == 0) {
        
        if (cellArr && cellArr.count) {
            
            for ( CommentListCell *cell in cellArr) {
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            

        }
            }else{
                
        if (cellArr && cellArr.count) {
            
            for ( CommentListCell *cell in cellArr) {
                
                cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                
            }

        }
                
    }
}

-(void)createBottomView{
    
    bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-110+46, SCREENWIDTH, 47)];
    bottomView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self.view addSubview:bottomView];
    
    lbottom = [UIButton buttonWithType:UIButtonTypeCustom];
    lbottom.frame = CGRectMake(10, 5, 80, 35);
    lbottom.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [lbottom setTitle:@"全部选择" forState: UIControlStateNormal];
    [lbottom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    lbottom.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
    lbottom.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [lbottom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    lbottom.layer.borderWidth = 1;
    lbottom.layer.masksToBounds = YES;
    lbottom.layer.cornerRadius = 4;
    [lbottom addTarget:self action:@selector(selectAll) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:lbottom];
    
    rbottom = [UIButton buttonWithType:UIButtonTypeCustom];
    rbottom.frame = CGRectMake(SCREENWIDTH - 60, 5, 50, 35);
    rbottom.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [rbottom setTitle:@"删除" forState: UIControlStateNormal];
    [rbottom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rbottom.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
    rbottom.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [rbottom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rbottom.layer.borderWidth = 1;
    rbottom.layer.masksToBounds = YES;
    rbottom.layer.cornerRadius = 4;
    [rbottom addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:rbottom];

   
}

-(void)selectAll{

    for (int i = 0; i < _dataSource.count; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [_tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

-(void)deleteClick{

    NSArray *indexPaths = [_tableView indexPathsForSelectedRows];
    NSArray *newIndexPaths = [indexPaths sortedArrayUsingSelector:@selector(compare:)];
    for (int i = (int)newIndexPaths.count - 1; i >= 0; i--) {
        
        NSIndexPath *indexPath = newIndexPaths[i];
        [_dataSource removeObjectAtIndex:indexPath.row];
        
    }
    
    [_tableView deleteRowsAtIndexPaths:newIndexPaths withRowAnimation:UITableViewRowAnimationRight];
    [_tableView reloadData];
    
    
    UIBarButtonItem *item = self.navigationItem.rightBarButtonItem;
    item.title = @"编辑";
    if (_dataSource.count == 0) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            CGRect rect1 = bottomView.frame;
            rect1.origin.y = SCREENHEIGHT - 110+45;
            bottomView.frame = rect1;
            
        }];

    }else{
        
        [_tableView setEditing:NO animated:YES];
        _tableView.allowsMultipleSelectionDuringEditing = NO;
        
        [UIView animateWithDuration:0.2 animations:^{
            
            CGRect rect = zjpjBtn.frame;
            rect.origin.y = SCREENHEIGHT - 110;
            zjpjBtn.frame = rect;
            
            CGRect rect1 = bottomView.frame;
            rect1.origin.y = SCREENHEIGHT - 110+45;
            bottomView.frame = rect1;
        }];
        
    }
 }

#pragma mark - tableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1 forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CommentListModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    [cellArr addObject:cell];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainModel *model = _dataSource[indexPath.row];
    
    CGRect rect = [model.detail boundingRectWithSize:CGSizeMake(SCREENWIDTH-10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil];
    
    if (rect.size.height >29) {
        
        return 175 + rect.size.height - 29;
    }
    
    
    return 175;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
