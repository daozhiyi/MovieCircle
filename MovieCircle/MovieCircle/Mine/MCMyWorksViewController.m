//
//  MCMyWorksViewController.m
//  MovieCircle
//
//  Created by yuqiang on 15/7/23.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMyWorksViewController.h"

@interface MCMyWorksViewController ()

@end

@implementation MCMyWorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的作品";
    // Do any additional setup after loading the view.
}

-(void)customView
{
    self.myWorksTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - 64 - 49) style:UITableViewStyleGrouped];
    self.myWorksTable.dataSource = self;
    self.myWorksTable.delegate = self;
    [self.view addSubview:self.myWorksTable];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //    if (cell == nil) {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.textLabel.text = @"123";
    return cell;
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
