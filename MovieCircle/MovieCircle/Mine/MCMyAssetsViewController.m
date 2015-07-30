//
//  MCMyAssetsViewController.m
//  MovieCircle
//
//  Created by yuqiang on 15/7/26.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMyAssetsViewController.h"

@interface MCMyAssetsViewController ()

@end

@implementation MCMyAssetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的资产";
    [self customView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customView
{
    //表头
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 150)];
    headView.backgroundColor = [UIColor whiteColor];
    
    //头像
    UIImageView *userHeadImage = [[UIImageView alloc]initWithFrame:CGRectMake(kDeviceWidth/2 - 60, 0, 120, 125)];
    //    userHeadImage.backgroundColor = [UIColor redColor];
    userHeadImage.image = [[MCImageCache sharedInstance]imageNamed:@"touxiang"];
    [headView addSubview:userHeadImage];
    
    //用户名
    UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(0, userHeadImage.bottom, kDeviceWidth/2, 25)];
    userName.text = @"刘德华";
    userName.textAlignment = NSTextAlignmentRight;
    [headView addSubview:userName];
    
    //我的资产表
    self.myAssetsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.myAssetsTable.dataSource = self;
    self.myAssetsTable.delegate = self;
    self.myAssetsTable.tableHeaderView = headView;
//    self.myAssetsTable.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.myAssetsTable];
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    if (indexPath.section == 0) {
        UILabel *myGoods = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, kDeviceWidth - 10, 30)];
        myGoods.text = @"我的宝贝";
        [cell.contentView addSubview:myGoods];
        
        for (int i = 0; i < 3; i++) {
            CGFloat goodsImageW = (kDeviceWidth - 40)/3;
            self.goodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(5 + (goodsImageW + 15)*i, myGoods.bottom, goodsImageW, goodsImageW/90*70)];
            self.goodsImage.backgroundColor = [UIColor redColor];
            [cell.contentView addSubview:self.goodsImage];
        }
    }else{
        UILabel *myProps = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, kDeviceWidth - 10, 30)];
        myProps.text = @"我的道具";
        [cell.contentView addSubview:myProps];
    }
    
    cell.textLabel.text = @"123";
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

#pragma mark -- UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 10;
    }else{
        return FLT_MIN;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 125;
    }else{
        return 44;
    }
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
