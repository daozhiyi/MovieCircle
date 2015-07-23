//
//  MCPayViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCPayViewController.h"

#import "MCPayItemButton.h"
@interface MCPayViewController ()

@end

@implementation MCPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购买";
    
    [self customView];
    // Do any additional setup after loading the view.
}

-(void)customView
{
    NSArray *payButtonTitleArray = @[@"买影币",@"买粉币",@"电影票预售",@"购买道具",@"实物拍卖"];
    int num = 3;
    for (int i = 0; i < 2; i ++) {
        if (i == 1) {
            num = 2;
        }
        for (int j = 0; j < num ; j ++) {
            MCPayItemButton *payButton = [MCPayItemButton buttonWithType:UIButtonTypeCustom];
            payButton.frame = CGRectMake(kDeviceWidth/3 * j, kDeviceWidth/3 * i, kDeviceWidth/3, kDeviceWidth/3);
            payButton.tag = 3*i + j;
            [payButton setImage:[[MCImageCache sharedInstance]imageNamed:[NSString stringWithFormat:@"payImage%d",3*i+j]] forState:UIControlStateNormal];
            [payButton setTitle:payButtonTitleArray[3*i +j] forState:UIControlStateNormal];
            payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            [payButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            payButton.imageView.contentMode = UIViewContentModeCenter;
            
//            payButton.imageEdgeInsets = UIEdgeInsetsMake(20 , 20, 20, 20);
            [self.view addSubview:payButton];
        }
    }
}

-(void)handlePayButton:(UIButton *)button
{

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
