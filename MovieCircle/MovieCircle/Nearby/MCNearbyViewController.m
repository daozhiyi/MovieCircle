//
//  MCNearbyViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCNearbyViewController.h"

#import "MCNextViewController.h"

@interface MCNearbyViewController ()

@end

@implementation MCNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"附近";
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    [self customView];
    // Do any additional setup after loading the view.
}

-(void)customView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(handleButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)handleButton
{
    [self.navigationController pushViewController:[MCNextViewController new] animated:YES];
}

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
