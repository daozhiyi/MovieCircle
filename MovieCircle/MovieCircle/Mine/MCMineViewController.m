//
//  MCMineViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMineViewController.h"

#import "MCMineButton.h"

#import "MCFeedBackViewController.h"

@interface MCMineViewController ()

@end

@implementation MCMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
//    self.title.
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    // Do any additional setup after loading the view.
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 40, 20);
    [rightButton setTitle:@"反馈" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(handleRightButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    [self customView];
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
    
    //签到
    UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signInButton.frame = CGRectMake(userName.right + 15, userName.top + 2, 50, 21);
    [signInButton setTitle:@"签到" forState:UIControlStateNormal];
    [signInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    signInButton.layer.borderColor = [UIColor blackColor].CGColor;
    signInButton.layer.borderWidth = 1;
    [headView addSubview:signInButton];
    
    //我的表
    self.mineTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.mineTable.dataSource = self;
    self.mineTable.delegate = self;
    self.mineTable.tableHeaderView = headView;
    [self.view addSubview:self.mineTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }else if (section == 2){
        return 3;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"我的资产",@"我的奖励",@"我的收藏"];
        for (int i = 0; i < 3; i++) {
            MCMineButton *mineButton = [MCMineButton buttonWithType:UIButtonTypeCustom];
            mineButton.frame = CGRectMake(kDeviceWidth/3 * i, 0, kDeviceWidth/3, 76);
            [mineButton setTitle:titleArray[i] forState:UIControlStateNormal];
            [cell.contentView addSubview:mineButton];
        }
        
    }else if (indexPath.section == 1){
        NSArray *titleArray = @[@"个人资料",@"我的作品",@"我的群组"];
        cell.imageView.image = [[MCImageCache sharedInstance]imageNamed:@"neigou_selected@2x"];
        cell.textLabel.text = titleArray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    }else if (indexPath.section == 2){
        NSArray *titleArray = @[@"我的认领",@"我的认证",@"我的活动"];
        cell.imageView.image = [[MCImageCache sharedInstance]imageNamed:@"neigou_selected@2x"];
        cell.textLabel.text = titleArray[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    }
    else{
        cell.imageView.image = [[MCImageCache sharedInstance]imageNamed:@"neigou_selected@2x"];
        cell.textLabel.text = @"设置";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
//    cell.imageView.backgroundColor = [UIColor redColor];
    
    //    }
    
    return cell;
}

#pragma mark -- UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 76;
    }else{
        return 44;
    }
}

#pragma mark -- handleButtonAction
-(void)handleRightButton
{
    MCFeedBackViewController *feedback = [[MCFeedBackViewController alloc]init];
    [self.navigationController pushViewController:feedback animated:YES];
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
