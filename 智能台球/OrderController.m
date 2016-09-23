//
//  OrderController.m
//  智能台球
//
//  Created by sunchao on 16/9/12.
//  Copyright © 2016年 sunchao. All rights reserved.
//

#import "OrderController.h"

@interface OrderController ()<UITableViewDelegate, UITableViewDataSource,YUFoldingTableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) YUFoldingSectionHeaderArrowPosition arrowPosition;
@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFoldingTableView];
}


// 创建tableView
- (void)setupFoldingTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    YUFoldingTableView *foldingTableView = [[YUFoldingTableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 110)];
    [foldingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell8"];
    [foldingTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    [foldingTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell1" bundle:nil] forCellReuseIdentifier:@"cellID1"];
    [foldingTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell2" bundle:nil] forCellReuseIdentifier:@"cellID2"];
      [foldingTableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell3" bundle:nil] forCellReuseIdentifier:@"cellID3"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREENHEIGHT, 40)];
    label.backgroundColor = [UIColor colorWithRed:239/256.0 green:239/256.0 blue:239/256.0 alpha:1];
    label.text = @"    装修流程";
    label.font = [UIFont systemFontOfSize:15];
    [foldingTableView setTableHeaderView:label];
    foldingTableView.rowHeight = 40;
    foldingTableView.foldingDelegate = self;
    [self.view addSubview:foldingTableView];
}

#pragma mark - YUFoldingTableViewDelegate / required（必须实现的代理）
// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    // 没有赋值，默认箭头在左
    return self.arrowPosition ? :YUFoldingSectionHeaderArrowPositionLeft;
}
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 11;
}
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 1;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 40;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 154;
    }else if (indexPath.section == 1){
    
        return 100;
    }else if (indexPath.section == 2){
        
        return 100;
    }else if (indexPath.section == 3){
        
        return 100;
    }else if (indexPath.section == 4){
        
        return 117;
    }else if (indexPath.section == 5){
        
        return 140;
    }else if (indexPath.section == 6){
        
        return 218;
    }else if (indexPath.section == 7){
        
        return 218;
    }else if (indexPath.section == 8){
        
        return 218;
    }else if (indexPath.section == 9){
        
        return 218;
    }else if (indexPath.section == 10){
        
        return 190;
    }else{
    return 0;
    }
    
    
}
- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView titleForHeaderInSection:(NSInteger)section
{
    
    NSArray *titles = @[@"创建订单",@"支付定金",@"上门量房",@"确认方案",@"签订合同",@"支付收款",@"开工交底",@"隐蔽工程",@"中期验收",@"竣工验收",@"工程变更"];
    
    NSString *ss;
    for (NSInteger i = 0; i < titles.count; i ++) {
        ss = titles[i];
        if (section == i) {
            return ss;
        }
    }
  
      return ss;
}
- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *cellID = @"cellID";
//    UITableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.textLabel.text = @"办理手续齐备       合格     9      点击查看";
//    
//    return cell;
    
    if (indexPath.section == 0) {//创建订单
        OrderTableViewCell2 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID2" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
    }else if (indexPath.section == 1){//支付定金
    
        OrderTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;

        
    }else if (indexPath.section == 2){//上门量房
        
        OrderTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 3){
        
        OrderTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 4){
        
        OrderTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 5){
        
        OrderTableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 6){
        
        OrderTableViewCell1 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 7){
        
        OrderTableViewCell1 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 8){
        
        OrderTableViewCell1 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 9){
        
        OrderTableViewCell1 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else if (indexPath.section == 10){
        
        OrderTableViewCell3 *cell = [yuTableView dequeueReusableCellWithIdentifier:@"cellID3" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:134/256.0 green:173/256.0 blue:93/256.0 alpha:1];
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        return cell;
        
        
    }else{
    
        return nil;
    }
    
    
}
- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [yuTableView deselectRowAtIndexPath:indexPath animated:YES];
    //
    //
    //    ChangeButtonViewController *change = [[ChangeButtonViewController alloc]init];
    //
    //    [self.navigationController pushViewController:change animated:NO];
    
}

#pragma mark - YUFoldingTableViewDelegate / optional （可选择实现的）

//- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView descriptionForHeaderInSection:(NSInteger )section
//{
//    return @"detailText";
//}




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
