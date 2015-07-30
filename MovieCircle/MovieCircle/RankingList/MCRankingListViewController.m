//
//  MCRankingListViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCRankingListViewController.h"

@interface MCRankingListViewController ()

@end

@implementation MCRankingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"排行榜";
    [self customView];
    // Do any additional setup after loading the view.
}

-(void)customView
{
    self.rankingListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.rankingListTable.dataSource = self;
    self.rankingListTable.delegate = self;
    [self.view addSubview:self.rankingListTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }else {
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    if (indexPath.section == 0) {
        UIImageView *firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, kDeviceWidth/2 - 10, kRatioWidth(200))];
        firstImage.image = [[MCImageCache sharedInstance]imageNamed:@"yingshi2"];
        [cell.contentView addSubview:firstImage];
        
        for (int i = 0; i < 2; i ++) {
            for (int j = 0; j < 2; j++) {
                CGFloat imageWidth = kDeviceWidth/4 - 10;
                CGFloat imageHeight = firstImage.height/2 - 10;
                UIImageView *smallImage = [[UIImageView alloc]initWithFrame:CGRectMake((imageWidth  + 10)* j + kDeviceWidth/2 + 5, (10 +imageHeight+10)*i + 10 , imageWidth, imageHeight)];
                smallImage.image = [[MCImageCache sharedInstance]imageNamed:@"yingshi2"];
                [cell.contentView addSubview:smallImage];
            }
        }
    }else if (indexPath.section == 1){
        UIImageView *userHeadImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kDeviceWidth/4 - 20, kDeviceHeight * (kDeviceWidth/2 - 5)/kDeviceWidth/2 - 10)];
        userHeadImage.image = [[MCImageCache sharedInstance]imageNamed:@"yingshi2"];
        [cell.contentView addSubview:userHeadImage];
    }
    return cell;
    
}

#pragma mark -- UITableViewDelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 10;
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return FLT_MIN;
//}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"魅力榜";
    }else if (section == 1){
        return @"消费榜";
    }else{
        return @"群组榜";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kRatioWidth(200) + 20;
    }else{
        return kDeviceHeight * (kDeviceWidth/2 - 5)/kDeviceWidth/2 - 10 + 20;
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
