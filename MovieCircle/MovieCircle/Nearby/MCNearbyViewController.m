//
//  MCNearbyViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCNearbyViewController.h"


@interface MCNearbyViewController ()

@end

@implementation MCNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

//    self.title = @"附近";
//    self.view.backgroundColor = [UIColor blueColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    self.nearbyTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.nearbyTextField.borderStyle = UITextBorderStyleLine;
    self.nearbyTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.nearbyTextField.layer.borderWidth = .5;
    self.nearbyTextField.delegate = self;
    self.nearbyTextField.returnKeyType = UIReturnKeyDone;
    self.navigationItem.titleView = self.nearbyTextField;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 30, 30);
//    rightButton.backgroundColor = [UIColor redColor];
    [rightButton setBackgroundImage:[[MCImageCache sharedInstance]imageNamed:@"sousuo@2x"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIView *leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    
    
    UIButton *leftButtonMap = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButtonMap.frame = CGRectMake(0, 0, 30, 30);
//    leftButtonMap.backgroundColor = [UIColor blueColor];
    [leftButtonMap setBackgroundImage:[[MCImageCache sharedInstance]imageNamed:@"ditu1@2x"] forState:UIControlStateNormal];
    [leftButtonMap setBackgroundImage:[[MCImageCache sharedInstance]imageNamed:@"ditu2@2x"] forState:UIControlStateSelected];
    leftButtonMap.tag = 101;
    [leftButtonMap addTarget:self action:@selector(handleLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [leftButtonView addSubview:leftButtonMap];
    
    UIButton *leftButtonList = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButtonList.frame = CGRectMake(30, 0, 30, 30);
//    leftButtonList.backgroundColor = [UIColor redColor];
    [leftButtonList setBackgroundImage:[[MCImageCache sharedInstance]imageNamed:@"liebiao1@2x"] forState:UIControlStateNormal];
    [leftButtonList setBackgroundImage:[[MCImageCache sharedInstance]imageNamed:@"liebiao2@2x"] forState:UIControlStateSelected];
    leftButtonList.tag = 102;
    leftButtonList.selected = YES;
    [leftButtonList addTarget:self action:@selector(handleLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [leftButtonView addSubview:leftButtonList];
    
    self.leftButtonSelected = leftButtonList;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButtonView];
    [self customView];
    // Do any additional setup after loading the view.
}

-(void)customView
{
    NSArray *topTabbarTitleArray = @[@"限时活动",@"拍摄中项目",@"已完成项目",@"服务机构",@"附近"];
    
    //按钮
    for (int index = 0; index < 5; index ++) {
        UIButton *topTabbarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        topTabbarButton.frame = CGRectMake(kDeviceWidth/5 * index, 0, kDeviceWidth/5, kTableViewCellHeight);
        topTabbarButton.titleLabel.font = [UIFont systemFontOfSize:12];
        topTabbarButton.tag = index;
        [topTabbarButton setTitle:topTabbarTitleArray[index] forState:UIControlStateNormal];
        [topTabbarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [topTabbarButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [topTabbarButton addTarget:self action:@selector(handleTopTabbarButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if (index > 0) {
            UILabel *buttonLeftLine = [[UILabel alloc]initWithFrame:CGRectMake(0, kTableViewCellHeight/2 -7, 1 , 14)];
            buttonLeftLine.backgroundColor = [UIColor blackColor];
            [topTabbarButton addSubview:buttonLeftLine];
        }else{
            topTabbarButton.selected = YES;
            self.tabbarSelected = topTabbarButton;
        }
        [self.view addSubview:topTabbarButton];
        
    }
    
    //下划线
    UILabel *topBottomLine = [[UILabel alloc]initWithFrame:CGRectMake(0, kTableViewCellHeight, kDeviceWidth, 2)];
    topBottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:topBottomLine];
    
    self.nearbyTable = [[UITableView alloc]initWithFrame:CGRectMake(0, topBottomLine.bottom, kDeviceWidth, kDeviceHeight - topBottomLine.bottom - 64 - 49) style:UITableViewStylePlain];
    self.nearbyTable.dataSource = self;
    self.nearbyTable.delegate = self;
    [self.view addSubview:self.nearbyTable];
    
    //地图
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, topBottomLine.bottom, kDeviceWidth,kDeviceHeight - topBottomLine.bottom - 64 - 49)];
    [self.mapView setZoomLevel:15];
    self.mapView.showMapScaleBar = YES;
    self.mapView.hidden = YES;
    [self.view addSubview:self.mapView];
}

- (void)handleLeftButton:(UIButton *)button
{
    self.leftButtonSelected.selected = NO;
    button.selected = YES;
    self.leftButtonSelected = button;
    if (button.tag == 101) {
        self.mapView.hidden = NO;
    }else{
        self.mapView.hidden = YES;
    }
}

- (void)handleTopTabbarButton:(UIButton *)button
{
    DLog(@"%ld",self.tabbarSelected.tag);
    button.selected = YES;
    if (self.tabbarSelected != button) {
        self.tabbarSelected.selected = NO;
        self.tabbarSelected = button;
    }
    [self.nearbyTable reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        if (self.tabbarSelected.tag == 0 || self.tabbarSelected.tag == 4) {
            [cell.contentView addSubview:[self getActivityView]];
        }else if (self.tabbarSelected.tag == 1 || self.tabbarSelected.tag == 2){
            [cell.contentView addSubview:[self getShootView]];
        }else if (self.tabbarSelected.tag == 3){
            [cell.contentView addSubview:[self getServiceView]];
        }
        
        
        
        
        
//    }
    
    return cell;
}


#pragma mark -- UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}

//服务机构
- (UIView *)getServiceView
{
    UIView *serviceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 82)];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 90, 62)];
//    cellImage.backgroundColor = [UIColor blueColor];
    cellImage.image = [[MCImageCache sharedInstance]imageNamed:@"tu3"];
    [serviceView addSubview:cellImage];
    
    UILabel *serviceCompany = [[UILabel alloc]initWithFrame:CGRectMake(cellImage.right + 15, cellImage.top, kDeviceWidth - 5 - cellImage.right - 15, 20)];
    serviceCompany.text = @"上海影视乐园";
    serviceCompany.font = [UIFont systemFontOfSize:15];
    [serviceView addSubview:serviceCompany];
    
    UILabel *serviceWorkKey = [[UILabel alloc]initWithFrame:CGRectMake(serviceCompany.left, serviceCompany.bottom + 3.5, 70, 10)];
    //        serviceWorkKey.backgroundColor = [UIColor redColor];
    serviceWorkKey.text = @"主营业务有：";
    serviceWorkKey.font = [UIFont systemFontOfSize:11];
    serviceWorkKey.textColor = [UIColor grayColor];
    [serviceView addSubview:serviceWorkKey];
    
    UILabel *serviceWorkValue = [[UILabel alloc]initWithFrame:CGRectMake(serviceWorkKey.right, serviceWorkKey.top - 3.5, kDeviceWidth - 5 - serviceWorkKey.right, 30)];
    //        serviceWorkValue.backgroundColor = [UIColor greenColor];
    serviceWorkValue.text = @"景点场地租赁、摄影棚的会展、会务、拍摄租赁";
    serviceWorkValue.textColor = [UIColor grayColor];
    serviceWorkValue.font = [UIFont systemFontOfSize:11];
    serviceWorkValue.numberOfLines = 0;
    [serviceView addSubview:serviceWorkValue];
    
    UILabel *serviceAddress = [[UILabel alloc]initWithFrame:CGRectMake(serviceCompany.left, serviceWorkValue.bottom, kDeviceWidth - 5 - serviceCompany.left, 10)];
    serviceAddress.text = @"公司地址：上海市浦东区科技大厦317";
    serviceAddress.textColor = [UIColor grayColor];
    serviceAddress.font = [UIFont systemFontOfSize:11];
    [serviceView addSubview:serviceAddress];

    return serviceView;
}

//拍摄中
- (UIView *)getShootView
{
    UIView *shootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 82)];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 90, 62)];
