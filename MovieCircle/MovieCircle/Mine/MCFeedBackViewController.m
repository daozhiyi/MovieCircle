//
//  MCFeedBackViewController.m
//  MovieCircle
//
//  Created by yuqiang on 15/7/23.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCFeedBackViewController.h"

@interface MCFeedBackViewController ()

@end

@implementation MCFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    [self customView];
    // Do any additional setup after loading the view.
}

-(void)customView
{
    self.feedbackTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, kDeviceWidth - 40, 180)];
    self.feedbackTextView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.feedbackTextView];
    
    UIButton *feedbackSubmit = [UIButton buttonWithType:UIButtonTypeCustom];
    feedbackSubmit.frame = CGRectMake(20, self.feedbackTextView.bottom + 20, self.feedbackTextView.width, 40);
    [feedbackSubmit setTitle:@"提交" forState:UIControlStateNormal];
    feedbackSubmit.backgroundColor = [UIColor redColor];
    [self.view addSubview:feedbackSubmit];
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
