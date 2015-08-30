//
//  MCActivityDetailViewController.m
//  MovieCircle
//
//  Created by yuqiang on 15/8/30.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCActivityDetailViewController.h"

#import "MCActivityJoinViewController.h"

@interface MCActivityDetailViewController ()

@end

@implementation MCActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"活动介绍";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:},nil]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kYellowColor}];
    
    self.activityDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.activityDetailTable.dataSource = self;
    self.activityDetailTable.delegate = self;
    self.activityDetailTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.activityDetailTable];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _isPush = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    if (!_isPush) {
        [UIView animateWithDuration:.2 animations:^{
            self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        }];
    }
    
    
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
        
        //活动详情
        UILabel *activityDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(movieImage.left + 5, movieImage.bottom + 10, kDeviceWidth - movieImage.left - 5 - 5, 20)];
        activityDetailLabel.text = @"活动详情";
        activityDetailLabel.font = kCellTextFont;
        [cell.contentView addSubview:activityDetailLabel];
        
        //活动内容
        self.activityContent = [[UILabel alloc]initWithFrame:CGRectMake(activityDetailLabel.left, activityDetailLabel.bottom + 5, activityDetailLabel.width, 40)];
        self.activityContent.text = @"  成龙《神话》剧组全体成员将在北京市海淀区人民大学举办新片宣传活动。在活动期间可以听到演员对影片的一个详细介绍，可与演员面对面活动赢取演员精心为粉丝准备的小礼物。";
        self.activityContent.font = [UIFont systemFontOfSize:11];
        self.activityContent.numberOfLines = 0;
        CGSize contentSize = CGSizeMake(activityDetailLabel.width, 200);
        CGRect contentRect = [self.activityContent.text boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.activityContent.font} context:nil];
        self.activityContent.height = contentRect.size.height;
        [cell.contentView addSubview:self.activityContent];
        
        //限制人数
        UILabel *limitPeopleCount = [[UILabel alloc]initWithFrame:CGRectMake(activityDetailLabel.left, self.activityContent.bottom + 10, kDeviceWidth/2 - 10, 20)];
        limitPeopleCount.text = @"限30人参加";
        limitPeopleCount.font = kCellTextFont;
        [cell.contentView addSubview:limitPeopleCount];
        
        
        //参加人数
        UIButton *joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        joinButton.frame = CGRectMake(kDeviceWidth - 10 - 45, limitPeopleCount.top, 45, limitPeopleCount.height);
        joinButton.backgroundColor = kYellowColor;
        [joinButton setTitle:@"参加" forState:UIControlStateNormal];
        joinButton.layer.masksToBounds = YES;
        joinButton.layer.cornerRadius = 2;
        [joinButton addTarget:self action:@selector(handleJoinButton) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:joinButton];
        
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
        return 112 + 30 + self.activityContent.height;
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

#pragma mark -- handleButtonAction
-(void)handleJoinButton
{
    MCActivityJoinViewController *activity = [[MCActivityJoinViewController alloc]init];
    _isPush = YES;
    [self.navigationController pushViewController:activity animated:YES];
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