//    cellImage.backgroundColor = [UIColor blueColor];
    cellImage.image = [[MCImageCache sharedInstance]imageNamed:@"tu2"];
    [shootView addSubview:cellImage];

    UILabel *movieName = [[UILabel alloc]initWithFrame:CGRectMake(cellImage.right + 15, cellImage.top, 120, 20)];
    movieName.text = @"用户1《栀子花开》";
    movieName.font = [UIFont systemFontOfSize:14];
    [shootView addSubview:movieName];
    
    UILabel *movieTime = [[UILabel alloc]initWithFrame:CGRectMake(movieName.right, movieName.top, kDeviceWidth - 5 - movieName.right, 20)];
    movieTime.text = @"2015-03-21";
    movieTime.font = [UIFont systemFontOfSize:12];
    movieTime.textAlignment = NSTextAlignmentRight;
    [shootView addSubview:movieTime];
    
    UILabel *movieDirector = [[UILabel alloc]initWithFrame:CGRectMake(movieName.left + 5, movieName.bottom, kDeviceWidth - 5 - 5- movieName.left, 10)];
    movieDirector.text = @"导演：何炅";
    movieDirector.textColor = [UIColor grayColor];
    movieDirector.font = [UIFont systemFontOfSize:10];
    [shootView addSubview:movieDirector];
    
    UILabel *movieStar = [[UILabel alloc]initWithFrame:CGRectMake(movieDirector.left, movieDirector.bottom, movieDirector.width, movieDirector.height)];
    movieStar.text = @"主演：蒋劲夫/欧豪/杨洋/马思纯";
    movieStar.textColor = [UIColor grayColor];
    movieStar.font = [UIFont systemFontOfSize:10];
    [shootView addSubview:movieStar];
    
    UILabel *movieType = [[UILabel alloc]initWithFrame:CGRectMake(movieStar.left, movieStar.bottom, movieStar.width, movieStar.height)];
    movieType.text = @"类型：爱情";
    movieType.textColor = [UIColor grayColor];
    movieType.font = [UIFont systemFontOfSize:10];
    [shootView addSubview:movieType];
    
    UILabel *movieCountry = [[UILabel alloc]initWithFrame:CGRectMake(movieType.left, movieType.bottom, movieType.width, movieType.height)];
    movieCountry.text = @"国家/地区：中国大陆";
    movieCountry.textColor = [UIColor grayColor];
    movieCountry.font = [UIFont systemFontOfSize:10];
    [shootView addSubview:movieCountry];
    
    return shootView;
}

