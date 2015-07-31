//
//  MCKnowMovieViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCKnowMovieViewController.h"

@interface MCKnowMovieViewController ()

@end

@implementation MCKnowMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"识影";
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    [self customView];
    
    
    
    //请求数据
    [self testRequest];
    
    // Do any additional setup after loading the view.
}

-(void)customView
{
    //people类别
    for (int i = 0; i < 4; i ++) {
        NSArray *titleArray = @[@"全部",@"男",@"女",@"儿童"];
        UIButton *peopleCategory = [UIButton buttonWithType:UIButtonTypeCustom];
        peopleCategory.frame = CGRectMake(kDeviceWidth/4 * i, 0, kDeviceWidth/4, kTableViewCellHeight);
        [peopleCategory setTitle:titleArray[i] forState:UIControlStateNormal];
        [peopleCategory setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [peopleCategory setTitleColor:kYellowColor forState:UIControlStateSelected];
        [peopleCategory addTarget:self action:@selector(handlePeopleCategory:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            peopleCategory.selected = YES;
            self.peopleSelected = peopleCategory;
        }
        //        [self.navigationItem.titleView addSubview:peopleCategory];
        //        self.navigationItem.titleView = peopleCategory;
        [self.navigationController.navigationBar addSubview:peopleCategory];
    }
    
    //cloth类别
    for (int j = 0; j < 6; j ++) {
        NSArray *titleArray = @[@"全部",@"鞋子",@"裙子",@"袜子",@"包",@"短裤"];
        UIButton *clothCategory = [UIButton buttonWithType:UIButtonTypeCustom];
        clothCategory.frame = CGRectMake(kDeviceWidth/6 * j, 0, kDeviceWidth/6, 40);
        [clothCategory setTitle:titleArray[j] forState:UIControlStateNormal];
        [clothCategory setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [clothCategory setTitleColor:kYellowColor forState:UIControlStateSelected];
        [clothCategory addTarget:self action:@selector(handleClothCategory:) forControlEvents:UIControlEventTouchUpInside];
        if (j == 0) {
            clothCategory.selected = YES;
            self.clothSelected = clothCategory;
        }
        [self.view addSubview:clothCategory];
        
    }
    
    self.knowMovieTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, kDeviceWidth, kDeviceHeight - 64 - 49 -40) style:UITableViewStylePlain];
    self.knowMovieTable.dataSource = self;
    self.knowMovieTable.delegate = self;
    [self.view addSubview:self.knowMovieTable];

}

#pragma mark -- handleButtonAction
-(void)handlePeopleCategory:(UIButton *)button
{
    if (self.peopleSelected != button) {
        self.peopleSelected.selected = NO;
        button.selected = YES;
        self.peopleSelected = button;
    }
}

- (void)handleClothCategory:(UIButton *)button
{
    if (self.clothSelected != button) {
        self.clothSelected.selected = NO;
        button.selected = YES;
        self.clothSelected = button;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//http://182.92.222.50/index.php?s=App/get_list&limit=6
//http://182.92.103.164:9000/yingshiquanApp/index.php?g=Portal&m=common&a=goodsSmallCategory

#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        //大图
        UIImageView *movieGoodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kDeviceWidth - 20, 180)];
//        movieGoodsImage.backgroundColor = [UIColor redColor];
        movieGoodsImage.image = [[MCImageCache sharedInstance]imageNamed:@"yingshi1"];
        [cell.contentView addSubview:movieGoodsImage];
        
        //同款
        UIImageView *similarImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 250 - 100, 70, 90)];
//        similarImage.backgroundColor = [UIColor blueColor];
        similarImage.image = [[MCImageCache sharedInstance]imageNamed:@"yingshi2"];
        [cell.contentView addSubview:similarImage];
        
        //电影名字
        UILabel *movieName = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2, movieGoodsImage.bottom, kDeviceWidth/2, 30)];
        movieName.text = @"《速度与激情7》";
        [cell.contentView addSubview:movieName];
        
        //同款描述
        UILabel *similarLabel = [[UILabel alloc]initWithFrame:CGRectMake(movieName.left, movieName.bottom, movieName.width, movieName.height)];
        similarLabel.text = @"豪伦诗极速系列耳麦";
        similarLabel.textColor = [UIColor grayColor];
        similarLabel.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:similarLabel];
    }
    return cell;
}

#pragma mark -- UITableViewDelegate 
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

-(void)testRequest
{
    __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中";
    
    [[MCRequestManager sharedInstance]goodsBigCategoryWithSuccess:^(id data) {
        DLog(@"%@",data);
        NSString *string = [data[0] valueForKey:@"id"];
        DLog(@"%@",string);
//        DLog(@"%@",[data objectFromJSONString]);//转为json
        [hud hide:YES afterDelay:.5];
    } failure:^(NSError *error) {
        DLog(@"%@",error);
        DLog(@"%@",[error description]);
        
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"加载失败，请重试";
        [hud hide:YES afterDelay:1];
    }];
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
