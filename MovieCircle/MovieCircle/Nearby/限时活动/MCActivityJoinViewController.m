//
//  MCActivityJoinViewController.m
//  MovieCircle
//
//  Created by yuqiang on 15/8/30.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCActivityJoinViewController.h"

#import "MCActivityDetailViewController.h"

@interface MCActivityJoinViewController ()

@end

@implementation MCActivityJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"参加";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:},nil]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kYellowColor}];
    
    self.activityJoinTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.activityJoinTable.dataSource = self;
    self.activityJoinTable.delegate = self;
    self.activityJoinTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.activityJoinTable];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    if (indexPath.section == 0) {
        
        //图片
        UIImageView *movieImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 90, 62)];
        movieImage.image = [[MCImageCache sharedInstance]imageNamed:@"tu1"];
        [cell.contentView addSubview:movieImage];
        
        //标题
        UILabel *activityTitle = [[UILabel alloc]initWithFrame:CGRectMake(movieImage.right + 20, movieImage.top, kDeviceWidth - movieImage.right - 25, 20)];
        activityTitle.text = @"探班成龙《神话》剧组";
        activityTitle.font = kCellTextFont;
        [cell.contentView addSubview:activityTitle];
        
        //时间
        UILabel *activityTime = [[UILabel alloc]initWithFrame:CGRectMake(activityTitle.left + 10, activityTitle.bottom + 10, kDeviceWidth - activityTitle.left - 15, 15)];
        activityTime.text = @"05-02 周六19:30-21:30";
        activityTime.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:activityTime];
        
        //地点
        UILabel *activityPlace = [[UILabel alloc]initWithFrame:CGRectMake(activityTime.left, activityTime.bottom, activityTime.width, activityTime.height)];
        activityPlace.text = @"北京市海淀区人民大学";
        activityPlace.font = activityTime.font;
        [cell.contentView addSubview:activityPlace];
        
        //限制人数
        UILabel *limitPeopleCount = [[UILabel alloc]initWithFrame:CGRectMake(movieImage.left + 5, movieImage.bottom + 10, kDeviceWidth/2 - 10, 20)];
        limitPeopleCount.text = @"限30人参加";
        limitPeopleCount.font = kCellTextFont;
        [cell.contentView addSubview:limitPeopleCount];
        
        //参加人数
        UILabel *joinPeopleCount = [[UILabel alloc]initWithFrame:CGRectMake(limitPeopleCount.right, limitPeopleCount.top, limitPeopleCount.width, limitPeopleCount.height)];
        joinPeopleCount.text = @"参加人数:98";
        joinPeopleCount.font = kCellTextFont;
        joinPeopleCount.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:joinPeopleCount];
        
    }else{
        
        //图片
        UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        userImage.image = [[MCImageCache sharedInstance]imageNamed:@"tu1"];
        [cell.contentView addSubview:userImage];
        
        //用户名
        UILabel *userName = [[UILabel alloc]initWithFrame:CGRectMake(userImage.right + 10, userImage.top + 5, 100, 20)];
        userName.text = @"用户1";
        userName.font = kCellTextFont;
        [cell.contentView addSubview:userName];
        
        //等级图片
        UIImageView *userGradeImage = [[UIImageView alloc]initWithFrame:CGRectMake(userName.right, userName.top, 20, 20)];
        userGradeImage.image = [[MCImageCache sharedInstance]imageNamed:@"biaoqian2"];
        [cell.contentView addSubview:userGradeImage];
        
        //等级label
        UILabel *userGradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(userGradeImage.right, userGradeImage.top, 100, 20)];
        userGradeLabel.text = @"LV30";
        userGradeLabel.font = [UIFont systemFontOfSize:11];
        [cell.contentView addSubview:userGradeLabel];
        
        //描述
        UILabel *userDescribeLabel = [[UILabel alloc]initWithFrame:CGRectMake(userName.left + 5, userName.bottom + 5, kDeviceWidth - userName.left - 10, 20)];
        userDescribeLabel.text = @"超级喜欢成龙大哥的，给我个机会吧~~";
        userDescribeLabel.font = [UIFont systemFontOfSize:11];
        [cell.contentView addSubview:userDescribeLabel];
    }
    
    return cell;
    
}

#pragma mark -- UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 112;
    }else{
        return 60;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return FLT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
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