-(UIView *)getActivityView
{
    UIView *activityView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 82)];
    
    UIImageView *cellImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 90, 62)];
//    cellImage.backgroundColor = [UIColor blueColor];
    cellImage.image = [[MCImageCache sharedInstance]imageNamed:@"tu1"];
    [activityView addSubview:cellImage];
    
    UILabel *userMessage = [[UILabel alloc]initWithFrame:CGRectMake(cellImage.right + 15, cellImage.top, 120, 20)];
    userMessage.text = @"用户1 LV50";
    userMessage.font = [UIFont systemFontOfSize:14];
    [activityView addSubview:userMessage];
    
    UILabel *movieTime = [[UILabel alloc]initWithFrame:CGRectMake(userMessage.right, userMessage.top, kDeviceWidth - 5 - userMessage.right, 20)];
    movieTime.text = @"2015-03-21";
    movieTime.font = [UIFont systemFontOfSize:12];
    movieTime.textAlignment = NSTextAlignmentRight;
    [activityView addSubview:movieTime];
    
    UILabel *movieDiscription = [[UILabel alloc]initWithFrame:CGRectMake(userMessage.left, userMessage.bottom + 5, kDeviceWidth - 5 - userMessage.left, 20)];
    movieDiscription.text = @"最近拍了一部微电影《纯爱》";
    movieDiscription.font = [UIFont systemFontOfSize:14];
    movieDiscription.textColor = [UIColor grayColor];
    [activityView addSubview:movieDiscription];
    
    UILabel *userText = [[UILabel alloc]initWithFrame:CGRectMake(movieDiscription.left, movieDiscription.bottom, movieDiscription.width, movieDiscription.height)];
    userText.text = @"求各路大神认证......";
    userText.font = [UIFont systemFontOfSize:14];
    userText.textColor = [UIColor grayColor];
    [activityView addSubview:userText];
    
    return activityView;
}

#pragma mark -- UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
